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
  let god= Smaji_god.load_file ~dir:god_dir unicode in
  let data= Smaji_god.outline_svg_of_god ~stroke_glyph god in
  Core.Out_channel.write_all ~data output_name

let outline_glif ~unicode ~output_name ~god_dir ~component_dir=
  let open Smaji_god in
  let open Printf in
  let stroke_glyph= load_glyphs ~dir:component_dir |> convert_to_glif_glyphs in
  let god= Smaji_god.load_file ~dir:god_dir unicode in
  let data= Smaji_god.outline_glif_of_god ~stroke_glyph god in
  let output_basename= Core.Option.value_or_thunk output_name
      ~default:(fun ()->
        let core, variation= unicode in
        sprintf "%x,%x" core variation)
  in
  match data with
  | Glif glif->
    let data= Smaji_glyph_outline.Glif.glif_string_of_t glif in
    let output_name= output_basename ^ ".outline.glif" in
    Core.Out_channel.write_all ~data output_name
  | Wrapped { wrap; content }->
    let data= Smaji_glyph_outline.Glif.glif_string_of_t wrap in
    let output_name= output_basename ^ ".outline.glif" in
    Core.Out_channel.write_all ~data output_name;
    let data= Smaji_glyph_outline.Glif.glif_string_of_t content in
    let output_name= output_basename ^ ".outline.content.glif" in
    Core.Out_channel.write_all ~data output_name

