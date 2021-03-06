{default attribute_base='ContentObjectAttribute' html_class='full' placeholder=false() }
{let attribute_content=$attribute.content}

{run-once}
{if is_set($ezie_ajax_response)|not()}
    {include uri='design:ezie/gui.tpl' attribute=$attribute}
{/if}
{/run-once}

<label>{'Current image'|i18n( 'design/standard/content/datatype' )}:</label>
{if $attribute_content.original.is_valid}

<table class="table" cellspacing="0">
<tr>
    <th class="tight">{'Preview'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Filename'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'MIME type'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Size'|i18n( 'design/standard/content/datatype' )}</th>
    <th></th>
</tr>
<tr>
    <td>{attribute_view_gui image_class=ezini( 'ImageSettings', 'DefaultEditAlias', 'content.ini' ) attribute=$attribute}</td>
    <td>{$attribute.content.original.original_filename|wash( xhtml )}</td>
    <td>{$attribute.content.original.mime_type|wash( xhtml )}</td>
    <td>{$attribute.content.original.filesize|si( byte )}</td>
    <td>
        {if $attribute_content.original.is_valid}

        {* Edit button *}
        <input type="button"
               class="button ezieEdit ezieEditButton"
               name="ezieEdit[{array( "ezie/prepare", $attribute.contentobject_id, $attribute.language_code, $attribute.id, $attribute.version )|implode( '/' )|ezurl( no )}]"
               id="ezieEdit_{$attribute.id}_{$attribute.version}_{$attribute.contentobject_id}"
               value="{'Edit'|i18n( 'design/standard/ezie' )}"
                {if $attribute_content.original.is_valid|not} disabled="disabled"{/if}
        />

        <button class="button btn" type="submit" name="CustomActionButton[{$attribute.id}_delete_image]" title="{'Remove image'|i18n( 'design/standard/content/datatype' )}"><span class="glyphicon glyphicon-trash"></span></button>
        {*else}
        <input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_delete_image]" value="{'Remove image'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />*}
        {/if}
    </td>
</tr>
</table>
{else}
<p>{'There is no image file.'|i18n( 'design/standard/content/datatype' )}</p>
{/if}



<input type="hidden" name="MAX_FILE_SIZE" value="{$attribute.contentclass_attribute.data_int1|mul( 1024, 1024 )}" />
<label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_file">{'New image file for upload'|i18n( 'design/standard/content/datatype' )}:</label>
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_file" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_data_imagename_{$attribute.id}" type="file" />

<input placeholder="{'Alternative image text'|i18n( 'design/standard/content/datatype' )}" id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_alttext" class="{$html_class} ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_data_imagealttext_{$attribute.id}" type="text" value="{$attribute_content.alternative_text|wash(xhtml)}" />



{/let}
{/default}
