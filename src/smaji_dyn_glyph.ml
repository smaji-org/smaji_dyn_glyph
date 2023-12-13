(*
 * smaji_dyn_glyph.ml
 * -----------
 * Copyright : (c) 2023 - 2023, smaji.org
 * Copyright : (c) 2023 - 2023, ZAN DoYe <zandoye@gmail.com>
 * Licence   : GPL2
 *
 * This file is a part of Smaji_dyn_glyph.
 *)

let ()=
  let open Outline in
  let open Animation in
  let open Convert in
  CmdArg.run ~outline_svg ~outline_glif ~animation ~convert

