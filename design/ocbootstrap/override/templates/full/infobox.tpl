{* Infobox - Full view *}
<div class="content-view-full class-{$node.class_identifier} row">
  
  {include uri='design:nav/nav-section.tpl'}
    
  <div class="content-main">
    
    <h1>{$node.name|wash()}</h1>
    
    {if $node|has_attribute( 'intro' )}
      <div class="abstract">
        {attribute_view_gui attribute=$node|attribute( 'intro' )}
      </div>
    {/if}
    
    {include uri='design:atoms/image.tpl' item=$node image_class=appini( 'ContentViewFull', 'DefaultImageClass', 'wide' ) caption=$node|attribute( 'caption' )}
	
    {if $node|has_attribute( 'content' )}
      <div class="description">
        {attribute_view_gui attribute=$node|attribute( 'content' )}
      </div>
    {/if}	  
	
    {if $node|has_attribute( 'tags' )}
      <div class="tags">
        {attribute_view_gui attribute=$node|attribute( 'tags' )}
      </div>
    {/if}
    
    {if $node|has_attribute( 'url' )}
      <div class="rating">
        {attribute_view_gui attribute=$node|attribute( 'url' )}
      </div>
    {/if}
    
  </div>
  
  {* Per visualizzare l'extrainfo: aggiungi la classe "full-stack" al primo div e scommenta la seguenta inclusione *}
  {*include uri='design:parts/content-related.tpl'*}

</div>