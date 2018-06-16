<div class="row">
    <div class="col-sm-12">
        <h4 class="info-text"> Deployment options </h4>
    </div>

    <div class="col-sm-6 col-sm-offset-3 well">

        <div class="row form-group">
            <label class="col-sm-5" for="input_production_endpoint">Website endpoint URL</label>
            <div class="col-sm-7">
                <input class="form-control" id="input_production_endpoint" name="production_endpoint" readonly value="">
            </div>
        </div>

        <div class="row form-group">
            <label class="col-sm-5" for="input_website_domain">Assign custom domain</label>
            <div class="col-sm-7">
                <input class="form-control" id="input_website_domain" name="website_domain" placeholder="www.sitograph.com">
            </div>
        </div>

    </div>

    <div class="col-sm-10 col-sm-offset-1">

        <div class="form-group">
            <label for="inputserver">Server size</label>
            <select class="form-control" id="inputserver" name="website_size">
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
            <label for="inputserverzone">Website instance location</label>
            <select class="form-control" id="inputserverzone" name="website_zone">
                <option value="us-central1" selected>us-central1 (Council Buffs, IA)</option>
                <option value="us-east1">us-east1 (Moncks Corner, SC)</option>
                <option value="us-east4">us-east4 (Ashburn, VA)</option>
                <option value="us-west1">us-west1 (The Dalles, OR)</option>
                <option value="europe-north1">europe-north1 (Hamina, Finland)</option>
                <option value="europe-west1">europe-west1 (St. Ghislain, Belgium)</option>
                <option value="europe-west2">europe-west2 (London, UK)</option>
                <option value="europe-west3">europe-west3 (Frankfurt, Germany)</option>
                <option value="europe-west4">europe-west4 (Eemshaven, Netherlands)</option>
                <option value="northamerica-northeast1">northamerica-northeast1 (Montréal, Quebec, Canada)</option>
                <option value="southamerica-east1">southamerica-east1 (São Paulo, Brazil)</option>
                <option value="australia-southeast1">australia-southeast1 (Sydney, Australia)</option>
                <option value="asia-south1">asia-south1 (Mumbai, India)</option>
                <option value="asia-southeast1">asia-southeast1 (Jurong West, Singapore)</option>
                <option value="asia-east1">asia-east1 (Changhua County, Taiwan)</option>
                <option value="asia-northeast1">asia-northeast1 (Tokyo, Japan)</option>
            </select>
        </div>

    </div>


    <div class="col-sm-10 col-sm-offset-1">

        <img src="https://cloud.google.com/images/locations/regions.png" class="img-responsive">

    </div>
</div>







