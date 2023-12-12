open Smaji_god

let convert ~input_name ~output_name ~source_type ~target_type=
  match source_type, target_type with
  | (Outline_svg, Outline_glif)->
    let open Smaji_glyph_outline in
    Svg.load_file input_name |> Option.iter @@ fun svg->
    let glif= svg |> glif_of_svg |> Glif.glif_string_of_t in
    Out_channel.with_open_text output_name @@ fun chan->
    Out_channel.output_string chan glif
  | (Outline_glif, Outline_svg)->
    let open Smaji_glyph_outline in
    Glif.load_file input_name |> Option.iter @@ fun glif->
    let svg= glif |> svg_of_glif |> Svg.svg_string_of_t in
    Out_channel.with_open_text output_name @@ fun chan->
    Out_channel.output_string chan svg
  | (Outline_glif, Outline_glif)
  | (Outline_svg, Outline_svg)->
    In_channel.with_open_text input_name @@ fun chan_in->
    Out_channel.with_open_text output_name @@ fun chan_out->
    chan_in
      |> In_channel.input_all
      |> Out_channel.output_string chan_out
