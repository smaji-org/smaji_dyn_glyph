(*
 * outline.ml
 * -----------
 * Copyright : (c) 2023 - 2023, smaji.org
 * Copyright : (c) 2023 - 2023, ZAN DoYe <zandoye@gmail.com>
 * Licence   : GPL2
 *
 * This file is a part of Smaji_dyn_glyph.
 *)

let outline_svg ~unicode ~output_name ~god_dir ~component_dir=
  let open Smaji_god in
  let stroke_glyph= load_glyphs ~dir:component_dir in
  let god=
    match unicode with
    | Some unicode-> Smaji_god.load_file ~dir:god_dir unicode
    | None-> (In_channel.input_all stdin) |> Smaji_god.of_string ~dir:god_dir
  in
  let data= Smaji_god.outline_svg_of_god ~stroke_glyph god in
  match output_name with
  | Some output_name->
    let output_name= output_name ^ ".outline.svg" in
    Core.Out_channel.write_all ~data output_name
  | None-> Core.Out_channel.print_endline data

let outline_glif ~unicode ~output_name ~god_dir ~component_dir=
  let open Smaji_god in
  let stroke_glyph= load_glyphs ~dir:component_dir |> convert_to_glif_glyphs in
  let god=
    match unicode with
    | Some unicode-> Smaji_god.load_file ~dir:god_dir unicode
    | None-> (In_channel.input_all stdin) |> Smaji_god.of_string ~dir:god_dir
  in
  let data= Smaji_god.outline_glif_of_god ~stroke_glyph god in
  match data with
  | Glif glif->
    let data= Smaji_glyph_outline.Glif.glif_string_of_t glif in
    (match output_name with
    | Some output_name->
      Core.Out_channel.write_all ~data output_name
    | None-> Core.Out_channel.print_endline data)
  | Wrapped { wrap; content }->
    let data= Smaji_glyph_outline.Glif.glif_string_of_t wrap in
    (match output_name with
    | Some output_name->
      let output_name= output_name ^ ".glif" in
      Core.Out_channel.write_all ~data output_name;
    | None-> Core.Out_channel.print_endline data);
    let data= Smaji_glyph_outline.Glif.glif_string_of_t content in
    match output_name with
    | Some output_name->
      let output_name= output_name ^ ".content.glif" in
      Core.Out_channel.write_all ~data output_name
    | None-> Core.Out_channel.print_endline data

