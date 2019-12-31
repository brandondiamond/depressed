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
               .opacity(0.5);
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

function handleStories(p, $s) {
  const multi = false;
  const active = {};
  const $fs = $s.find(".filter a");
  const $ps = $s.find(".pager");
  let stories = [];
  let page = 0, pages = 0;
  let every = false;
  $fs.click(function() {
    const key = $(this).data("key");
    if (key == "everything") {
      $fs.not(".everything").each(function() {
        active[$(this).data("key")] = true;
      });
    } else {
      if(!multi || every) {
        for (k in active) {
          active[k] = false;
        }
      }
      active[key] = every ? true : !active[key];
    }
    for(let k in active) {
      $fs.filter("[data-key=" + k + "]").toggleClass("active", active[k]);
    }
    every = Object.values(active).filter((x)=>x).length == $fs.length - 1;
    $fs.filter(".everything").toggleClass("active", every);
    stories = [];
    $(".story").each(function() {
      const $t = $(this);
      if (!$t.data("keys").split(" ").some((k) => active[k])) {
        $t.removeClass("visible");
        return;
      }
      stories.push($t);
    });
    pages = Math.ceil(stories.length / p);
    $ps.find(".pages").empty();
    for (let i=0; i<pages; i++) {
      $ps.find(".pages").append($("<a href='#' data-page='" + (i) + "' class='page'>" + (i+1) + "</a>"));
    }
    $ps.find(".page").click(function() {
      $ps.find(".page").removeClass("active");
      const $p = $(this).addClass("active");
      page = $p.data("page");
      stories.forEach((s, i) => {
        $(s).toggleClass("visible", page * p <= i && i < (page+1)*p);
      });
      return false;
    });
    if (pages < 2) $ps.hide();
    else $ps.show();
    $ps.find("[data-page=0]").click();
    return false;
  });
  $fs.filter(".everything").click();
}

function handleMenu($n) {
  $n.find(".hamburger").click(() => $n.toggleClass("active") && $("body").toggleClass("modal"));
	$(window).scroll(function (event) {
  	const scroll = $(window).scrollTop();
		$("body").toggleClass("scroll", scroll > 60);
	});
}

function handleSubmit($s) {
  const scrollToTop = () => {
    const c = document.documentElement.scrollTop || document.body.scrollTop;
    if (c > 0) {
      window.requestAnimationFrame(scrollToTop);
      window.scrollTo(0, c - c / 8);
    }
  };

  firebase.initializeApp({
    apiKey: 'AIzaSyCfPJ0LcQ4ljsueOGUuYPocnlgyPhJW60M',
    projectId: 'depressed-nyc'
  });

  const db = firebase.firestore();
  $s.find("button").click(() => {
    const name = $s.find("[name=name]").val();
    const email = $s.find("[name=email]").val();
    const sex = $s.find("[name=sex]:checked").val();
    const job = $s.find("[name=job]").val();
    const story = $s.find("[name=story]").val();
    const tos = !!$s.find("[name=tos]:checked").length;
    if (!tos) return;
    if (story.length < parseInt($s.find("[name=story]").attr("minlength"))) return;
    db.collection("stories").add({
      name: name || '',
      email: email || '',
      sex: sex || '',
      job: job || '',
      story: story || ''
    })
    .then(function(docRef) {
      $("[type=text],[type=email],textarea").val("");
      $("[type=checkbox],[type=radio").prop("checked", false);
      $s.find("form").addClass("saved");
      scrollToTop();
    });
    return false;
  });
}

$(function() {
  handleMenu($("header nav"));
  $("#city").length && animateCity($("#city").width(), $("#city").height());
  $("#stories").length && handleStories(5, $("#stories"));
  $("#submit").length && handleSubmit($("#submit"));
});
