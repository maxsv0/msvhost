<div class="row">
    <h4 class="info-text">Please tell us more about your new website</h4>

    <div class="col-sm-10 col-sm-offset-1">
        {include file="$themePath/widget/messages.tpl"}
    </div>

    <div class="col-sm-10 col-sm-offset-1">
        <div class="form-group">
            <label>Name of a website <small>(required)</small></label>
            <input name="websiteurl" type="text" class="form-control" placeholder="samplename2018" onchange="$('#input_production_endpoint').html($(this).val().toLowerCase()+'.msvhost.com')" value="{$website_url}">
        </div>
    </div>
    <div class="col-sm-10 col-sm-offset-1">
        <div class="form-group">
            <label>Administrator Email <small>(required)</small></label>
            <input name="email" type="email" class="form-control" placeholder="max@msvhost.com" value="{$website_email}">
        </div>
    </div>
    <div class="col-sm-10 col-sm-offset-1">
        <div class="form-group">
            <label>Language</label>
            <select class="form-control" name="language">
                <option value="en" selected>English</option>
                <option value="ru">Русский</option>
            </select>
        </div>
    </div>
    <div class="col-sm-10 col-sm-offset-1">
        <div class="form-group">
            <label>Service Providers</label>
            <div class="img-thumbnail text-center" style="width:100%;padding:20px;">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-1">
                        <a href="https://cloud.google.com/" target="_blank">
                            <img class="img-responsive" src="https://cloud.google.com/_static/bdb9b43e5e/images/cloud/cloud-logo.svg" style="margin:15px 0;">
                        </a>
                        <a href="https://cloud.google.com/" target="_blank">cloud.google.com</a>
                    </div>
                    <div class="col-sm-4 col-sm-offset-1">
                        <a href="https://www.sitograph.com/" target="_blank">
                            <img class="img-responsive " src="https://www.sitograph.com/content/images/sitograph/sitograph-logo-dark-en.png">
                        </a>
                        <a href="https://www.sitograph.com/" target="_blank">www.sitograph.com</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>