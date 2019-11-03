package ${packageName}.cache.${camelCaseToUnderscore(featureName)}.mapper

import ${packageName}.cache.${camelCaseToUnderscore(featureName)}.model.${entityName}
import javax.inject.Inject

class ${entityMapperName}
@Inject
constructor() {
    fun mapToEntity(item: ${itemName}): ${entityName} = TODO()

    fun mapFromEntity(entity: ${entityName}): ${itemName} = TODO()
}