package ${packageName}.data.${camelCaseToUnderscore(featureName)}.source

import io.reactivex.Single

interface ${remoteDataSourceName} {
    fun get${itemName}s(vararg ids: ${idType}): Single<List<${itemName}>>
}