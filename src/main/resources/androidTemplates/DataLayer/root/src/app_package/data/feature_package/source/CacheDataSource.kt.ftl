package ${packageName}.data.${camelCaseToUnderscore(featureName)}.source
<#include "../../../../../../../common/Common.kt.ftl">
import io.reactivex.Completable
import io.reactivex.Single

interface ${cacheDataSourceName} {
    <@getter itemName=itemName idType=idType />

    <@setter itemName=itemName />
}