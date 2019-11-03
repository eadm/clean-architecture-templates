package ${escapeKotlinIdentifiers(packageName)}

import javax.inject.Inject

class ${featureName}CacheDataSourceImpl
@Inject
constructor(
    private val ${featureName?uncap_first}Dao: ${featureName}Dao
) {

}