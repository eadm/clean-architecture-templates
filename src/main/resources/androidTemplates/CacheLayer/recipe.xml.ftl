<?xml version="1.0"?>
<recipe>

    <#if isCreateDataSource!false>
        <instantiate
                from="root/src/app_package/cache/feature_package/CacheDataSourceImpl.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/${dataSourceName}Impl.kt" />
    </#if>

    <#if isCreateDao!false>
        <instantiate
                from="root/src/app_package/cache/feature_package/dao/Dao.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/dao/${daoName}.kt" />
    </#if>

    <#if isCreateEntity!false>
        <instantiate
                from="root/src/app_package/cache/feature_package/model/Entity.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/model/${entityName}.kt" />
    </#if>

    <#if isCreateEntityMapper!false>
        <instantiate
                from="root/src/app_package/cache/feature_package/mapper/EntityMapper.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/cache/${camelCaseToUnderscore(featureName)}/mapper/${entityMapperName}.kt" />
    </#if>

<#--    <instantiate from="root/src/app_package/di/DaggerModule.kt.ftl"-->
<#--                to="${escapeXmlAttribute(srcOut)}/di/${name}Module.kt" />-->

<#--    <instantiate from="root/src/app_package/model/Model.kt.ftl"-->
<#--                to="${escapeXmlAttribute(srcOut)}/model/${name}.kt" />-->

<#--    <instantiate from="root/src/app_package/FeatureContract.kt.ftl"-->
<#--                to="${escapeXmlAttribute(srcOut)}/${name}Contract.kt" />-->

<#--    <instantiate from="root/src/app_package/FeatureFragment.kt.ftl"-->
<#--                to="${escapeXmlAttribute(srcOut)}/${name}Fragment.kt" />-->

<#--    <instantiate from="root/src/app_package/FeaturePresenter.kt.ftl"-->
<#--                to="${escapeXmlAttribute(srcOut)}/${name}Presenter.kt" />-->

<#--    <instantiate from="root/res/layout/fragment_layout.xml.ftl"-->
<#--                   to="${escapeXmlAttribute(resOut)}/layout/${fragment_layout}.xml" />-->

<#--    <merge from="root/build.gradle.ftl"-->
<#--             to="${escapeXmlAttribute(projectOut)}/build.gradle" />-->
</recipe>
