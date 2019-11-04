<?xml version="1.0"?>
<recipe>
    <#if isCreateDataSource!false>
        <instantiate
                from="root/src/app_package/cache/feature_package/CacheDataSourceImpl.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/${dataSourceName}Impl.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/${dataSourceName}Impl.kt" />
    </#if>

    <#if isCreateDao!false>
        <instantiate
                from="root/src/app_package/cache/feature_package/dao/Dao.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/dao/${daoName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/dao/${daoName}.kt" />
    </#if>

    <#if isCreateEntity!false>
        <instantiate
                from="root/src/app_package/cache/feature_package/model/Entity.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/model/${entityName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/model/${entityName}.kt" />
    </#if>

    <#if isCreateEntityMapper!false>
        <instantiate
                from="root/src/app_package/cache/feature_package/mapper/EntityMapper.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/mapper/${entityMapperName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/mapper/${entityMapperName}.kt" />
    </#if>
</recipe>
