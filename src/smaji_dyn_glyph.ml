(*
 * smaji_dyn_glyph.ml
 * -----------
 * Copyright : (c) 2023 - 2025, smaji.org
 * Copyright : (c) 2023 - 2025, ZAN DoYe <zandoye@gmail.com>
 * Licence   : GPL2
 *
 * This file is a part of Smaji_dyn_glyph.
 *)

let ()=
  let open Outline_god in
  let open Outline_gsd in
  let open Animation in
  let open Convert in
  CmdArg.run ~god_svg ~god_glif ~gsd_svg ~gsd_glif ~animation ~convert

