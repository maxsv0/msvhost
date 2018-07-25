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

<div style="background-color:#fff;">
<div class="container">
    <div class="row content-offset">
        <div class="col-md-10 col-md-offset-1">
            <h2>How it works</h2>
            <br>
            <center>
                <img src="/content/how%20it%20works-v2%20(1)-5b558a25ead36.png" class="img-responsive">
            </center>
        </div>
    </div>
</div>
</div>


<div class="container">
    <div class="row">
        <div class="col-sm-7 col-sm-offset-5 content-block content-offset">
            <form class="form-horizontal" method="POST" action="/create/" >
                <div class="col-sm-10 col-sm-offset-1">
                    <h2>Start TRIAL and create free website right now</h2>
                </div>
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="form-group">
                        <label>Name of a website</label>
                        <input name="websiteurl" type="text" class="form-control" placeholder="samplename2018" value="">
                    </div>
                </div>
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="form-group">
                        <label>Your Email</label>
                        <input name="email" type="email" class="form-control" placeholder="max@msvhost.com" value="max@msvhost.com">
                    </div>
                </div>
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="form-group">
                        <label for="terms">
                            <input type="checkbox" id="terms" name="terms" value="1">
                            &nbsp;&nbsp;
                            <a href="/terms-and-conditions/" target="_blank">I agree to <a href="/terms-and-conditions/">terms and conditions</a> of a service</a>
                        </label>
                    </div>
                </div>
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="form-group text-center">
                        <input name="startTrial" type="submit" class="btn btn-primary btn-block" value="Create FREE website">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div style="background:url(/content/promo1-5b4e3e43143f3.jpg) no-repeat;background-color:#fff;background-size:cover;">
<div class="container">
    <div class="row">
        <div class="col-md-5 col-sm-6 col-md-offset-7 col-sm-offset-6" style="background-color: rgba(255,255,255,0.8); height: 600px;">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <h2>Flexible customization</h2>
            <p>&nbsp;</p>
            <div class="lead">Sitograph CMS is a modular system and can be adapted to match 100% of your needs.</div>
            <p>&nbsp;</p>
            <p class="lead"><a href="/create/" class="btn btn-primary btn-lg" target="_blank"><span class="glyphicon glyphicon-circle-arrow-right"></span> Create a free website in 5 minutes</a>&nbsp;</p>
        </div>
    </div>
</div>
</div>


<div style="background-color:#fff;">
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <h2 style="margin-left:70px;margin-top:50px;">Sitograph CMS features</h2>
            <ul class="lead" style="margin-left:70px; line-height: 2;">
                <li>Edit documents, photos, videos</li>
                <li>Adaptive web design</li>
                <li>Email Marketing</li>
                <li>Multi-language support</li>
                <li>Configurable JSON API</li>
                <li>Real-time analytics</li>
            </ul>
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
</div>


<div style="background-color: rgba(255,255,255,0.9);">
<div class="container">
    <div class="row content-offset">
        <div class="col-sm-4 col-sm-offset-3">
            <a href="/create/" type="button" class="btn btn-default btn-lg btn-block">
                <span class="glyphicon glyphicon-circle-arrow-right"></span> Visit Demo Sitograph CMS
            </a>
        </div>
        <div class="col-sm-3">
            <a href="https://github.com/maxsv0/sitograph/" class="btn btn-default btn-lg" target="_blank">
                <span class="glyphicon glyphicon-circle-arrow-right"></span> Visit GitHub</a>
        </div>
    </div>
</div>
</div>


<div style="background-color:#fff;">
<div class="container">
    <div class="row">
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
</div>


<div style="background-color: rgba(255,255,255,0.9);">
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3 content-offset">
            <a href="/create/" type="button" class="btn btn-primary btn-lg btn-block">Start FREE Trial now</a>
        </div>
    </div>
</div>
</div>

{include file="$themePath/widget/footer.tpl"}
