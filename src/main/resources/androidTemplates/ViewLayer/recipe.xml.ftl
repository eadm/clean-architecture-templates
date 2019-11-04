<?xml version="1.0"?>
<recipe>
    <#if viewType == "activity">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/activity/Activity.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/activity/${activityName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/activity/${activityName}.kt" />
    <#elseif viewType == "activity">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/fragment/Fragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/fragment/${fragmentName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/fragment/${fragmentName}.kt" />
    <#elseif viewType == "activity">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/dialog/DialogFragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />
    <#elseif viewType == "activity">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/dialog/FullscreenDialogFragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />
    </#if>

<#--    <#if isCreateService!false>-->
<#--        <instantiate-->
<#--                from="root/src/app_package/remote/feature_package/dao/Service.kt.ftl"-->
<#--                to="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/service/${serviceName}.kt" />-->
<#--        <open file="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/service/${serviceName}.kt" />-->
<#--    </#if>-->

<#--    <#if isCreateResponse!false>-->
<#--        <instantiate-->
<#--                from="root/src/app_package/remote/feature_package/model/Response.kt.ftl"-->
<#--                to="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/model/${responseName}.kt" />-->
<#--        <open file="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/model/${responseName}.kt" />-->
<#--    </#if>-->

<#--    <#if isCreateResponseMapper!false>-->
<#--        <instantiate-->
<#--                from="root/src/app_package/remote/feature_package/mapper/ResponseMapper.kt.ftl"-->
<#--                to="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/mapper/${responseMapperName}.kt" />-->
<#--        <open file="${escapeXmlAttribute(srcOut)}/remote/${camelCaseToUnderscore(featureName)}/mapper/${responseMapperName}.kt" />-->
<#--    </#if>-->
</recipe>
