<div class="row">
  <div class="col-xs-3 social-button">
      <a href="https://twitter.com/share" class="twitter-share-button" data-hashtags="ezpublish">Tweet</a>
      {literal}<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>{/literal}
  </div>
  <div class="col-xs-3 social-button">
      <div class="fb-like" data-send="false" data-layout="button_count" data-width="90" data-show-faces="false"></div>
  
      <div id="fb-root"></div>
      {literal}
      <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>
      {/literal}
  </div>
  <div class="col-xs-3 social-button">
      <div class="g-plusone" data-size="medium"></div>
  
      <script type="text/javascript">
          {literal}
          (function() {
          var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
          po.src = 'https://apis.google.com/js/plusone.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
          })();
          {/literal}
      </script>
  </div>
  
  {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'tipafriend' ) )}
  {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
      <div class="col-xs-3 social-button">
        <a class="btn btn-default btn-xs" href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ocbootstrap/full/article' )}">
          <span class="glyphicon glyphicon-fast-forward"></span> {'Tip a friend'|i18n( 'design/ocbootstrap/full/article' )}
        </a>
      </div>
  {/if}
</div>