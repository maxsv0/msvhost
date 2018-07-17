<h4>Hello, {$user.name}</h4>

<table class="table">
	<tr>
		<th>URL</th>
		<th>Zone</th>
		<th>Size</th>
		<th>Disk</th>
		<th>Status</th>
		<th>Actions</th>
	</tr>
{foreach from=$user_instance key=instance_id item=instance} 
<tr>
	<td>
{if $instance.status_pers == 100}
		<a href="{$instance.url}" target="_blank">{$instance.url}</a>
{else}
		{$instance.url}
{/if}
	</td>
	<td>{$instance.zone}</td>
	<td>{$instance.size}</td>
	<td>{$instance.disk} Gb</td>
	<td>
{if $instance.status_pers == 100}
	<span class="label label-success">active</span>

	<p>trial remain:
{if $trial_days > 1}
	{$trial_days} day
{else}
	{$trial_days} days
{/if}
	</p>

{elseif $instance.status == "create-fail" || $instance.status == "install-fail"}
	<span class="label label-danger">failed</span>
{else}
	<span class="label label-info">installing</span>
{/if}
	</td>
	<td>
        {if $instance.status_pers == 100}
			<a href="?instance_reset={$instance.id}" class="btn btn-warning">Reset</a>
		{else}
			<a href="?instance_reset={$instance.id}" class="btn btn-warning disabled">Reset</a>
        {/if}

		<a href="?instance_delete={$instance.id}" class="btn btn-danger ">Delete</a>
	</td>
</tr>
{if $instance.status_pers > 0 && $instance.status_pers != 100}
<tr>
	<td style="border-top:0;">
		<p>Installing..</p>
	</td>
	<td colspan="7" style="border-top:0;">

		<div class="progress">
			<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="{$instance.status_pers}" aria-valuemin="0" aria-valuemax="100" style="width: {$instance.status_pers}%">
				{$instance.status_pers}% Complete
			</div>
		</div>
	</td>
</tr>
{/if}
{/foreach}
</table>
