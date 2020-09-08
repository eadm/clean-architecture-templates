package ${packageName}.remote.${camelCaseToUnderscore(featureName)}
<#include "../../../../../../common/Common.kt.ftl">
<#if isCreateService!false>
import ${packageName}.remote.${camelCaseToUnderscore(featureName)}.service.${serviceName}
</#if>
<#if isCreateResponseMapper!false>
import ${packageName}.remote.${camelCaseToUnderscore(featureName)}.mapper.${responseMapperName}
</#if>
import ${packageName}.data.${camelCaseToUnderscore(featureName)}.source.${dataSourceName}
import ${itemPackage}.${itemName}
import io.reactivex.Completable
import io.reactivex.Single
import javax.inject.Inject

class ${dataSourceName}Impl
@Inject
constructor(
<#if isCreateService!false>
    private val ${serviceName?uncap_first}: ${serviceName},
</#if>
<#if isCreateResponseMapper!false>
    private val ${responseMapperName?uncap_first}: ${responseMapperName}
</#if>
) : ${dataSourceName} {
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation isOverride=true /> =
        <#if isCreateService!false>
        ${serviceName?uncap_first}
            .get${itemName}s(<#if isSingleItemOperation!false>id<#else>*ids</#if>)
        <#else>
        TODO()
        </#if>
        <#if isCreateResponseMapper == true>
            .map { it.map(${responseMapperName?uncap_first}::mapFromResponse) }
        </#if>
}