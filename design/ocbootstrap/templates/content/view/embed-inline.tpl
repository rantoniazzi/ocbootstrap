{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{def $class = cond( $object_parameters.align, concat( ' class="embed-inline-', $object_parameters.align, '"' ), '' )}
{if $object.main_node_id|null|not}
    <a href={$object.main_node.url_alias|ezurl}{$class}>{$object.name|wash}</a>
{else}
    {if $class}<span{$class}>{/if}{$object.name|wash}{if $class}</span>{/if}
{/if}
