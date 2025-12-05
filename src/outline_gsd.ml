(*
 * outline.ml
 * -----------
 * Copyright : (c) 2023 - 2025, smaji.org
 * Copyright : (c) 2023 - 2025, ZAN DoYe <zandoye@gmail.com>
 * Licence   : GPL2
 *
 * This file is a part of Smaji_dyn_glyph.
 *)

let gsd_svg ?padding ?weight ~unicode ~output_name ~gsd_dir ()=
  let gsd=
    match unicode with
    | Some unicode-> Smaji_gsd.load_file ~dir:gsd_dir unicode
    | None-> (In_channel.input_all stdin) |> Smaji_gsd.of_string ~dir:gsd_dir
  in
  let data= gsd
    |> Smaji_gsd.outline_svg_of_gsd ?padding ?weight
  in
  match output_name with
  | Some output_name->
    Core.Out_channel.write_all ~data output_name;
  | None-> Core.Out_channel.print_endline data

let gsd_glif ~unicode ~output_name ~gsd_dir ()=
  let gsd=
    match unicode with
    | Some unicode-> Smaji_gsd.load_file ~dir:gsd_dir unicode
    | None-> (In_channel.input_all stdin) |> Smaji_gsd.of_string ~dir:gsd_dir
  in
  let data= Smaji_gsd.outline_glif_of_gsd gsd in
  match data with
  | Glif glif->
    let data= Smaji_glyph_path.Glif.glif_string_of_t glif in
    (match output_name with
    | Some output_name->
      Core.Out_channel.write_all ~data output_name
    | None-> Core.Out_channel.print_endline data)
  | Wrapped { wrap; content }->
    let data= Smaji_glyph_path.Glif.glif_string_of_t wrap in
    (match output_name with
    | Some output_name->
      let output_name= (Filename.remove_extension output_name) ^ ".glif" in
      Core.Out_channel.write_all ~data output_name;
    | None-> Core.Out_channel.print_endline data);
    let data= Smaji_glyph_path.Glif.glif_string_of_t content in
    match output_name with
    | Some output_name->
      let output_name= (Filename.remove_extension output_name) ^ "_content.glif" in
      Core.Out_channel.write_all ~data output_name
    | None-> Core.Out_channel.print_endline data

