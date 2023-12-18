[#include "/smrt/includes/ftls/settings.ftl"/]
<section id="social-feeds">
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-sm-12">
        <article>
          <div class="title-bg">
            <img src="${htmlInResources}/icon-pencil.png" alt="Journey Planner">
            <h4>Journey Planner</h4>
          </div>
          <div class="block-content">
            <div class="journey-planner">
              <div class="form-group add-icon">
                <label for="from">From</label>
                <input type="text" class="form-control" id="frominput" placeholder="Postal code / Address / Station">
                <a id="btn-from" onclick="myFunction(this)"></a>
                <ul id="list-stations-1" class="list-stations" style="display: none;"></ul>
              </div>
              <!-- start of reverse switch -->
              <div class="divSwitch">
                <a class="menu-list float" onclick="reverseRoute()">
                  <img src="${htmlInResources}/i_reverse2x.png">
                </a>
              </div>
              <!-- end of reverse switch -->
              <div class="form-group add-icon">
                <label for="to">To</label>
                <input type="text" class="form-control" id="toinput" placeholder="Postal code / Address / Station">
                <a id="btn-to" onclick="myFunction(this)"></a>
                <ul id="list-stations-2" class="list-stations" style="display: none;"></ul>
              </div>
              <div class="form-group">
                <label for="route">Route Option</label>
                <select class="form-group" id="routeOption">
                  <option value="1" selected="selected">Fastest</option>
                  <option value="2">Cheapest</option>
                </select>
              </div>
              <div class="form-group">
                <label for="recent">or Select Recent Journey</label>
                <select class="form-group" id="recentJourney">
                  <option value="0" selected="selected"></option>
                </select>
              </div>
              <a id="calculateRouteButton" onclick="calculateRoute()" class="btn btn-primary btn-block">LET'S GO </a>
            </div>
          </div>
        </article>
      </div>
      <div class="col-md-4 col-sm-12">
        <article>
          <div class="title-bg">
            <img src="${htmlInResources}/icon-facebook.png" alt="Facebook">
            <h4>Facebook Feeds</h4>
            <a href="https://www.facebook.com/SMRTCorpSG" target="_blank">Follow</a>
          </div>
          <div class="block-content text-center">
            <div id="fb-root"></div>
            <script>
                    function fbLoad(d) {
                      const s = 'script';
                      const id = 'facebook-jssdk';
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.10";
                fjs.parentNode.insertBefore(js, fjs);
              };
                    fbLoad(document);
              </script>

            <div class="fb-page" data-href="https://www.facebook.com/SMRTCorpSG" data-tabs="timeline" data-width="350" data-height="400" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="false"><blockquote cite="https://www.facebook.com/SMRTCorpSG" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/SMRTCorpSG">SMRT</a></blockquote></div>
          </div>
        </article>
      </div>
      <div class="col-md-4 col-sm-12">
        <article>
          <div class="title-bg">
            <img src="${htmlInResources}/icon-twitter.png" alt="Twitter">
            <h4>Twitter Feeds</h4>
            <a href="https://twitter.com/smrt_singapore" target="_blank">Follow</a>
          </div>
          <div class="block-content">
            <a class="twitter-timeline" href="https://twitter.com/SMRT_Singapore" data-widget-id="460708053579358209" data-chrome="nofooter noheader transparent" data-tweet-limit="3" data-theme="light">Tweets by @SMRT_Singapore</a><script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>
            <div class="gap"></div>

            <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
          </div>
        </article>
      </div>
    </div>
  </div>
</section>