{include file="$themePath/widget/header.tpl"}

<div class="container top-menu">
	<div class="row">
        {include file="$themePath/widget/menu-top.tpl"}
	</div>
</div>

{include file="$themePath/widget/navigation.tpl"}

{if $document}
<div class="row content-offset">
	<div class="col-sm-10 col-sm-offset-1 content-block">
	{if $document.name}
	<h1>{$document.name}</h1>
	{/if}
	{$document.text}
	</div>
</div>
{/if}


{include file="$themePath/widget/footer.tpl"}