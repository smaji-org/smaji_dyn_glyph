let animation ~unicode ~output_name ~god_dir ~component_dir=
  let open God in
  let stroke_animate=
    let (/)= Filename.concat in
    [
    (S_a     , God.Animate.load_file_exn (component_dir / "a.svg"));
    (S_cj    , God.Animate.load_file_exn (component_dir / "cj.svg"));
    (S_c     , God.Animate.load_file_exn (component_dir / "c.svg"));
    (S_d     , God.Animate.load_file_exn (component_dir / "d.svg"));
    (S_du    , God.Animate.load_file_exn (component_dir / "du.svg"));
    (S_ed    , God.Animate.load_file_exn (component_dir / "ed.svg"));
    (S_fpj   , God.Animate.load_file_exn (component_dir / "fpj.svg"));
    (S_fp    , God.Animate.load_file_exn (component_dir / "fp.svg"));
    (S_ft    , God.Animate.load_file_exn (component_dir / "ft.svg"));
    (S_haj   , God.Animate.load_file_exn (component_dir / "haj.svg"));
    (S_ha    , God.Animate.load_file_exn (component_dir / "ha.svg"));
    (S_hj    , God.Animate.load_file_exn (component_dir / "hj.svg"));
    (S_hpj   , God.Animate.load_file_exn (component_dir / "hpj.svg"));
    (S_hp    , God.Animate.load_file_exn (component_dir / "hp.svg"));
    (S_h     , God.Animate.load_file_exn (component_dir / "h.svg"));
    (S_hsv   , God.Animate.load_file_exn (component_dir / "hsv.svg"));
    (S_htaj  , God.Animate.load_file_exn (component_dir / "htaj.svg"));
    (S_htcj  , God.Animate.load_file_exn (component_dir / "htcj.svg"));
    (S_htc   , God.Animate.load_file_exn (component_dir / "htc.svg"));
    (S_hthtj , God.Animate.load_file_exn (component_dir / "hthtj.svg"));
    (S_htht  , God.Animate.load_file_exn (component_dir / "htht.svg"));
    (S_htj   , God.Animate.load_file_exn (component_dir / "htj.svg"));
    (S_ht    , God.Animate.load_file_exn (component_dir / "ht.svg"));
    (S_hvh   , God.Animate.load_file_exn (component_dir / "hvh.svg"));
    (S_hvhv  , God.Animate.load_file_exn (component_dir / "hvhv.svg"));
    (S_hvj   , God.Animate.load_file_exn (component_dir / "hvj.svg"));
    (S_hv    , God.Animate.load_file_exn (component_dir / "hv.svg"));
    (S_hvu   , God.Animate.load_file_exn (component_dir / "hvu.svg"));
    (S_ld    , God.Animate.load_file_exn (component_dir / "ld.svg"));
    (S_o     , God.Animate.load_file_exn (component_dir / "o.svg"));
    (S_pj    , God.Animate.load_file_exn (component_dir / "pj.svg"));
    (S_p     , God.Animate.load_file_exn (component_dir / "p.svg"));
    (S_rsv   , God.Animate.load_file_exn (component_dir / "rsv.svg"));
    (S_sh    , God.Animate.load_file_exn (component_dir / "sh.svg"));
    (S_sv    , God.Animate.load_file_exn (component_dir / "sv.svg"));
    (S_td    , God.Animate.load_file_exn (component_dir / "td.svg"));
    (S_th    , God.Animate.load_file_exn (component_dir / "th.svg"));
    (S_thtaj , God.Animate.load_file_exn (component_dir / "thtaj.svg"));
    (S_thtj  , God.Animate.load_file_exn (component_dir / "thtj.svg"));
    (S_tht   , God.Animate.load_file_exn (component_dir / "tht.svg"));
    (S_tj    , God.Animate.load_file_exn (component_dir / "tj.svg"));
    (S_tod   , God.Animate.load_file_exn (component_dir / "tod.svg"));
    (S_t     , God.Animate.load_file_exn (component_dir / "t.svg"));
    (S_tu    , God.Animate.load_file_exn (component_dir / "tu.svg"));
    (S_ufp   , God.Animate.load_file_exn (component_dir / "ufp.svg"));
    (S_uj    , God.Animate.load_file_exn (component_dir / "uj.svg"));
    (S_up    , God.Animate.load_file_exn (component_dir / "up.svg"));
    (S_u     , God.Animate.load_file_exn (component_dir / "u.svg"));
    (S_utj   , God.Animate.load_file_exn (component_dir / "utj.svg"));
    (S_vaj   , God.Animate.load_file_exn (component_dir / "vaj.svg"));
    (S_va    , God.Animate.load_file_exn (component_dir / "va.svg"));
    (S_vcj   , God.Animate.load_file_exn (component_dir / "vcj.svg"));
    (S_vc    , God.Animate.load_file_exn (component_dir / "vc.svg"));
    (S_vh    , God.Animate.load_file_exn (component_dir / "vh.svg"));
    (S_vhtj  , God.Animate.load_file_exn (component_dir / "vhtj.svg"));
    (S_vht   , God.Animate.load_file_exn (component_dir / "vht.svg"));
    (S_vhv   , God.Animate.load_file_exn (component_dir / "vhv.svg"));
    (S_vj    , God.Animate.load_file_exn (component_dir / "vj.svg"));
    (S_v     , God.Animate.load_file_exn (component_dir / "v.svg"));
    (S_vu    , God.Animate.load_file_exn (component_dir / "vu.svg"));
    (S_wd    , God.Animate.load_file_exn (component_dir / "wd.svg"));
    (S_wtd   , God.Animate.load_file_exn (component_dir / "wtd.svg"));
    (S_wt    , God.Animate.load_file_exn (component_dir / "wt.svg"));
    ]
    |> List.to_seq
    |> StrokeMap.of_seq
  in
  let god= God.load_file god_dir unicode in
  let data= God.animate_svg_of_god ~stroke_animate god in
  Core.Out_channel.write_all ~data output_name

