package ${packageName}.data.${camelCaseToUnderscore(featureName)}.source

import io.reactivex.Completable
import io.reactivex.Single

interface ${cacheDataSourceName} {
    fun get${itemName}s(vararg ids: ${idType}): Single<List<${itemName}>>

    fun save${itemName}s(items: List<${itemName}>): Completable
}