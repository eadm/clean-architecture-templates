package ${packageName}.view.injection.${camelCaseToUnderscore(featureName)}

import dagger.Binds
import dagger.Module
import dagger.Provides
import ${packageName}.domain.${camelCaseToUnderscore(featureName)}.repository.${repositoryName}
import ${packageName}.data.${camelCaseToUnderscore(featureName)}.repository.${repositoryName}Impl
<#if hasCacheDataSource!false>
import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.${cacheDataSourceName}Impl
import ${packageName}.data.${camelCaseToUnderscore(featureName)}.source.${cacheDataSourceName}
</#if>
<#if hasDao!false>
import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.dao.${daoName}
</#if>
<#if hasRemoteDataSource!false>
import ${packageName}.remote.${camelCaseToUnderscore(featureName)}.${remoteDataSourceName}Impl
import ${packageName}.data.${camelCaseToUnderscore(featureName)}.source.${remoteDataSourceName}
</#if>
<#if hasService!false>
import ${packageName}.remote.${camelCaseToUnderscore(featureName)}.service.${serviceName}
</#if>

@Module
abstract class ${dataModuleName} {
    @Binds
    internal abstract fun bind${repositoryName}(
        ${repositoryName?uncap_first}Impl: ${repositoryName}Impl
    ): ${repositoryName}

<#if hasCacheDataSource!false>
    @Binds
    internal abstract fun bind${cacheDataSourceName}(
        ${cacheDataSourceName?uncap_first}Impl: ${cacheDataSourceName}Impl
    ): ${cacheDataSourceName}
</#if>

<#if hasRemoteDataSource!false>
    @Binds
    internal abstract fun bind${remoteDataSourceName}(
        ${remoteDataSourceName?uncap_first}Impl: ${remoteDataSourceName}Impl
    ): ${remoteDataSourceName}
</#if>

<#if (hasDao!false) || (hasService!false)>
    @Module
    companion object {
        <#if hasDao!false>
        @Provides
        @JvmStatic
        fun provide${daoName}(): ${daoName} = TODO()
        </#if>

        <#if hasService!false>
        @Provides
        @JvmStatic
        fun provide${serviceName}(): ${serviceName} = TODO()
        </#if>
    }
</#if>
}