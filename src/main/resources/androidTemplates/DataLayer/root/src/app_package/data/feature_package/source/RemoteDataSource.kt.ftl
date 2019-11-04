package ${packageName}.data.${camelCaseToUnderscore(featureName)}.source
<#include "../../../../../../../common/Common.kt.ftl">
import io.reactivex.Single

interface ${remoteDataSourceName} {
    <@getter itemName=itemName idType=idType />
}