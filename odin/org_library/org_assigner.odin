package org_library

import "core:text/regex"
import "core:fmt"
import "core:os"
import "core:strings"

firstlexer :: proc() {
  test_lexer: string
  i := 0
  len_file := 10
  for i < len_file {
    i = i + 1 
    fmt.print(i)
  }
}

assign :: proc() {
  fmt.printfln("Assign the stuff")
}


