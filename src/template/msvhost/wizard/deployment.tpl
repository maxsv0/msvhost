<div class="row">
    <div class="col-sm-12">
        <h4 class="info-text"> Deployment options </h4>
    </div>

    <div class="col-sm-7 col-sm-offset-2 well">

        <div class="row">
            <p class="col-sm-5">Endpoint URL</p>
            <p class="col-sm-7">
                <b id="input_production_endpoint"></b>
            </p>

            <p class="col-sm-5">Website type</p>
            <p class="col-sm-7">
                <b id="text_website_type">Theme Default</b>
            </p>

            <p class="col-sm-5">Instance type</p>
            <p class="col-sm-7">
                <b id="text_website_architecture">Production</b>
            </p>

            <p class="col-sm-5">Instance size</p>
            <p class="col-sm-7">
                <span id="text_website_size">f1-micro</span>
            </p>

            <p class="col-sm-5">Disk</p>
            <p class="col-sm-7">
                <span id="text_website_disk">10</span>
            </p>

            <p class="col-sm-5">Location</p>
            <p class="col-sm-7">
                <span id="text_website_location">us-central1</span>
            </p>
        </div>
    </div>


    <div class="col-sm-6 col-sm-offset-6">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </div>

    <div class="col-sm-8 col-sm-offset-1 well" style="background: #fdfaf3;">

        <div class="form-group">
            <label for="inputserver">Instance size <span style="color:red;">*</span></label>
            <select class="form-control" id="inputserver" name="website_size" onchange="wizard_update_texts();" readonly="readonly" disabled>
                <option value="micro" selected>f1-micro, 0.6 GB memory, 1 shared vCPU - $4.49 per month</option>
                <option value="small">g1-small, 1.7 GB memory, 1 shared vCPU - $14.20 per month</option>
                <option value="standard1">n1-standard-1, 3.75 GB memory, 1 vCPU - $25.95 per month</option>
                <option value="standard2">n1-standard-2, 7.5 GB memory, 2 vCPU - $51.50 per month</option>
                <option value="standard3">n1-standard-4, 15 GB memory, 4 vCPU - $102.60 per month</option>
                <option value="standard4">n1-standard-8, 30 GB memory, 8 vCPU - $204.80 per month</option>
                <option value="standard5">n1-standard-16, 60 GB memory, 16 vCPU - $409.20 per month</option>
            </select>
        </div>

        <div class="form-group">
            <label for="inputdisk">Disk size, GB <span style="color:red;">*</span></label>
            <input class="form-control" id="inputdisk" name="website_disk" onchange="wizard_update_texts();" value="10" readonly>
        </div>

        <div class="form-group">
            <label for="inputserverzone">Hosting location</label>
            <select class="form-control" id="inputserverzone" name="website_zone" onchange="wizard_update_texts();">
                <option value="us-central1-a" selected>us-central1-a (Council Buffs, IA)</option>
                <option value="us-central1-b" selected>us-central1-b (Council Buffs, IA)</option>
                <option value="us-central1-c" selected>us-central1-c (Council Buffs, IA)</option>
                <option value="us-central1-f" selected>us-central1-f (Council Buffs, IA)</option>
                {*<option value="us-east1">us-east1 (Moncks Corner, SC)</option>*}
                {*<option value="us-east4">us-east4 (Ashburn, VA)</option>*}
                {*<option value="us-west1">us-west1 (The Dalles, OR)</option>*}
                {*<option value="europe-north1">europe-north1 (Hamina, Finland)</option>*}
                <option value="europe-west1-b">europe-west1-b (St. Ghislain, Belgium)</option>
                <option value="europe-west1-c">europe-west1-c (St. Ghislain, Belgium)</option>
                <option value="europe-west1-d">europe-west1-d (St. Ghislain, Belgium)</option>
                {*<option value="europe-west2">europe-west2 (London, UK)</option>*}
                {*<option value="europe-west3">europe-west3 (Frankfurt, Germany)</option>*}
                {*<option value="europe-west4">europe-west4 (Eemshaven, Netherlands)</option>*}
                {*<option value="northamerica-northeast1">northamerica-northeast1 (Montréal, Quebec, Canada)</option>*}
                {*<option value="southamerica-east1">southamerica-east1 (São Paulo, Brazil)</option>*}
                {*<option value="australia-southeast1">australia-southeast1 (Sydney, Australia)</option>*}
                {*<option value="asia-south1">asia-south1 (Mumbai, India)</option>*}
                {*<option value="asia-southeast1">asia-southeast1 (Jurong West, Singapore)</option>*}
                {*<option value="asia-east1">asia-east1 (Changhua County, Taiwan)</option>*}
                {*<option value="asia-northeast1">asia-northeast1 (Tokyo, Japan)</option>*}
            </select>
        </div>

        <div class="col-sm-10 col-sm-offset-1">
            <img src="https://cloud.google.com/images/locations/regions.png" class="img-responsive">
        </div>
    </div>

    <div class="col-sm-3">
        <div class="well">
            <h4>Google Cloud Info</h4>

            Google Engine API <span class="label label-success">connected</span>

            <hr>

            <a href="https://cloud.google.com/compute/docs/machine-types/" target="_blank">Machine Types info</a></small>
            <a href="https://cloud.google.com/compute/docs/regions-zones/" target="_blank">Regions and Zones info</a>
        </div>
    </div>

    <div class="col-sm-12">
        <span style="color:red;">*</span> In trial account only 'micro' instance with 10 Gb disk is available.
    </div>
</div>
