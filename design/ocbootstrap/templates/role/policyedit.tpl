<div class='page-header'>      
    <h1>{"Edit policy"|i18n("design/standard/role")}</h1>
</div>
<div class='row'>
    <div class="col-sm-12">
        
        <form action={concat($Module.functions.policyedit.uri,"/",$policy_id,"/")|ezurl} method="post" >
        
        <div class="objectheader">
            <h2>{'Policy'|i18n('design/standard/role')}</h2>
        </div>
        
        <div class="object">
            <div class="block">
                <label>{"Module"|i18n("design/standard/role")}</label><div class="labelbreak"/>
                <p class="box">{$current_module}</p>
            </div>
            <div class="block">
                <label>{"Function"|i18n("design/standard/role")}</label><div class="labelbreak"/>
                <p class="box">{$current_function}</p>
            </div>
        </div>
           
        <br/>
        
        <div class="objectheader">
            <h2>{'Limitations'|i18n('design/standard/role')}</h2>
        </div>
        
        <div class="object">
        
            {section name=Limitations loop=$function_limitations}
            {section-exclude match=$Limitations:item.name|eq('Subtree')}
            {section-exclude match=$Limitations:item.name|eq('Node')}
            <div class="element">
                <h3>{$Limitations:item.name|wash}</h3>
                <select class="form-control" name="{$Limitations:item.name}[]" size="8" multiple >
                    <option value="-1" {switch match=$current_limitation_list[$Limitations:item.name]}
                                       {case match=-1} selected="selected"{/case}
                                       {case/}
                                       {/switch}>{"Any"|i18n("design/standard/role")}</option>
                    {section name=LimitationValues loop=$Limitations:item.values}
                        <option value="{$Limitations:LimitationValues:item.value}" {switch match=$Limitations:LimitationValues:item.value}
                                                                                   {case in=$current_limitation_list[$Limitations:item.name]}selected="selected"{/case}
                                                                                   {case/}
                                                                                   {/switch}>
                        {$Limitations:LimitationValues:item.Name}</option>
                    {/section}   
                </select>
            </div>
            {/section}
        
            {section name=Limitations loop=$function_limitations}
            {switch match=$Limitations:item.name} 
              {case match="Node"}
               <div class="element">
                <h3>{'Node'|i18n('design/standard/role')}</h3>
                <table>
                    {section name=NodeList loop=$node_list}
                        <tr>                            
                            <td><input type="checkbox" name="DeleteNodeIDArray[]" value={$Limitations:NodeList:item.node_id} /> {$Limitations:NodeList:item.name} </td>
                        </tr>
                    {section-else}
                        <tr>
                            <td>{'Not specified.'|i18n('design/standard/role')}</td>
                        </tr>
                    {/section}
                </table>
                
                <input class="button" type="submit" name="BrowseLimitationNodeButton" value="{'Find'|i18n('design/standard/role')}" />
                <input class="button" type="submit" name="DeleteNodeButton" value="{'Remove'|i18n('design/standard/role')}" />
               </div>
              {/case}
              
              {case match="Subtree"}
               <div class="element">
                <h3>{'Subtree'|i18n('design/standard/role')}</h3>
                <table>                 
                 {section name=SubtreeList loop=$subtree_list}
                    <tr>
                        <td>
                            <input type="checkbox" name="DeleteSubtreeIDArray[]" value={$Limitations:SubtreeList:item.node_id} /> {$Limitations:SubtreeList:item.name}
                        </td>
                    </tr>
                 {section-else}
                    <tr>
                        <td>{'Not specified.'|i18n('design/standard/role')}</td>
                    </tr>
                 {/section}
                 </table>                 
                <input class="button" type="submit" name="BrowseLimitationSubtreeButton" value="{'Find'|i18n('design/standard/role')}" />
                <input class="button" type="submit" name="DeleteSubtreeButton" value="{'Remove'|i18n('design/standard/role')}" />
               
               </div>
              {/case}
              {case}
              {/case}
            {/switch}
            {/section}
        
        </div>
        
        <hr />
        
        <div class="buttonblock">
            <input class="defaultbutton" type="submit" name="UpdatePolicy" value="{'Update'|i18n('design/standard/role')}" />
            <input type="hidden" name="CurrentModule" value="{$current_module}" />
            <input type="hidden" name="CurrentFunction" value="{$current_function}" />
            <input class="button" type="submit" name="DiscardChange" value="{'Cancel'|i18n('design/standard/role')}" />
        </div>
        </form>
    </div>
</div>
        