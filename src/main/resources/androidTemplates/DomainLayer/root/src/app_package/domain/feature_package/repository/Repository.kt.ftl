package ${packageName}.domain.${camelCaseToUnderscore(featureName)}.repository

<#if isExposeSaveOperation!false>
import io.reactivex.Completable
</#if>
import io.reactivex.Single

interface ${repositoryName} {
    override fun get${itemName}s(vararg ids: ${idType}, primarySourceType: DataSourceType = DataSourceType.REMOTE): Single<List<${itemName}>>

<#if isExposeSaveOperation!false>
    override fun save${itemName}s(items: List<${itemName}>): Completable
</#if>
}