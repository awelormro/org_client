package main

import "core:fmt"
import "core:os"
import "core:flags"

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

main :: proc() {
  options: Orgcli_options
  // flags.parse_or_exit(&options, os.args[1:], style = .Unix)
  flags.parse_or_exit(&options, os.args, style = .Unix)
  if len(os.args) <= 1 {
    fmt.print("None option selected, use defaults")
    return
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
}
