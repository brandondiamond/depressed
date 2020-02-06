include(`src/_header.html')

  <section class="primary">
    <div class="frame">
      <div class="hero">
        <div class="content">
          <h1>Real stories from<br /> New Yorkers.</h1>
          <div class="text">
            <p><strong>Half a million people</strong> live with depression in New York City&mdash;<br /> we <a href="http://instagram.com/depressednyc" target="_blank">feature</a> one of their stories, weekly.</p>
          </div>
          <div class="actions">
            <a class="button" target="_blank" href="http://instagram.com/depressednyc">Follow</a>
            <a class="button outline" href="submit.html">Submit</a>
          </div>
        </div>

        <div class="art">
          <figure>
            <img src="img/letter-big.svg">
          </figure>
        </div>
      </div>
    </div>
  </section>

  <section id="stories" class="secondary">
    <div class="frame">
      <div class="filter">
        <p>Stories about</p>
        <a href="#" class="everything" data-key="everything">everything</a>
        <a href="#" data-key="challenges">challenges</a>
        <a href="#" data-key="hope">hope</a>
        <a href="#" data-key="man">men</a>
        <a href="#" data-key="woman">women</a>
      </div>

      <div class="stories">
      <!--
        <div class="story" data-keys="man hope">
          <div class="image">
            <img src="https://source.unsplash.com/random/390x450/?city,nyc,urban+">
          </div>
          <div class="content">
            <div class="date">December 24th, 2019</div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dui diam, sollicitudin sit amet lectus eu, elementum accumsan velit. Maecenas erat mauris, sagittis vel pulvinar eu, porta at lorem. Morbi dictum metus vitae aliquet ullamcorper. Vivamus sodales tincidunt massa eget maximus. Proin id arcu mi. Nam ante quam, aliquet vitae auctor in, laoreet nec enim. Vestibulum a eros mi. Praesent maximus mauris nec nunc volutpat vehicula. Etiam eleifend semper erat a euismod. Nulla condimentum neque eget orci dapibus vulputate. Maecenas congue, est vel rhoncus ultrices, dui arcu ornare enim, auctor gravida odio orci sit amet est. In at tortor ut mauris egestas efficitur a a eros. Sed convallis sapien nec quam porta, eu imperdiet massa maximus.</p>
            <div class="attribution">
              <span class="name">Anonymous</span>
              <span class="gender">Man</span>
              <span class="job">Engineer</span>
            </div>
          </div>
        </div>
        -->
        <div class="story" data-keys="woman challenges hope">
          <div class="image">
            <img src="img/stories/christine.jpg">
          </div>
          <div class="content">
            <div class="date">February 4th, 2020</div>
            <p>Depression and anxiety crept in while I was in my early 20’s. Before that, I took my health for granted. But, working as a fitness professional and dietitian, I felt under immense pressure to look, eat, and live a certain way. So when I started to feel exhausted all the time, hopeless, &amp; binge eating every day to numb out from everything I didn’t want to deal with around me, I went deeper into a shame spiral.</p>
            <p>“This was NOT how someone who is supposed to know what to eat and how to exercise behaves,” I would tell myself. I felt like I was always failing. At the time I really had no idea what was happening. All I knew was I was I was a shell of the person I used to be, and was too embarrassed to say anything to anyone about. I felt there was nothing to look forward to, and I felt like there never would be again.</p>
            <p>One day I made a connection after I dragged myself to a yoga class that I felt significantly better, lighter, more myself than I had in a year. Movement, the thing I took for granted previously, ended up being the thing that helped me lift myself out of depression. My purpose became healing myself, and my anti-depressant of choice was moving my body</p>
            <div class="attribution">
              <span class="name">Christine Coen</span>
              <span class="gender hide">Woman</span>
              <span class="job">Founder, The Warrior Evolution</span>
              <span class="extra"><a href="http://instagram.com/christine.coen" target="_blank">@christine.coen</a></span>
            </div>
          </div>
        </div>
      </div>

      <div class="pager">
        <span class="label">Page </span>
        <span class="pages"></span>
      </div>
    </div>
  </section>

include(`src/_urgent.html')
include(`src/_footer.html')
