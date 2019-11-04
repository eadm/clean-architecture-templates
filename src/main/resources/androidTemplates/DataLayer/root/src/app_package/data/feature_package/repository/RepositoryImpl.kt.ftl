package ${packageName}.data.${camelCaseToUnderscore(featureName)}.repository
<#include "../../../../../../../common/Common.kt.ftl">
import ${itemPackage}.${itemName}
<#if isCreateCacheDataSource!false>
import ${packageName}.data.${camelCaseToUnderscore(featureName)}.source.${cacheDataSourceName}
</#if>
<#if isCreateRemoteDataSource!false>
import ${packageName}.data.${camelCaseToUnderscore(featureName)}.source.${remoteDataSourceName}
</#if>
import ${packageName}.domain.${camelCaseToUnderscore(featureName)}.repository.${repositoryName}
<#if isExposeSaveOperation!false>
import io.reactivex.Completable
</#if>
import io.reactivex.Single
import javax.inject.Inject

class ${repositoryName}Impl
@Inject
constructor(
<#if isCreateCacheDataSource!false>
    private val ${cacheDataSourceName?uncap_first}: ${cacheDataSourceName},
</#if>
<#if isCreateRemoteDataSource!false>
    private val ${remoteDataSourceName?uncap_first}: ${remoteDataSourceName}
</#if>
) : ${repositoryName} {
    <@getter itemName=itemName idType=idType isOverride=true isSupportSourceType=true isSingleItem=isSingleItemOperation /> {
        <#if isCreateRemoteDataSource!false>
        val remoteSource = ${remoteDataSourceName?uncap_first}
            .get${itemName}s(*ids)
            <#if isCreateRemoteDataSource!false>
            .doCompletableOnSuccess(${cacheDataSourceName?uncap_first}::save${itemName}s)
            </#if>
        </#if>

        <#if isCreateRemoteDataSource!false>
        val cacheSource = ${cacheDataSourceName?uncap_first}
            .get${itemName}s(*ids)
        </#if>

        return when (primarySourceType) {
            <#if isCreateRemoteDataSource!false>
            DataSourceType.REMOTE ->
                remoteSource
                <#if isCreateRemoteDataSource!false>
                    .onErrorResumeNext(cacheSource.requireSize(ids.size))
                </#if>
            </#if>

            <#if isCreateRemoteDataSource!false>
            DataSourceType.CACHE ->
                cacheSource
                    <#if isCreateRemoteDataSource!false>
                    .flatMap { cached${itemName}s ->
                        val notCachedIds = (ids.toList() - cached${itemName}s.map(${itemName}::id))
                        <#if idType == 'Long'>
                            .toLongArray()
                        <#else>
                            .toTypedArray()
                        </#if>
                        ${remoteDataSourceName?uncap_first}
                            .get${itemName}s(*notCachedIds)
                            .doCompletableOnSuccess(${cacheDataSourceName?uncap_first}::save${itemName}s)
                            .map { remote${itemName}s -> cached${itemName}s + remote${itemName}s }
                    }
                    </#if>
            </#if>

            else ->
                throw IllegalArgumentException("Unsupported source type = $primarySourceType")
        }.map { ${itemName?uncap_first}s -> ${itemName?uncap_first}s.sortedBy { ids.indexOf(it.id) } }
    }

<#if (isCreateCacheDataSource!false) && (isExposeSaveOperation!false)>
    <@setter itemName=itemName isOverride=true isSingleItem=isSingleItemOperation /> =
        ${cacheDataSourceName?uncap_first}
            .save${itemName}s(items)
</#if>
}