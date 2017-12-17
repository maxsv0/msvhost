{assign var="items" value=$menu['top']}

<nav class="navbar navbar-default navbar-fixed-top" style="background-color: rgba(255,255,255,0.9);">
    <div class="container-fluid">
        
     <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand msv-land-logo" href="{$home.en}">MSVHost</a>
    </div>
        
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="msv-land-slogan">Time to be online</li>    
             </ul>    
            <ul class="nav navbar-nav">
                <li  style="position:absolute;margin-left: auto;margin-right: auto;left: 0;right: 0; top:17px;width:150px;"><a class="btn btn-default btn-default-msv"  href="/create/">Start Trial</a></li>    
             </ul>
             <ul class="nav navbar-nav navbar-right">
             {if !$user.id}
                <li style="margin: 17px;"><a class="btn btn-default btn-default-msv" href="/login/" role="button">Sign in</a></li>
             {else}
              	<li style="margin: 17px;"><a class="btn btn-default btn-default-msv" href="#" data-toggle="collapse" data-target="#submenu-user">{$user.email} <span class="caret"></span></a>
              	
<ul class="nav collapse" id="submenu-user">
{section name=index loop=$items}
{if !$items[index].sub}
{if $items[index].url == $page.url}
    <li class="active"><a href="{$lang_url}{$items[index].url}">{$items[index].name}</a></li>
{else}
    <li><a href="{$lang_url}{$items[index].url}">{$items[index].name}</a></li>
{/if}
{else}
<li class="dropdown">
    <a href="{$lang_url}{$items[index].url}" class="dropdown-toggle" data-toggle="dropdown">{$items[index].name}<span class="caret"></span></a> 
    <ul class="dropdown-menu" role="menu">
    {foreach from=$items[index].sub item=submenu}
        <li><a href="{$lang_url}{$submenu.url}">{$lang_url}{$submenu.name}</a></li>
    {/foreach}
    </ul>
</li>
{/if}
{/section} 
</ul>
              	</li>
             {/if}
             </ul>
        </div>
        
    </div>    
</nav>   