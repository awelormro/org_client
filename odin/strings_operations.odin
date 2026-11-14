package stringstests

import "base:intrinsics"
import "core:fmt"
import "core:strings"
import "core:os"

// replace_direct_test :: proc(full, old, new) {
//   result_final, _ := strings.replace(full, old, new, 1)
//   return result_final
// }

replace_home_test :: proc(full) {
  allocator := context.allocator
  cwd, err := os.get_working_directory(allocator)
  if err != nil {
    fmt.eprint("Error")
    return
  }
  defer delete(cwd)
}

cwd :: proc() {
  allocator := context.allocator
  cwd_rel, err := os.get_executable_directory(allocator)
  if err != nil {
    return "errorpath" 
  }
  defer delete(cwd_rel)
  return cwd_rel
}

generate_full_path :: proc() {
  rel_full_path := string
  if true {
  }
  return rel_full_path
}

main :: proc() {
  cosa1 := "Pendejada aleatoria"
  cosa2 := "~/Pendejada/lol"
  cosa_3 := "pendejada.org"
  allocator := context.allocator
  cwd, err := os.get_working_directory(allocator)
  if err != nil {
    fmt.eprint("Error")
    return
  }
  defer delete(cwd)

  if cosa2[0] == "~" {
    fmt.printfln("cosa2 has relative path") 
  }
  new_path := strings.builder_make()
  cosanueva, _ := strings.replace(cosa1, "aleatoria", "pendejadota", 1)
  fmt.printfln(cosanueva)
  cosa_nueva2, _ := strings.replace(cosa2, "~", os.get_env("HOME", context.temp_allocator), 1)
  fmt.printfln(cosa_nueva2)
  strings.write_string(&new_path, cwd)
  strings.write_string(&new_path, "/")
  strings.write_string(&new_path, cosa_3)
  path_new_string := strings.to_string(new_path)
  fmt.printfln(path_new_string)
}
