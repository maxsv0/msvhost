{include file="$themePath/widget/header.tpl"}

<div class="container top-menu">
	<div class="row">
        {include file="$themePath/widget/menu-top.tpl"}
	</div>
</div>

{include file="$themePath/widget/navigation.tpl"}

{if $document}
<div class="container">
	{if $document.name}
	<h1>{$document.name}</h1>
	{/if}
	{$document.text}
</div>
{/if}


{include file="$themePath/widget/footer.tpl"}