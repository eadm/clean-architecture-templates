<?xml version="1.0"?>
<recipe>
    <#if isCreateCacheDataSource!false>
        <instantiate
                from="root/src/app_package/data/feature_package/source/CacheDataSource.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/data/${camelCaseToUnderscore(featureName)}/source/${cacheDataSourceName}.kt" />
    </#if>

    <#if isCreateRemoteDataSource!false>
        <instantiate
                from="root/src/app_package/data/feature_package/source/RemoteDataSource.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/data/${camelCaseToUnderscore(featureName)}/source/${remoteDataSourceName}.kt" />
    </#if>

    <#if isCreateRepository!false>
        <instantiate
                from="root/src/app_package/data/feature_package/repository/RepositoryImpl.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/data/${camelCaseToUnderscore(featureName)}/repository/${repositoryName}Impl.kt" />
    </#if>
</recipe>
