function animateCity(W, H) {
  const G = 6;
  const BG = "#000";
  const FG = "rgb(255,0,147)";
  const LT = "#fff";
  const P = 10;
  const S = 2000;

  function snap(v, g) {
    return g ? (v ? Math.round(v / g) * g : 0) : v;
  }

  function rnd(m, M, c) {
    let r = Math.random();
    if (c) r = c(r);
    return (m + r * (M - m));
  }

  function rs(m, M, g, c) {
    return snap(rnd(m, M, c), g);
  }

  function lst(a) {
    return a[a.length-1];
  }

  function computeSkyline(w, h, wB, hB, pS, s, d, g) {
    let points = [[0, h]];
    let lights = [];
    let fix = 0;
    while (lst(points)[0] < w) {
      let sN = rnd(0, 100) < pS ? rs(0, s, g) : 0;
      let wN = Math.max(g, rs(wB / 10, wB, g));
      let hN = Math.max(g, rs(hB / 10, sN ? hB - sN : hB, g));
      let dN = rs(0, d, g, (r) => Math.pow(r, 5));
      let pos = lst(points);
      for(let x=pos[0]+g; x <= pos[0] + wN - g; x += g)
        for(let y=h-g; y >= pos[1] - hN + fix + g; y -= g)
          lights.push([x, y]);
      points.push([pos[0], pos[1] - hN + fix]);
      if (sN) 
        points.push([pos[0] + (sN < 10 ? rnd(g, wN - g) : wN / 2), pos[1] - hN + fix - sN]);
      points.push([pos[0] + wN, pos[1] - hN + fix]);
      if (!dN) {
        fix = hN;
        continue;
      }
      points.push([pos[0] + wN, h]);
      points.push([pos[0] + wN + dN, h]);
      fix = 0;
    }
    if (fix)
      points.push([lst(points)[0], h]);
    return { s: points, l: lights };
  }

  function centerSkyline(gfx, w, h, g) {
    const sw = lst(gfx.s)[0] - gfx.s[0][0];
    const sm = gfx.s.map((p) => [p[0] + snap(w / 2 - sw / 2, g), p[1]]);
    const lm = gfx.l.map((p) => [p[0] + snap(w / 2 - sw / 2, g), p[1]]);
    sm.unshift([0, h]);
    sm.push([w, h]);
    return { s: sm, l: lm };
  }

  function drawSkyline(draw, gfx) {
    // TODO: animate stroke
    const gradient = draw.gradient('linear', function(add) {
      add.stop(0,   FG, 1);
      add.stop(0.8, FG, 0.8);
      add.stop(1,   FG, 0.4);
    }).rotate(90);
    return draw.polyline(gfx.s).fill('none')
               .opacity(0)
               .stroke({ linejoin: 'round', linecap: 'round', color: gradient, width: 1 })
               .animate(1000)
               .opacity(0.4);
  }

  function drawLights(draw, gfx, p, s, ss, d) {
    let skip = 0;
    const dl = () =>
    gfx.l.forEach((l) => {
      const dl = Math.max(1, ss + rnd(-d,d));
      const dr = rnd(200, 1000);
      const wt = 2 * ss + rnd(0,d);
      if (skip-- <= 0 && rnd(0, 100) < p) {
        const r = draw.rect(s, s).move(l[0]-s/2, l[1]-s/2).fill(LT).opacity(0);
        const b = Math.max(0.3, Math.min(1, (H - l[1]) / H));
        r.animate(dr, dl).opacity(b).delay(wt).animate(dr).opacity(0).after(() => r.remove());
      }
    });
    dl(); setInterval(dl, 5*ss);
  }

  let draw = SVG().size(W, H).addTo("#city");
  //let gfx = centerSkyline(computeSkyline(W / 2, H, 50, H, 20, 30, 20, G), W, H, G);
  let gfx = computeSkyline(W, H, 50, H, 20, 30, 20, G);

  drawSkyline(draw, gfx);
  drawLights(draw, gfx, 10, 2, S, 1500);
}

$(function() {
  animateCity($("#city").width(), $("#city").height());
});
