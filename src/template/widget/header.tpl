<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$page.title}</title>
	<meta name="keywords" content="{$page.keywords}">
	<meta name="description" content="{$page.description}">
    <link href="https://fonts.googleapis.com/css?family=Oxygen:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Pontano+Sans" rel="stylesheet">

    {$htmlHead}
  </head>
<body>

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
<li><a href="/user/">Homepage</a></li>
<li><a href="/user/">Websites</a></li>
<li><a href="/user/">Theme Catalog</a></li>
<li><a href="/user/">Modules Catalog</a></li>
<li><a class="btn" href="{$user_logout_url}" role="button">Logout</a></li>
</ul>
              	</li>
             {/if}
             </ul>
        </div>
        
    </div>    
</nav>    
    