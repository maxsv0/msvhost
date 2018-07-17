{include file="$themePath/widget/header.tpl"}

<div class="container top-menu">
    <div class="row">
        {include file="$themePath/widget/menu-top.tpl"}
    </div>
</div>


<div class="container">




  <div class="row content-offset">
      
      <div class="col-sm-12">
          <h1 style="color:white;">Recently created websites</h1>
          <br>
      </div>

{foreach from=$instance_list item=instance}
      <div class="col-sm-6">
        {include file="$themePath/widget/block_instance.tpl"}
      </div>
{/foreach}

  </div>
    
    
</div><!---/container---->



<div class="row" style="background:url(https://www.sitograph.com/content/images/sitograph/sitograph-promo-responsive.png) no-repeat;background-color:#fff;background-size:cover;">
    <div class="container">
        <div class="col-md-5 col-sm-6 col-md-offset-7 col-sm-offset-6" style="background-color: rgba(255,255,255,0.8); height: 600px;">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <h2>Flexible customization</h2>
            <p>&nbsp;</p>
            <div class="lead">Sitograph CMS is a modular system and can be adapted to match 100% of your needs.</div>
            <p>&nbsp;</p>
            <p class="lead"><a href="http://demo.sitograph.com/" class="btn btn-primary btn-lg" target="_blank"><span class="glyphicon glyphicon-circle-arrow-right"></span> Visit Demo Sitograph CMS</a>&nbsp;</p>
        </div>
    </div>
</div>

<div class="row" style="background-color:#fff;">
    <div class="container">
        <div class="col-md-5">
            <h2 style="margin-left:70px;margin-top:50px;">Sitograph CMS features</h2>
            <ul class="lead" style="margin-left:70px; line-height: 2;">
                <li>Edit documents, photos, videos, etc.</li>
                <li>Adaptive web design</li>
                <li>Email Marketing</li>
                <li>Multi-language support</li>
                <li>Configurable JSON API</li>
                <li>User management and real-time analytics</li>
            </ul>
            <p>&nbsp;</p>
        </div>
        <div class="col-md-7">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>
                <img src="https://www.sitograph.com/content/images/sitograph/sitograph-promo-laptop.png" alt="Sitograph CMS" class="img-responsive">
            </p>
        </div>
    </div>
</div>


<div class="row" style="background-color: rgba(255,255,255,0.9);">
    <div class="container">
        <div class="col-sm-6 col-sm-offset-3 content-offset">
            <a href="/create/" type="button" class="btn btn-primary btn-lg btn-block">Create your own online business</a>
        </div>
    </div>
</div>


<div class="row" style="background-color:#fff;">
    <div class="container">
        <div class="col-md-5">
            <h2 style="margin-left:70px;margin-top:50px;">Customize your website</h2>
            <ul class="lead" style="margin-left:70px; line-height: 2;">
                <li>Ready in <u>5 minutes</u></li>
                <li>Hosted by Google Cloud<br><b>99.99% Monthly Uptime</b></li>
                <li>Open Source CMS</li>
                <li>Google API enabled</li>
                <li>Email Marketing enabled</li>
                <li>Daily backups</li>
            </ul>
            <p>&nbsp;</p>
        </div>
        <div class="col-md-7">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>
                <a href="/create/">
                    <img src="/content/msvhost-create-5b4df0034706f.png" class="img-thumbnail">
                </a>
            </p>
        </div>
    </div>
</div>


<div class="row" style="background-color: rgba(255,255,255,0.9);">
    <div class="container">
        <div class="col-sm-6 col-sm-offset-3 content-offset">
            <a href="/create/" type="button" class="btn btn-primary btn-lg btn-block">Start FREE Trial now</a>
        </div>
    </div>
</div>

{include file="$themePath/widget/footer.tpl"}
