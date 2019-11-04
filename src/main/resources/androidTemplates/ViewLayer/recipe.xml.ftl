<?xml version="1.0"?>
<recipe>
    <#if viewType == "activity">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/activity/Activity.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/activity/${activityName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/activity/${activityName}.kt" />

        <instantiate
                from="root/res/layout/layout.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
        <open file="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
    <#elseif viewType == "fragment">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/fragment/Fragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/fragment/${fragmentName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/fragment/${fragmentName}.kt" />

        <instantiate
                from="root/res/layout/layout.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
        <open file="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
    <#elseif viewType == "fragmentDialog">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/dialog/DialogFragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />

        <instantiate
                from="root/res/layout/layout.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${fragmentDialogLayoutName}.xml" />
        <open file="${escapeXmlAttribute(resOut)}/layout/${fragmentDialogLayoutName}.xml" />
    <#elseif viewType == "fullscreenFragmentDialog">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/dialog/FullscreenDialogFragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />

        <instantiate
                from="root/res/layout/layout.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${fragmentDialogLayoutName}.xml" />
        <open file="${escapeXmlAttribute(resOut)}/layout/${fragmentDialogLayoutName}.xml" />
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
