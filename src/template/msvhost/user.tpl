{include file="$themePath/widget/header.tpl"}

<div class="container top-menu">
	<div class="row">
		{include file="$themePath/widget/menu-top.tpl"}
	</div>
</div>

{include file="$themePath/widget/navigation.tpl"}

<div class="container">
    <div class="row content-offset">

        <div class="col-md-12 content-block">
    	{$document.text}

        {include file="$themePath/widget/messages.tpl"}
        {if $user.id}
        	{include file="$themePath/user/homepage.tpl"}
        {else}
        	{include file="$themePath/user/login.tpl"}
        {/if} 
        </div>
	</div>
</div>


{include file="$themePath/widget/footer.tpl"}