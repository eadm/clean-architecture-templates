<?xml version="1.0"?>
<recipe>
    <#if isCreateInteractor!false>
        <instantiate
                from="root/src/app_package/domain/feature_package/source/Interactor.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/domain/${camelCaseToUnderscore(featureName)}/interactor/${interactorName}.kt" />
    </#if>

    <#if isCreateRepository!false>
        <instantiate
                from="root/src/app_package/domain/feature_package/repository/Repository.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/domain/${camelCaseToUnderscore(featureName)}/repository/${repositoryName}.kt" />
    </#if>
</recipe>
