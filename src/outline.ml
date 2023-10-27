let outline ~unicode ~output_name ~god_dir ~component_dir=
  let open God in
  let stroke_glyph=
    let (/)= Filename.concat in
    [
    (S_a     , Glyph_outline.Svg.load_file_exn (component_dir / "a.svg"));
    (S_cj    , Glyph_outline.Svg.load_file_exn (component_dir / "cj.svg"));
    (S_c     , Glyph_outline.Svg.load_file_exn (component_dir / "c.svg"));
    (S_d     , Glyph_outline.Svg.load_file_exn (component_dir / "d.svg"));
    (S_du    , Glyph_outline.Svg.load_file_exn (component_dir / "du.svg"));
    (S_ed    , Glyph_outline.Svg.load_file_exn (component_dir / "ed.svg"));
    (S_fpj   , Glyph_outline.Svg.load_file_exn (component_dir / "fpj.svg"));
    (S_fp    , Glyph_outline.Svg.load_file_exn (component_dir / "fp.svg"));
    (S_ft    , Glyph_outline.Svg.load_file_exn (component_dir / "ft.svg"));
    (S_haj   , Glyph_outline.Svg.load_file_exn (component_dir / "haj.svg"));
    (S_ha    , Glyph_outline.Svg.load_file_exn (component_dir / "ha.svg"));
    (S_hj    , Glyph_outline.Svg.load_file_exn (component_dir / "hj.svg"));
    (S_hpj   , Glyph_outline.Svg.load_file_exn (component_dir / "hpj.svg"));
    (S_hp    , Glyph_outline.Svg.load_file_exn (component_dir / "hp.svg"));
    (S_h     , Glyph_outline.Svg.load_file_exn (component_dir / "h.svg"));
    (S_hsv   , Glyph_outline.Svg.load_file_exn (component_dir / "hsv.svg"));
    (S_htaj  , Glyph_outline.Svg.load_file_exn (component_dir / "htaj.svg"));
    (S_htcj  , Glyph_outline.Svg.load_file_exn (component_dir / "htcj.svg"));
    (S_htc   , Glyph_outline.Svg.load_file_exn (component_dir / "htc.svg"));
    (S_hthtj , Glyph_outline.Svg.load_file_exn (component_dir / "hthtj.svg"));
    (S_htht  , Glyph_outline.Svg.load_file_exn (component_dir / "htht.svg"));
    (S_htj   , Glyph_outline.Svg.load_file_exn (component_dir / "htj.svg"));
    (S_ht    , Glyph_outline.Svg.load_file_exn (component_dir / "ht.svg"));
    (S_hvh   , Glyph_outline.Svg.load_file_exn (component_dir / "hvh.svg"));
    (S_hvhv  , Glyph_outline.Svg.load_file_exn (component_dir / "hvhv.svg"));
    (S_hvj   , Glyph_outline.Svg.load_file_exn (component_dir / "hvj.svg"));
    (S_hv    , Glyph_outline.Svg.load_file_exn (component_dir / "hv.svg"));
    (S_hvu   , Glyph_outline.Svg.load_file_exn (component_dir / "hvu.svg"));
    (S_ld    , Glyph_outline.Svg.load_file_exn (component_dir / "ld.svg"));
    (S_o     , Glyph_outline.Svg.load_file_exn (component_dir / "o.svg"));
    (S_pj    , Glyph_outline.Svg.load_file_exn (component_dir / "pj.svg"));
    (S_p     , Glyph_outline.Svg.load_file_exn (component_dir / "p.svg"));
    (S_rsv   , Glyph_outline.Svg.load_file_exn (component_dir / "rsv.svg"));
    (S_sh    , Glyph_outline.Svg.load_file_exn (component_dir / "sh.svg"));
    (S_sv    , Glyph_outline.Svg.load_file_exn (component_dir / "sv.svg"));
    (S_td    , Glyph_outline.Svg.load_file_exn (component_dir / "td.svg"));
    (S_th    , Glyph_outline.Svg.load_file_exn (component_dir / "th.svg"));
    (S_thtaj , Glyph_outline.Svg.load_file_exn (component_dir / "thtaj.svg"));
    (S_thtj  , Glyph_outline.Svg.load_file_exn (component_dir / "thtj.svg"));
    (S_tht   , Glyph_outline.Svg.load_file_exn (component_dir / "tht.svg"));
    (S_tj    , Glyph_outline.Svg.load_file_exn (component_dir / "tj.svg"));
    (S_tod   , Glyph_outline.Svg.load_file_exn (component_dir / "tod.svg"));
    (S_t     , Glyph_outline.Svg.load_file_exn (component_dir / "t.svg"));
    (S_tu    , Glyph_outline.Svg.load_file_exn (component_dir / "tu.svg"));
    (S_ufp   , Glyph_outline.Svg.load_file_exn (component_dir / "ufp.svg"));
    (S_uj    , Glyph_outline.Svg.load_file_exn (component_dir / "uj.svg"));
    (S_up    , Glyph_outline.Svg.load_file_exn (component_dir / "up.svg"));
    (S_u     , Glyph_outline.Svg.load_file_exn (component_dir / "u.svg"));
    (S_utj   , Glyph_outline.Svg.load_file_exn (component_dir / "utj.svg"));
    (S_vaj   , Glyph_outline.Svg.load_file_exn (component_dir / "vaj.svg"));
    (S_va    , Glyph_outline.Svg.load_file_exn (component_dir / "va.svg"));
    (S_vcj   , Glyph_outline.Svg.load_file_exn (component_dir / "vcj.svg"));
    (S_vc    , Glyph_outline.Svg.load_file_exn (component_dir / "vc.svg"));
    (S_vh    , Glyph_outline.Svg.load_file_exn (component_dir / "vh.svg"));
    (S_vhtj  , Glyph_outline.Svg.load_file_exn (component_dir / "vhtj.svg"));
    (S_vht   , Glyph_outline.Svg.load_file_exn (component_dir / "vht.svg"));
    (S_vhv   , Glyph_outline.Svg.load_file_exn (component_dir / "vhv.svg"));
    (S_vj    , Glyph_outline.Svg.load_file_exn (component_dir / "vj.svg"));
    (S_v     , Glyph_outline.Svg.load_file_exn (component_dir / "v.svg"));
    (S_vu    , Glyph_outline.Svg.load_file_exn (component_dir / "vu.svg"));
    (S_wd    , Glyph_outline.Svg.load_file_exn (component_dir / "wd.svg"));
    (S_wtd   , Glyph_outline.Svg.load_file_exn (component_dir / "wtd.svg"));
    (S_wt    , Glyph_outline.Svg.load_file_exn (component_dir / "wt.svg"));
    ]
    |> List.to_seq
    |> StrokeMap.of_seq
  in
  let god= God.load_file god_dir unicode in
  let data= God.outline_svg_of_god ~stroke_glyph god in
  Core.Out_channel.write_all ~data output_name

