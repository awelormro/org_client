package org_library

import "core:os"
import "core:fmt"

// test_file_stats :: proc(filepath: string) {
//     // os.args[0] es el nombre del ejecutable, el primer argumento real está en [1]
//     if len(os.args) < 2 {
//         fmt.eprintln("Uso: programa <archivo>")
//         os.exit(1)    }    ruta := os.args[1]
//     if !os.exists(ruta) {
//         fmt.eprintln("El archivo no existe:", ruta)
//         os.exit(1)
//     }    // Leer el contenido
//     data, ok := os.read_entire_file(ruta)
//     if !ok {
//         fmt.eprintln("Error al leer el archivo")
//         os.exit(1)
//     }
//     defer delete(data)
//     // data es []byte, lo pasamos a string para imprimir
//     fmt.printfln("Contenido de %s:n%s", ruta, string(data))
// }
