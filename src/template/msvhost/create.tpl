
<!--   Big container   -->
<div class="container">
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">

            <!--      Wizard container        -->
            <div class="wizard-container">

                <div class="card wizard-card" data-color="orange" id="wizardProfile">
                    <form action="" method="">

                        <div class="wizard-header text-center">
                            <h3 class="wizard-title">Create your website</h3>
                            <p class="category">Create a website, blog or landing page right now.</p>
                        </div>

                        <div class="wizard-navigation">
                            <div class="progress-with-circle">
                                <div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="3" style="width: 21%;"></div>
                            </div>
                            <ul>
                                <li>
                                    <a href="#general" data-toggle="tab">
                                        <div class="icon-circle">
                                            <i class="glyphicon glyphicon-home"></i>
                                        </div>
                                        General
                                    </a>
                                </li>
                                <li>
                                    <a href="#type" data-toggle="tab">
                                        <div class="icon-circle">
                                            <i class="glyphicon glyphicon-list-alt"></i>
                                        </div>
                                        Type of website
                                    </a>
                                </li>
                                <li>
                                    <a href="#architecture" data-toggle="tab">
                                        <div class="icon-circle">
                                            <i class="glyphicon glyphicon-cog"></i>
                                        </div>
                                        Architecture
                                    </a>
                                </li>
                                <li>
                                    <a href="#deployment" data-toggle="tab">
                                        <div class="icon-circle">
                                            <i class="glyphicon glyphicon-globe"></i>
                                        </div>
                                        Deployment
                                    </a>
                                </li>
                                <li>
                                    <a href="#confirm" data-toggle="tab">
                                        <div class="icon-circle">
                                            <i class="glyphicon glyphicon-info-sign"></i>
                                        </div>
                                        Confirmation
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane" id="general">


                                {include file="$themePath/wizard/general.tpl"}


                            </div>
                            <div class="tab-pane" id="type">


                                {include file="$themePath/wizard/website_type.tpl"}


                            </div>
                            <div class="tab-pane" id="architecture">


                                {include file="$themePath/wizard/architecture.tpl"}


                            </div>
                            <div class="tab-pane" id="deployment">


                                {include file="$themePath/wizard/deployment.tpl"}


                            </div>
                            <div class="tab-pane" id="confirm">


                                {include file="$themePath/wizard/confirm.tpl"}


                            </div>
                        </div>
                        <br>
                        <div class="wizard-footer">
                            <div class="pull-right">
                                <input type='button' class='btn btn-next btn-fill btn-warning btn-wd' name='next' value='Next' />
                                <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd' name='finish' value='Finish' />
                            </div>

                            <div class="pull-left">
                                <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='Previous' />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
            </div> <!-- wizard container -->
        </div>
    </div><!-- end row -->
</div> <!--  big container -->





{*

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
*}

