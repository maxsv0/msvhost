<h4>Hello, {$user.name}</h4>

<table class="table">
	<tr>
		<th class="col-sm-5">Preview</th>
		<th class="col-sm-3">Instance</th>
		<th class="col-sm-1">Status</th>
		<th class="col-sm-1">Public</th>
		<th class="col-sm-1">Actions</th>
	</tr>
{foreach from=$user_instance key=instance_id item=instance} 
<tr>
	<td>
        {if $instance.preview}
			<p style="height:200px;overflow: hidden;">
				<img src="{$instance.preview}" class="img-thumbnail">
			</p>
        {/if}
	</td>
	<td>
		<p>
{if $instance.status_pers == 100}
		<a href="{$instance.url}" target="_blank">{$instance.url}</a>
{else}
		{$instance.url}
{/if}
		</p>
		<p><span class="text-muted">Zone:</span> {$instance.zone}</p>
		<p><span class="text-muted">Size:</span> {$instance.size}</p>
		<p><span class="text-muted">Disk:</span> {$instance.disk}</p>
	</td>



	<td>
{if $instance.status == "active-trial"}
	<span class="label label-warning">trial active</span>
	<p>trial days remain: {$instance.trial_days}</p>
{elseif $instance.status == "active"}
	<span class="label label-success">active</span>
{elseif $instance.status == "create-fail" || $instance.status == "install-fail" || $instance.status == "disabled"}
	<span class="label label-danger">{$instance.status}</span>
{else}
	<span class="label label-info">installing</span>
{/if}


	</td>
	<td>
{if $instance.public}
		<span class="text-success bool-switch" data-id="{$instance.id}" data-section="msvhost" data-table="instance" data-field="public" data-value="1">{$t["yes"]}</span>
{else}
		<span class="text-danger bool-switch" data-id="{$instance.id}" data-section="msvhost" data-table="instance" data-field="public" data-value="0">{$t["no"]}</span>
{/if}
	</td>
	<td>
        {if $instance.status_pers == 100}
			<a href="?instance_stop={$instance.id}" class="btn btn-warning">Stop</a>
		{else}
			<a href="?instance_stop={$instance.id}" class="btn btn-warning disabled">Stop</a>
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


<div class="col-sm-6 col-sm-offset-3 content-offset">
	<a href="/create/" type="button" class="btn btn-primary btn-lg btn-block">Create website now</a>
</div>
