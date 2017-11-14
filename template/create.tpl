{include file="$themePath/widget/header.tpl"}



<div class="container">
    
    
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2 create-form">
            
        
        
{include file="$themePath/widget/messages.tpl"}
    
    

            <h3 style="color:#40323d;">Create a website, blog or landing page right now.</h3>
            
        <form method="POST">
          <div class="form-group">
            <label for="inputdomain">Choose a custom domain, or a free .msvhost.com address</label>
            <input type="text" class="form-control" id="inputdomain"  name="website_domain" placeholder="mytest.msvhost.com">
          </div>
            
          
              
        <div class="form-group">
        <label for="inputemail">Administrator Email</label>
        <input type="email" class="form-control" id="inputemail" name="website_admin" placeholder="Your Email" value="{$user.email}">
        </div>
          
          
	<div class="form-group hide"> 
            <label for="">Choose your website languages</label>
               
            <div>
            <label class="checkbox-inline checkbox-msvhost-create">
              <input type="checkbox" name="website_lang[]" value="en" checked><img class="lang-flag" src="/content/images/en.svg"> English
            </label>
            <label class="checkbox-inline checkbox-msvhost-create">
              <input type="checkbox" name="website_lang[]" value="ru"><img class="lang-flag" src="/content/images/ru.svg"> Русский
            </label>
            <label class="checkbox-inline checkbox-msvhost-create">
              <input type="checkbox" name="website_lang[]" value="ua"><img class="lang-flag" src="/content/images/ua.svg"> Українська
            </label>
                
            </div>  
               
	</div>   
            
            
            <div class="create-layout-label hide">
            <label for="">Select website layout</label>
            <small>Additional templates and modules can be installed later.</small>
            </div>    
            
   <div class="row hide">
            
            <div class="col-sm-4 create-layout-img">
            	<h4>Simple</h4>
                <input checked="checked" id="layout1" type="radio" name="website_layout" value="simple">
                <label class="radio-layout" for="layout1" style="background-image:url(/content/images/layout-1.jpg)" data-toggle="tooltip" data-placement="right" title="Modules:blog,slider"></label>
            </div>

           <div class="col-sm-4 create-layout-img">
            	<h4>Landing page</h4>
                <input id="layout3" type="radio" name="website_layout" value="landing">
                <label class="radio-layout" for="layout3" style="background-image:url(/content/images/layout-3.jpg)"></label>
            </div>
            
            <div class="col-sm-4 create-layout-img">
            	<h4>Sticked Menu</h4>
                <input id="layout2" type="radio" name="website_layout" value="sticked">
                <label class="radio-layout" for="layout2" style="background-image:url(/content/images/layout-2.jpg)"></label>
            </div>
            
            <div class="col-sm-4 create-layout-img">
            	<h4>Blog</h4>
                <input id="layout4" type="radio" name="website_layout" value="blog">
                <label class="radio-layout" for="layout4" style="background-image:url(/content/images/layout-4.jpg)"></label>
            </div>
            
            <div class="col-sm-4 create-layout-img">
            	<h4>Cover Image</h4>
                <input id="layout5" type="radio" name="website_layout" value="cover">
                <label class="radio-layout" for="layout5" style="background-image:url(/content/images/layout-5.jpg)"></label>
            </div>
            
            <div class="col-sm-4 create-layout-img">
            	<h4>Jumbotron</h4>
                <input id="layout6" type="radio" name="website_layout" value="jumbotron">
                <label class="radio-layout" for="layout6" style="background-image:url(/content/images/layout-6.jpg)"></label>
            </div>
            
       </div>    
            
            
        
            
        <div class="form-group">
        <label for="inputserver">Server size <small><a href="https://cloud.google.com/compute/docs/machine-types" target="_blank">more info</a></small></label>
        <select class="form-control" id="inputserver" name="website_server">
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
        <label for="inputserverzone">Server Zone <small><a href="https://cloud.google.com/compute/docs/regions-zones/regions-zones" target="_blank">more info</a></small></label>
        <select class="form-control" id="inputserverzone" name="website_zone">
        	<option value="europe" selected>Western Europe</option>
        	<option value="us-west">Western US</option>
        	<option value="us-central">Central US</option>
        	<option value="us-east">Eastern US</option>
        	<option value="asia-east">Eastern Asia-Pacific</option>
        	<option value="asia-northeast">Northeastern Asia-Pacific</option>
        </select>
        </div>
            
	<div class="form-group hide"> 
            <label for="">Plan</label>
              
            <div class="row">
            <div class="col-sm-6">
            <label class="checkbox checkbox-msvhost-create">
              <input type="radio" name="plan" value="trial" checked> 5 Day Free Trial
            </label>
            <label class="checkbox checkbox-msvhost-create">
              <input type="radio" name="plan" value="basic" disabled> MSVHost Basic <small>$5 per month</small>
            </label>
                
            </div> 
            
            <div class="col-sm-6"> 
            	<ul>
            		<li>Unlimited Servers.</li>
            		<li>Unlimited Sites.</li>
            		<li>Unlimited Deployments.</li>
            		<li>Push To Deploy.</li>
            	</ul>
            </div>
            
            </div> 
               
	</div> 
            
	
          <button type="submit" class="btn btn-primary btn-msvhost-form" name="doCreate" value="1">Create your website</button>
          
        </form>
        </div>
    </div>
</div>    

{include file="$themePath/widget/footer.tpl"}