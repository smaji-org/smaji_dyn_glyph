(*
 * convert.ml
 * -----------
 * Copyright : (c) 2023 - 2025, smaji.org
 * Copyright : (c) 2023 - 2025, ZAN DoYe <zandoye@gmail.com>
 * Licence   : GPL2
 *
 * This file is a part of Smaji_dyn_glyph.
 *)

open Smaji_god

let convert ~input_name ~output_name ~source_type ~target_type=
  match source_type, target_type with
  | (Outline_svg, Outline_glif)->
    let open Smaji_glyph_path in
    let content= match input_name with
      | Some input_name-> Svg.load_file input_name
      | None-> Svg.of_string (In_channel.input_all In_channel.stdin)
    in
    content |> Option.iter @@ fun svg->
    (match glif_of_svg svg |> Option.map Glif.glif_string_of_t with
    | Some glif->
      (match output_name with
      | Some output_name->
        Out_channel.with_open_text output_name @@ fun chan->
        Out_channel.output_string chan glif;
        Out_channel.output_char chan '\n'
      | None-> Out_channel.(output_string stdout glif; output_char stdout '\n'))
    | None-> Out_channel.(
      output_string stderr
        "the paths in the svg file are not closed, can not be converted to glif file"))
  | (Outline_glif, Outline_svg)->
    let open Smaji_glyph_path in
    let content= match input_name with
      | Some input_name-> Glif.load_file input_name
      | None-> Some (Glif.of_string (In_channel.input_all In_channel.stdin))
    in
    content |> Option.iter @@ fun glif->
    let svg= glif |> svg_of_glif |> Svg.svg_string_of_t in
    (match output_name with
    | Some output_name->
      Out_channel.with_open_text output_name @@ fun chan->
      Out_channel.(output_string chan svg; output_char chan '\n')
    | None-> Out_channel.(output_string stdout svg; output_char stdout '\n'))
  | (Outline_glif, Outline_glif)
  | (Outline_svg, Outline_svg)->
    let content= match input_name with
      | Some input_name-> In_channel.with_open_text input_name In_channel.input_all
      | None-> In_channel.(input_all stdin)
    in
    match output_name with
    | Some output_name->
      Out_channel.with_open_text output_name @@ fun chan->
        Out_channel.(output_string chan content; output_char chan '\n')
    | None-> Out_channel.(output_string stdout content; output_char stdout '\n')

