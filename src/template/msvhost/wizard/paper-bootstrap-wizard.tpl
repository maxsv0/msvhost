
<!--   Big container   -->
<div class="container">
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">

            <!--      Wizard container        -->
            <div class="wizard-container">

                <div class="card wizard-card" data-color="orange" id="wizardProfile">
                    <form action="/create/" method="POST">

                        <div class="wizard-header text-center">
                            <h3 class="wizard-title">Create your website</h3>
                            <p class="category">Create a website, blog or landing page right now.</p>
                        </div>

                    {if $website_created}

                        {include file="$themePath/wizard/success.tpl"}

                    {elseif $website_email == ''}

                        {include file="$themePath/wizard/login-required.tpl"}

                    {else}

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
                                <input type='submit' class='btn btn-finish btn-fill btn-warning btn-wd' name='finish' value='Finish and create website' />
                            </div>

                            <div class="pull-left">
                                <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='Previous' />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    {/if}
                    </form>
                </div>
            </div> <!-- wizard container -->
        </div>
    </div><!-- end row -->
</div> <!--  big container -->



