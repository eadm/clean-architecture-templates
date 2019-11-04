package ${packageName}.cache.${camelCaseToUnderscore(featureName)}
<#include "../../../../../../common/Common.kt.ftl">
<#if isCreateDao!false>
import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.dao.${daoName}
</#if>
<#if isCreateEntityMapper!false>
import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.mapper.${entityMapperName}
</#if>
import ${packageName}.data.${camelCaseToUnderscore(featureName)}.source.${dataSourceName}
import ${itemPackage}.${itemName}
import io.reactivex.Completable
import io.reactivex.Single
import javax.inject.Inject

class ${dataSourceName}Impl
@Inject
constructor(
<#if isCreateDao!false>
    private val ${daoName?uncap_first}: ${daoName},
</#if>
<#if isCreateEntityMapper!false>
    private val ${entityMapperName?uncap_first}: ${entityMapperName}
</#if>
) : ${dataSourceName} {
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation isOverride=true /> =
        <#if isCreateDao!false>
        ${daoName?uncap_first}
            .get${itemName}s(<#if isSingleItemOperation!false>id<#else>*ids</#if>)
        <#else>
        TODO()
        </#if>
        <#if isCreateEntityMapper == true>
            .map { it.map(${entityMapperName?uncap_first}::mapFromEntity) }
        </#if>

    <@setter itemName=itemName isSingleItem=isSingleItemOperation isOverride=true /> =
    <#if isCreateEntityMapper!false>
        Single
            .fromCallable { <#if isSingleItemOperation!false>${entityMapperName?uncap_first}.mapToEntity(item)<#else> items.map(${entityMapperName?uncap_first}::mapToEntity)</#if> }
    <#else>
        Single
            .just(<@items isSingleItem=isSingleItemOperation />)
    </#if>
    <#if isCreateDao!false>
            .flatMapCompletable(${daoName?uncap_first}::save${itemName}<#if !isSingleItemOperation!false>s</#if>)
    </#if>
}