open Core

let flag_unicode=
  Command.Arg_type.create
    (fun s->
      try God.code_point_of_string s with Failure _->
      failwith "please input unicode in hexadecimal foramt and append optional variation with a comma or colon as separator")

let param_unicode=
  let open Command.Param in
  flag "--unicode" ~aliases:["-u"] (required flag_unicode) ~doc:"unicode the hexadecimal unicode of the character, optional variation is separated with a comma or colon"

let param_output=
  let open Command.Param in
  flag "--output" ~aliases:["-o"] (optional string) ~doc:"filename output filename"

let param_gods=
  let open Command.Param in
  flag "--god-dir" ~aliases:["-g"] (optional_with_default "gods" string) ~doc:"path the path of the direcotry containing god files"

let param_components=
  let open Command.Param in
  flag "--component-dir" ~aliases:["-c"] (optional string) ~doc:"path the path of the direcotry containing glyph components"

let command_outline outline=
  Command.basic
    ~summary:"generate an outline file of the character"
    ?readme:None
    (let open Command.Let_syntax in
    let%map unicode= param_unicode
    and output_name= param_output
    and god_dir= param_gods
    and component_dir= param_components in
    fun ()->
      let output_name= Option.value_or_thunk output_name
        ~default:(fun ()->
          let core, variation= unicode in
          sprintf "%x,%x.outline.svg" core variation)
        and component_dir= Option.value component_dir ~default:"outlines" in
      outline
        ~unicode
        ~output_name
        ~god_dir
        ~component_dir)

let command_animation animation=
  Command.basic
    ~summary:"generate an stroke animation file of the character"
    ?readme:None
    (let open Command.Let_syntax in
    let%map unicode= param_unicode
    and output_name= param_output
    and god_dir= param_gods
    and component_dir= param_components in
    fun ()->
      let output_name= Option.value_or_thunk output_name
        ~default:(fun ()->
          let core, variation= unicode in
          sprintf "%x,%x.animation.svg" core variation)
        and component_dir= Option.value component_dir ~default:"animations" in
      animation
        ~unicode
        ~output_name
        ~god_dir
        ~component_dir)

let command ~outline ~animation=
  Command.group
    ~summary:"Manipulate dates"
    [ "outline", command_outline outline;
      "animation", command_animation animation;
      ]

let run ~outline ~animation= Command_unix.run ~version:"0.1"
  (command ~outline ~animation)

