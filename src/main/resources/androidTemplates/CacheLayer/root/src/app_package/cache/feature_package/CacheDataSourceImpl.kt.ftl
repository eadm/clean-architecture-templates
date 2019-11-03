package ${packageName}.cache.${camelCaseToUnderscore(featureName)}

import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.mapper.${entityMapperName}
import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.model.${entityName}
import javax.inject.Inject

class ${featureName}CacheDataSourceImpl
@Inject
constructor(
    private val ${featureName?uncap_first}Dao: ${featureName}Dao,
    private val ${entityMapperName?uncap_first}: ${entityMapperName}
) {

}