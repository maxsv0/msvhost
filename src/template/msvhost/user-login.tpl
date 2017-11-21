{include file="$themePath/widget/header.tpl"}


{if $document}
<div class="container">
	{$document.text}
</div>
{/if}


<div class="container">
<div class="col-md-6 col-md-offset-3 site-form">
	{include file="$themePath/user/login.tpl"}
</div>
</div>


{include file="$themePath/widget/footer.tpl"}