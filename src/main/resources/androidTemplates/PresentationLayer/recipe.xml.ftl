<?xml version="1.0"?>
<recipe>
    <instantiate
            from="root/src/app_package/presentation/feature_package/Presenter.kt.ftl"
            to="${escapeXmlAttribute(srcOut)}/presentation/${camelCaseToUnderscore(featureName)}/${presenterName}.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/presentation/${camelCaseToUnderscore(featureName)}/${presenterName}Impl.kt" />

    <instantiate
            from="root/src/app_package/presentation/feature_package/View.kt.ftl"
            to="${escapeXmlAttribute(srcOut)}/presentation/${camelCaseToUnderscore(featureName)}/${viewName}.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/presentation/${camelCaseToUnderscore(featureName)}/${viewName}.kt" />

    <#if isCreateListItem!false>
        <instantiate
                from="root/src/app_package/presentation/feature_package/model/Item.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/presentation/${camelCaseToUnderscore(featureName)}/model/${listItemName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/presentation/${camelCaseToUnderscore(featureName)}/model/${listItemName}.kt" />
    </#if>

    <#if isCreateStateMapper!false>
        <instantiate
                from="root/src/app_package/presentation/feature_package/mapper/StateMapper.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/presentation/${camelCaseToUnderscore(featureName)}/mapper/${stateMapperName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/presentation/${camelCaseToUnderscore(featureName)}/mapper/${stateMapperName}.kt" />
    </#if>
</recipe>
