package ${packageName}.cache.${camelCaseToUnderscore(featureName)}.dao

<#if isCreateEntity!false>
import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.model.${entityName}
</#if>
import io.reactivex.Completable
import io.reactivex.Single
import javax.inject.Inject

interface ${daoName} {
<#if isCreateEntity!false>
    fun get${itemName}s(vararg ids: ${idType}): Single<List<${entityName}>>

    fun save${itemName}s(items: List<${entityName}>): Completable
<#else>
    fun get${itemName}s(vararg ids: ${idType}): Single<List<${itemName}>>

    fun save${itemName}s(items: List<${itemName}>): Completable
</#if>
}