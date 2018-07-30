<div class="thumbnail-overlay-top">
    <span style="font-size:32px;">{$instance.domain}</span>

{if $instance.status == "active-trial"}
    <span class="label label-warning pull-right">trial active</span>
{elseif $instance.status == "active"}
    <span class="label label-success pull-right">active</span>
{elseif $instance.status == "disabled"}
    <span class="label label-default pull-right">disabled</span>
{else}
    <span class="label label-info pull-right">installing</span>
{/if}
</div>

<a class="thumbnail thumbnail-hover" href="{$instance.url}" title="{$instance.domain}" target="_blank">
    <img src="{$instance.preview}" alt="{$instance.domain}">

    <span class="thumbnail-overlay">
<span class="thumbnail-text">
Created: {$instance.date_create}<br>
Language: {$instance.language}<br>

{if $instance.status == "active-trial"}
Trial remain: {$instance.trial_days} days
{/if}

</span>
</span>
</a>
