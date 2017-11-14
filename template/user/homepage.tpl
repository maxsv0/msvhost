<h1>homepage</h1>

{$user.name}


<table class="table">
{foreach from=$user_server key=server_id item=server} 
<tr>
	<td><a href="{$server.url}" target="_blank">{$server.url}</a></td>
	<td>
	<p>	{$server.ip}</p>
	<p class="text-muted">{$server.server_zone}</p>
	</td>
	<td>{$server.server_size}</td>
	<td>
		progress: {$server.status_pers}% <br>
		status: {$server.status}
	</td>
	<td>{$server.status_date}</td>
	<td>
		<a href="?instance_delete={$server.id}" class="btn btn-danger">Delete</a>
		<a href="?instance_reset={$server.id}" class="btn btn-warning">Reset</a>
	</td>
</tr>
{/foreach}
</table>
