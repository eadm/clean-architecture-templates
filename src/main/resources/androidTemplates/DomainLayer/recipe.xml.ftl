<?xml version="1.0"?>
<recipe>
    <#if isCreateInteractor!false>
        <instantiate
                from="root/src/app_package/domain/feature_package/interactor/Interactor.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/domain/${camelCaseToUnderscore(featureName)}/interactor/${interactorName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/domain/${camelCaseToUnderscore(featureName)}/interactor/${interactorName}.kt" />
    </#if>

    <#if isCreateRepository!false>
        <instantiate
                from="root/src/app_package/domain/feature_package/repository/Repository.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/domain/${camelCaseToUnderscore(featureName)}/repository/${repositoryName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/domain/${camelCaseToUnderscore(featureName)}/repository/${repositoryName}.kt" />
    </#if>

    <#if isCreateModel!false>
        <instantiate
                from="root/src/app_package/domain/feature_package/model/Model.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/domain/${camelCaseToUnderscore(featureName)}/model/${itemName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/domain/${camelCaseToUnderscore(featureName)}/model/${itemName}.kt" />
    </#if>

</recipe>
