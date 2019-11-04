<?xml version="1.0"?>
<recipe>
    <#if isCreateComponent!false>
        <instantiate
                from="root/src/app_package/view/injection/feature_package/Component.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/injection/${camelCaseToUnderscore(featureName)}/${componentName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/injection/${camelCaseToUnderscore(featureName)}/${componentName}.kt" />
    </#if>

    <#if isCreateModule!false>
        <instantiate
                from="root/src/app_package/view/injection/feature_package/Module.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/injection/${camelCaseToUnderscore(featureName)}/${moduleName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/injection/${camelCaseToUnderscore(featureName)}/${moduleName}.kt" />
    </#if>

    <#if isCreateDataModule!false>
        <instantiate
                from="root/src/app_package/view/injection/feature_package/DataModule.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/injection/${camelCaseToUnderscore(featureName)}/${dataModuleName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/injection/${camelCaseToUnderscore(featureName)}/${dataModuleName}.kt" />
    </#if>

</recipe>
