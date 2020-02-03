include(`src/_header.html')

  <section id="volunteer" class="primary informational">
    <div class="frame">
      <h1>Get Involved</h1>
      <p>Depressed NYC is a grassroots movement committed to fighting depression in New York City through storytelling, outreach, and visibility.</p>
      <p>If you're passionate about fighting depression in NYC, we'd love to collaborate&mdash; all skillsets can make a difference.</p>

      <hr />

      <form>
        <div class="message">Your information has been submitted. Thank you!</div>
        <div>
          <label>Name</label>
          <input type="text" name="name" placeholder="John Smith" required>
        </div>
        <div>
          <label>Email</label>
          <div class="hint">We'll follow-up with you by email.</div>
          <input type="email" name="email" placeholder="jsmith@example.com" required>
        </div>
        <div>
          <label>Your Background</label>
          <div class="hint">How would you like to contribute?</div>
          <textarea name="background" placeholder="Please type your background here." required></textarea>
        </div>
        <div>
          <button class="button outline" type="submit">Submit</button>
        </div>
      </form>
  </section>

include(`src/_urgent.html')
include(`src/_footer.html')
<script src="https://www.gstatic.com/firebasejs/7.6.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.6.1/firebase-firestore.js"></script>
