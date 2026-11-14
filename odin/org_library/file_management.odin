package org_library

import "core:os"
import "core:fmt"
import "core:strings"
import "core:path/filepath"

// Leer el nombre del archivo y proceder acorde a lo que es
generate_full_file_path :: proc(filepath: string) -> string {
  full_path: string
  if strings.has_prefix(filepath, "~/") {
    full_path = validate_full_path(filepath)
  } else if strings.has_prefix(filepath, "/") != true {
    full_path = get_cwd_path(filepath)
  } else {
    full_path = filepath
  }
  if strings.has_prefix(full_path, "Errorpathnotvalid") {
    return "Errorpathnotvalid"
  }
  return full_path
}

// Obtener el cwd
get_cwd_path :: proc(filename: string) -> string {
  cwd, err := os.get_working_directory(context.allocator)
  if err != nil {
    fmt.eprintfln("Error: %v", err)
    os.exit(1)
    // return "Errorpathnotvalid"
  }
  defer delete(cwd) // Free the allocated string

  fmt.println("Current working directory:", cwd)
  return strings.concatenate({cwd, "/", filename})
  // cwd + "/" + filename
}

// Cambiar ~ por el home directory
validate_full_path :: proc(filepath: string) -> string {

  allocator := context.allocator
  home_dir, err := os.user_home_dir(allocator)
  if err != nil {
    return "Errorpathnotvalid"
  }
  defer delete(home_dir)
  new_home_dir, notpath := strings.replace(filepath,"~", home_dir, 1)
  return new_home_dir
}

// leer archivo
read_file_by_lines_in_whole :: proc(filepath: string) -> [dynamic]string {
  complete_filepath := generate_full_file_path(filepath)
  if strings.has_prefix(complete_filepath, "Errorpathnotvalid") {
    fmt.printfln("Error, path not valid")
    os.exit(1)
  }
  // Liberamos complete_filepath al salir del procedimiento si fue asignado dinámicamente.
  // O mejor aún, aseguramos que se limpie:
  defer if complete_filepath != filepath {
    delete(complete_filepath, context.allocator)
  }
  data, err := os.read_entire_file(complete_filepath, context.allocator)
  if err != nil {
    // could not read file
    return {}
  }
  defer delete(data, context.allocator)

  // it := string(data)
  // for line in strings.split_lines_iterator(&it) {
  //   // process line
  //   fmt.printfln(line)
  // }
  lines := make([dynamic]string)

  it := string(data)
  for line in strings.split_lines_iterator(&it) {
    // Clonamos la línea para que sobreviva después de liberar el archivo completo
    cloned_line := strings.clone(line, context.allocator)
    append(&lines, cloned_line)

    // Imprimimos para verificar (como vas testeando)
    fmt.printfln("[TESTING] Línea leída: %s", cloned_line)
  }

  return lines
}

