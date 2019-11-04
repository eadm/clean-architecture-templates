package ${packageName}.cache.${camelCaseToUnderscore(featureName)}.dao
<#include "../../../../../../../common/Common.kt.ftl">
<#if isCreateEntity!false>
import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.model.${entityName}
<#else>
import ${itemPackage}.${itemName}
</#if>
import io.reactivex.Completable
import io.reactivex.Single

interface ${daoName} {
<#if isCreateEntity!false>
    fun get${itemName}s(vararg ids: ${idType}): Single<List<${entityName}>>

    fun save${itemName}s(items: List<${entityName}>): Completable
<#else>
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation />

    <@setter itemName=itemName isSingleItem=isSingleItemOperation />
</#if>
}