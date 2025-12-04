(*
 * cmdArg.ml
 * -----------
 * Copyright : (c) 2023 - 2025, smaji.org
 * Copyright : (c) 2023 - 2025, ZAN DoYe <zandoye@gmail.com>
 * Licence   : GPL2
 *
 * This file is a part of Smaji_dyn_glyph.
 *)

open Core

let flag_unicode=
  Command.Arg_type.create
    (fun s->
      try Smaji_god.code_point_of_string s with Failure _->
      failwith "please input unicode in hexadecimal foramt and append optional variation with a comma or colon as separator")

let flag_outline_type=
  Command.Arg_type.create
    (fun str->
      let open Smaji_god in
      match str with
      | "svg"-> Outline_svg
      | "glif"-> Outline_glif
      | _-> failwith ("unknown outline type: " ^ str))

let param_unicode_opt=
  let open Command.Param in
  flag "--unicode" ~aliases:["-u"] (optional flag_unicode) ~doc:"unicode the hexadecimal unicode of the character, optional variation is separated with a comma or colon. if ommited, stdin is taken as the god file"

let param_input_opt=
  let open Command.Param in
  flag "--input" ~aliases:["-i"] (optional string) ~doc:"filename input filename, default to stdin"

let param_output_opt=
  let open Command.Param in
  flag "--output" ~aliases:["-o"] (optional string) ~doc:"filename output filename, default to stdout"

let param_input_req=
  let open Command.Param in
  flag "--input" ~aliases:["-i"] (required string) ~doc:"filename input filename"

let param_output_req=
  let open Command.Param in
  flag "--output" ~aliases:["-o"] (required string) ~doc:"filename output filename"

let param_gods=
  let open Command.Param in
  flag "--god-dir" ~aliases:["-g"] (optional_with_default "gods" string) ~doc:"path the path of the direcotry containing god files, default to 'gods'"

let param_gsds=
  let open Command.Param in
  flag "--gsd-dir" ~aliases:["-g"] (optional_with_default "gsds" string) ~doc:"path the path of the direcotry containing gsd files, default to 'gsds'"

let param_components_outline=
  let open Command.Param in
  flag "--component-dir" ~aliases:["-c"] (optional_with_default "outlines" string) ~doc:"path the path of the direcotry containing outline components, default to 'outlines'"

let param_components_animations=
  let open Command.Param in
  flag "--component-dir" ~aliases:["-c"] (optional_with_default "animations" string) ~doc:"path the path of the direcotry containing animation components, default to 'animations'"

let param_source_type=
  let open Command.Param in
  flag "--source-type" ~aliases:["--st"] (required flag_outline_type) ~doc:"type convert from the type. available types: svg, glif"

let param_target_type=
  let open Command.Param in
  flag "--target-type" ~aliases:["--tt"] (required flag_outline_type) ~doc:"type convert to the type. available types: svg, glif"

let param_padding=
  let open Command.Param in
  flag "--padding" ~aliases:["-p"] (optional float) ~doc:"padding the space between an element's content and its border"

let param_weight=
  let open Command.Param in
  flag "--weight" ~aliases:["-w"] (optional string) ~doc:"weight the weight of the stroke"

let command_god_outline_svg outline=
  Command.basic
    ~summary:"generate an svg outline file of the character"
    ?readme:None
    (let open Command.Let_syntax in
    let%map unicode= param_unicode_opt
    and output_name= param_output_opt
    and god_dir= param_gods
    and component_dir= param_components_outline in
    fun ()->
      outline
        ~unicode
        ~output_name
        ~god_dir
        ~component_dir)

let command_god_outline_glif outline=
  Command.basic
    ~summary:"generate a glif outline file of the character"
    ?readme:None
    (let open Command.Let_syntax in
    let%map unicode= param_unicode_opt
    and output_name= param_output_opt
    and god_dir= param_gods
    and component_dir= param_components_outline in
    fun ()->
      outline
        ~unicode
        ~output_name
        ~god_dir
        ~component_dir)

let command_gsd_outline_svg gsd=
  Command.basic
    ~summary:"generate an svg outline file of the character"
    ?readme:None
    (let open Command.Let_syntax in
    let%map unicode= param_unicode_opt
    and output_name= param_output_opt
    and gsd_dir= param_gsds
    and padding= param_padding
    and weight= param_weight in
    gsd
      ?padding
      ?weight
      ~unicode
      ~output_name
      ~gsd_dir)

let command_gsd_outline_glif gsd=
  Command.basic
    ~summary:"generate a glif outline file of the character"
    ?readme:None
    (let open Command.Let_syntax in
    let%map unicode= param_unicode_opt
    and output_name= param_output_opt
    and gsd_dir= param_gsds
    and padding= param_padding
    and weight= param_weight in
    gsd
      ?padding
      ?weight
      ~unicode
      ~output_name
      ~gsd_dir)

let command_god_animation animation=
  Command.basic
    ~summary:"generate an stroke animation file of the character"
    ?readme:None
    (let open Command.Let_syntax in
    let%map unicode= param_unicode_opt
    and output_name= param_output_opt
    and god_dir= param_gods
    and component_dir= param_components_animations in
    fun ()->
      animation
        ~unicode
        ~output_name
        ~god_dir
        ~component_dir)

let command_convert convert=
  Command.basic
    ~summary:"convert the format of outline files"
    ?readme:None
    (let open Command.Let_syntax in
    let%map source_type= param_source_type
    and target_type= param_target_type
    and input_name= param_input_opt
    and output_name= param_output_opt in
    fun ()->
      convert
        ~input_name
        ~output_name
        ~source_type
        ~target_type)

let command_group_god ~god_svg ~god_glif=
  Command.group
    ~summary:"outline generation"
    [ "svg", command_god_outline_svg god_svg;
      "glif", command_god_outline_glif god_glif;
      ]

let command_group_gsd ~gsd_svg ~gsd_glif=
  Command.group
    ~summary:"outline generation"
    [ "svg", command_gsd_outline_svg gsd_svg;
      "glif", command_gsd_outline_glif gsd_glif;
      ]

let command ~god_svg ~god_glif ~gsd_svg ~gsd_glif ~animation ~convert=
  Command.group
    ~summary:"Manipulate dates"
    [
      "god", command_group_god ~god_svg ~god_glif;
      "gsd", command_group_gsd ~gsd_svg ~gsd_glif;
      "animation", command_god_animation animation;
      "convert", command_convert convert;
      ]

let run ~god_svg ~god_glif ~gsd_svg ~gsd_glif ~animation ~convert= Command_unix.run ~version:"0.1"
  (command ~god_svg ~god_glif ~gsd_svg ~gsd_glif ~animation ~convert)

