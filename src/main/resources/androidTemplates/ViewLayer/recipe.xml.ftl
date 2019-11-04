<?xml version="1.0"?>
<recipe>
    <#if isCreateDataSource!false>
        <instantiate
                from="root/src/app_package/remote/feature_package/RemoteDataSourceImpl.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/${dataSourceName}Impl.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/${dataSourceName}Impl.kt" />
    </#if>

    <#if isCreateService!false>
        <instantiate
                from="root/src/app_package/remote/feature_package/dao/Service.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/service/${serviceName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/service/${serviceName}.kt" />
    </#if>

    <#if isCreateResponse!false>
        <instantiate
                from="root/src/app_package/remote/feature_package/model/Response.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/model/${responseName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/model/${responseName}.kt" />
    </#if>

    <#if isCreateResponseMapper!false>
        <instantiate
                from="root/src/app_package/remote/feature_package/mapper/ResponseMapper.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/mapper/${responseMapperName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/mapper/${responseMapperName}.kt" />
    </#if>
</recipe>
