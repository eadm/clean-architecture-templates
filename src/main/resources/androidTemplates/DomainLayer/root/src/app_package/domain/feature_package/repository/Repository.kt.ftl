package ${packageName}.domain.${camelCaseToUnderscore(featureName)}.repository
<#include "../../../../../../../common/Common.kt.ftl">
import ${itemPackage}.${itemName}
<#if isExposeSaveOperation!false>
import io.reactivex.Completable
</#if>
import io.reactivex.Single

interface ${repositoryName} {
    <@getter itemName=itemName idType=idType isSupportSourceType=true isSingleItem=isSingleItemOperation primarySourceType="DataSourceType.REMOTE" />

<#if isExposeSaveOperation!false>
    <@setter itemName=itemName isSingleItem=isSingleItemOperation />
</#if>
}