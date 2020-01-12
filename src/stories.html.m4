include(`src/_header.html')

  <section class="primary">
    <div class="frame">
      <div class="hero">
        <div class="content">
          <h1>Depression is more than sadness.</h1>
          <div class="text">
            <p><strong>Half a million people</strong> live with depression in New York City&mdash; these are just a few of their stories.</p>
          </div>
          <a class="button outline" href="submit.html">add your story</a>
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
        <div class="story" data-keys="man hope">
          <img src="https://source.unsplash.com/random/390x450/?city,nyc,urban">
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

        <div class="story" data-keys="woman challenges">
          <img src="https://source.unsplash.com/random/390x450/?city,nyc,urban+">
          <div class="content">
            <div class="date">December 22nd, 2019</div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dui diam, sollicitudin sit amet lectus eu, elementum accumsan velit. Maecenas erat mauris, sagittis vel pulvinar eu, porta at lorem. Morbi dictum metus vitae aliquet ullamcorper. Vivamus sodales tincidunt massa eget maximus. Proin id arcu mi. Nam ante quam, aliquet vitae auctor in, laoreet nec enim. Vestibulum a eros mi. Praesent maximus mauris nec nunc volutpat vehicula. Etiam eleifend semper erat a euismod. Nulla condimentum neque eget orci dapibus vulputate. Maecenas congue, est vel rhoncus ultrices, dui arcu ornare enim, auctor gravida odio orci sit amet est. In at tortor ut mauris egestas efficitur a a eros. Sed convallis sapien nec quam porta, eu imperdiet massa maximus.</p>
            <div class="attribution">
              <span class="name">Anonymous</span>
              <span class="gender">Woman</span>
              <span class="job">Executive</span>
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
