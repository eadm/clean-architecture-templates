<#macro ids isSingleItem=false><#if isSingleItem!false>id<#else>ids</#if></#macro>
<#macro items isSingleItem=false><#if isSingleItem!false>item<#else>items</#if></#macro>

<#macro getter itemName idType isSingleItem=false  isOverride=false isSupportSourceType=false primarySourceType="">
    <#if isOverride!false>override</#if> fun get${itemName}<#if isSingleItem == true>(id<#else>s(vararg ids</#if>: ${idType}<#if isSupportSourceType!false>, primarySourceType: DataSourceType<#if primarySourceType?has_content> = primarySourceType</#if></#if>): Single<<#if isSingleItem == true>${itemName}<#else>List<${itemName}></#if>>
</#macro>

<#macro setter itemName isSingleItem=false isOverride=false>
    <#if isOverride!false>override</#if> fun save${itemName}<#if isSingleItem == true>(item: ${itemName}<#else>s(items: List<${itemName}></#if>): Completable
</#macro>