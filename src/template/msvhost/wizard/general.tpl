<div class="row">
    <h4 class="info-text">Please tell us more about your new website</h4>

    <div class="col-sm-10 col-sm-offset-1">
        <div class="form-group">
            <label>Name of a website <small>(required)</small></label>
            <input name="websitename" type="text" class="form-control" placeholder="samplename2018" onchange="$('#input_production_endpoint').val($(this).val().toLowerCase()+'.msvhost.com')">
        </div>
    </div>
    <div class="col-sm-10 col-sm-offset-1">
        <div class="form-group">
            <label>Administrator Email <small>(required)</small></label>
            <input name="email" type="email" class="form-control" placeholder="max@msvhost.com" value="{$wizard_email}">
        </div>
    </div>
    <div class="col-sm-4 col-sm-offset-1">
        <div class="form-group">
            <label>Hosting Provider:</label>
            <div class="img-thumbnail text-center" style="width:100%;padding:20px 5px;">
                <a href="https://cloud.google.com/" target="_blank">
                    <img class="img-responsive" src="https://cloud.google.com/_static/bdb9b43e5e/images/cloud/cloud-logo.svg">
                </a>
                <a href="https://cloud.google.com/" target="_blank">cloud.google.com</a>
            </div>
        </div>
    </div>
    <div class="col-sm-4 col-sm-offset-1">
        <div class="form-group">
            <label>CMS:</label>
            <div class="img-thumbnail text-center" style="width:100%;">
                <a href="https://www.sitograph.com/" target="_blank">
                    <img class="img-responsive " src="https://www.sitograph.com/content/images/sitograph/sitograph-logo-dark-en.png">
                </a>
                <a href="https://www.sitograph.com/" target="_blank">www.sitograph.com</a>
            </div>
        </div>
    </div>

</div>