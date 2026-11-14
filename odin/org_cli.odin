package main

import "core:fmt"
import "core:os"
import "core:flags"
import "org_library"

Orgcli_options :: struct {
  name_file: string `args:"name=name_file"`,
  name_output: string `args:"name=output_file"`,
  edit_file: bool `args: "name=edit_direct_file"`,
  editor_structure: bool `args:"name=editor_structure"`,
  folding_calculation: bool `args:"name=folding_calculation"`,
  checkbox_recalculation: bool `args:"checkbox_recalculation"`,
  table_adjustment: bool `args:"name=table_adjustment"`,
  cursor_row: int `args:"name=cursor_row"`, 
  cursor_col: int `args:"name=cursor_col"`
}

Token_lines :: struct {
  type_line: string,
  cont_line: string,
  number_line: int
}

token_part :: struct {
  type_token: string,
  cont_token: string,
  len_token: int,
  start_token: int,
  end_token: int,
  line_token: int
}

main :: proc() {
  options: Orgcli_options
  // flags.parse_or_exit(&options, os.args[1:], style = .Unix)
  flags.parse_or_exit(&options, os.args, style = .Unix)
  file_name := ""
  exit_file_name := ""
  checkbox_recalculation := true
  folding_calculation := true
  cursor_col := -1
  cursor_row := -1
  table_adjustment := false
  if len(os.args) <= 1 {
    fmt.print("None option selected, use defaults")
  } else {
    if options.name_file != "" {
      fmt.printfln("Existe nombre, se arma") 
    }
    if options.name_output != "" {
      fmt.printfln("Name output exists")
    }
    if options.edit_file {
      fmt.printfln("edit direct on file") 
    }
    if options.editor_structure {
      fmt.printfln("check editor structure")
    }
    if options.folding_calculation {
      fmt.printfln("Release folding options") 
    }
    fmt.println("Hellope!")
  }
  org_library.read_file_by_lines_in_whole(options.name_file)
}


