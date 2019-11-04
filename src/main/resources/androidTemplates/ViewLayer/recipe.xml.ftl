<?xml version="1.0"?>
<recipe>
    <#if viewType == "activity">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/activity/Activity.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/activity/${activityName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/activity/${activityName}.kt" />

        <instantiate
                from="root/res/layout/layout.xml.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
        <open file="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
    <#elseif viewType == "fragment">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/fragment/Fragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/fragment/${fragmentName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/fragment/${fragmentName}.kt" />

        <instantiate
                from="root/res/layout/layout.xml.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
        <open file="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
    <#elseif viewType == "fragmentDialog">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/dialog/DialogFragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />

        <instantiate
                from="root/res/layout/layout.xml.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${fragmentDialogLayoutName}.xml" />
        <open file="${escapeXmlAttribute(resOut)}/layout/${fragmentDialogLayoutName}.xml" />
    <#elseif viewType == "fullscreenFragmentDialog">
        <instantiate
                from="root/src/app_package/view/feature_package/ui/dialog/FullscreenDialogFragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/dialog/${fragmentDialogName}.kt" />

        <instantiate
                from="root/res/layout/layout.xml.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${fragmentDialogLayoutName}.xml" />
        <open file="${escapeXmlAttribute(resOut)}/layout/${fragmentDialogLayoutName}.xml" />
    </#if>
</recipe>
