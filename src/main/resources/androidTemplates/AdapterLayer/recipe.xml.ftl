<?xml version="1.0"?>
<recipe>
        <instantiate
                from="root/src/app_package/view/feature_package/ui/adapter/delegates/AdapterDelegate.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/adapter/delegates/${adapterName}.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/view/${camelCaseToUnderscore(featureName)}/ui/adapter/delegates/${adapterName}.kt" />

        <instantiate
                from="root/res/layout/adapter_layout.xml.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${adapterLayoutName}.xml" />
        <open file="${escapeXmlAttribute(resOut)}/layout/${adapterLayoutName}.xml" />

</recipe>
