include(`src/_header.html')

  <section id="submit" class="primary informational">
    <div class="frame">
      <h1>Share Your Story</h1>
      <p>Sharing your experience is a great way to help others understand what depression feels like.</p>
      <p>It also helps people living with depression see that they aren't alone. If you've had success with treatment, that would be valuable to share, too.</p>
      
      <hr />

      <form>
        <div class="message">Your story has been submitted. Thank you!</div>
        <div>
          <label>Name <span>(Optional)</span></label>
          <div class="hint">Your story will be labeled "anonymous" if left blank.</div>
          <input type="text" name="name" placeholder="John Smith">
        </div>
        <div>
          <label>Email <span>(Optional)</span></label>
          <div class="hint">Never shared&mdash; we only use this to follow-up if needed.</div>
          <input type="email" name="email" placeholder="jsmith@example.com">
        </div>
        <div>
          <label>Sex <span>(Optional)</span></label>
          <div class="hint">This information helps visitors find relevant stories.</div>
          <div>
            <input type="radio" value="m" name="sex" id="radio-m"> <label for="radio-m">Male</label>
          </div>
          <div>
            <input type="radio" value="f" name="sex" id="radio-f"> <label for="radio-f">Female</label>
          </div>
          <div>
            <input type="radio" value="o" name="sex" id="radio-o"> <label for="radio-o">Other</label>
          </div>
          </select>
        </div>
        <div>
          <label>Job Title <span>(Optional)</span></label>
          <input type="text" name="job" placeholder="Engineer">
        </div>
        <div>
          <label>Your Story <span>(Minimum 200 letters)</span></label>
          <div class="hint">How has depression affected you?</div>
          <textarea name="story" placeholder="Please type your story here." minlength="200" required></textarea>
        </div>
        <div>
          <input type="checkbox" name="tos" required>
          <label class="tos">I have read and agreed to the <a target="_blank" href="legal.html">terms of service</a>.</label>
        </div>
        <div>
          <button class="button outline" type="button">Submit</button>
        </div>
      </form>
      
      <hr />

      <h2>Sample Excerpts</h2>

      <div class="examples">
        <q>For me, depression is less about feeling sad and more about feeling nothing. Things just don&rsquo;t matter.</q>
        <q>My friends try to reach out, and I miss them, but I just don&rsquo;t have any energy to reply.</q>
        <q>I go to work, go through the motions, nobody knows that I&rsquo;m on the verge of bursting into tears.</q>
        <q>It&rsquo;s just that I have no more energy to fight and feel broken all the time.</q>
        <q>After years of being numb and resigned, I decided to give medication one more try... after finding the right one, I started to feel better.</q>
      </div>
    </div>
  </section>

include(`src/_urgent.html')
include(`src/_footer.html')
<script src="https://www.gstatic.com/firebasejs/7.6.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.6.1/firebase-firestore.js"></script>
