package ${packageName}.data.${camelCaseToUnderscore(featureName)}.source
<#include "../../../../../../../common/Common.kt.ftl">
import ${itemPackage}.${itemName}
import io.reactivex.Single

interface ${remoteDataSourceName} {
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation />
}