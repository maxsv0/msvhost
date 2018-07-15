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

<div style="background-color: rgba(255,255,255,0.9);">
    <div class="container">
    
    <div class="row content-offset" >
        <div class="col-sm-6 col-sm-offset-3">
            <a href="/create/" type="button" class="btn btn-primary btn-lg btn-block">Create your own online business</a>
        </div>
    </div>
        
    </div>
</div>

{include file="$themePath/widget/footer.tpl"}
