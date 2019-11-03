package ${packageName}.cache.${camelCaseToUnderscore(featureName)}

<#if isCreateDao!false>
import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.dao.${daoName}
</#if>
<#if isCreateEntityMapper!false>
import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.mapper.${entityMapperName}
</#if>
import ${packageName}.data.${camelCaseToUnderscore(featureName)}.source.${dataSourceName}
import io.reactivex.Completable
import io.reactivex.Single
import javax.inject.Inject

class ${dataSourceName}Impl
@Inject
constructor(
<#if isCreateDao!false>
    private val ${daoName?uncap_first}: ${daoName},
</#if>
<#if isCreateEntityMapper!false>
    private val ${entityMapperName?uncap_first}: ${entityMapperName}
</#if>
) : ${dataSourceName} {
    override fun get${itemName}s(vararg ids: ${idType}): Single<List<${itemName}>> =
        <#if isCreateDao!false>
        ${featureName?uncap_first}Dao
            .get${itemName}s(*ids)
        </#if>
        <#if isCreateEntityMapper == true>
            .map { it.map(${entityMapperName?uncap_first}::mapFromEntity) }
        </#if>

    override fun save${itemName}s(items: List<${itemName}>): Completable =
    <#if isCreateEntityMapper!false>
        Single
            .fromCallable { items.map(${entityMapperName?uncap_first}::mapToEntity) }
    <#else>
        Single
            .just(items)
    </#if>
    <#if isCreateDao!false>
            .flatMapCompletable(${daoName?uncap_first}::save${itemName})
    </#if>
}