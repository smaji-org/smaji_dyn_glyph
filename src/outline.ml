(*
 * outline.ml
 * -----------
 * Copyright : (c) 2023 - 2023, smaji.org
 * Copyright : (c) 2023 - 2023, ZAN DoYe <zandoye@gmail.com>
 * Licence   : GPL2
 *
 * This file is a part of Smaji_dyn_glyph.
 *)

let outline ~unicode ~output_name ~god_dir ~component_dir=
  let open Smaji_god in
  let stroke_glyph=
    let (/)= Filename.concat in
    [
    (S_a     , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "a.svg"));
    (S_cj    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "cj.svg"));
    (S_c     , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "c.svg"));
    (S_d     , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "d.svg"));
    (S_du    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "du.svg"));
    (S_ed    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "ed.svg"));
    (S_fpj   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "fpj.svg"));
    (S_fp    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "fp.svg"));
    (S_ft    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "ft.svg"));
    (S_haj   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "haj.svg"));
    (S_ha    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "ha.svg"));
    (S_hj    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hj.svg"));
    (S_hpj   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hpj.svg"));
    (S_hp    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hp.svg"));
    (S_h     , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "h.svg"));
    (S_hsv   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hsv.svg"));
    (S_htaj  , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "htaj.svg"));
    (S_htcj  , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "htcj.svg"));
    (S_htc   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "htc.svg"));
    (S_hthtj , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hthtj.svg"));
    (S_htht  , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "htht.svg"));
    (S_htj   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "htj.svg"));
    (S_ht    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "ht.svg"));
    (S_hvh   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hvh.svg"));
    (S_hvhv  , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hvhv.svg"));
    (S_hvj   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hvj.svg"));
    (S_hv    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hv.svg"));
    (S_hvu   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "hvu.svg"));
    (S_ld    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "ld.svg"));
    (S_o     , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "o.svg"));
    (S_pj    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "pj.svg"));
    (S_p     , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "p.svg"));
    (S_rsv   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "rsv.svg"));
    (S_sh    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "sh.svg"));
    (S_sv    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "sv.svg"));
    (S_td    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "td.svg"));
    (S_th    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "th.svg"));
    (S_thtaj , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "thtaj.svg"));
    (S_thtj  , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "thtj.svg"));
    (S_tht   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "tht.svg"));
    (S_tj    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "tj.svg"));
    (S_tod   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "tod.svg"));
    (S_t     , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "t.svg"));
    (S_tu    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "tu.svg"));
    (S_ufp   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "ufp.svg"));
    (S_uj    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "uj.svg"));
    (S_up    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "up.svg"));
    (S_u     , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "u.svg"));
    (S_utj   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "utj.svg"));
    (S_vaj   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "vaj.svg"));
    (S_va    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "va.svg"));
    (S_vcj   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "vcj.svg"));
    (S_vc    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "vc.svg"));
    (S_vh    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "vh.svg"));
    (S_vhtj  , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "vhtj.svg"));
    (S_vht   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "vht.svg"));
    (S_vhv   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "vhv.svg"));
    (S_vj    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "vj.svg"));
    (S_v     , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "v.svg"));
    (S_vu    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "vu.svg"));
    (S_wd    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "wd.svg"));
    (S_wtd   , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "wtd.svg"));
    (S_wt    , Smaji_glyph_outline.Svg.load_file_exn (component_dir / "wt.svg"));
    ]
    |> List.to_seq
    |> StrokeMap.of_seq
  in
  let god= Smaji_god.load_file ~dir:god_dir unicode in
  let data= Smaji_god.outline_svg_of_god ~stroke_glyph god in
  Core.Out_channel.write_all ~data output_name

