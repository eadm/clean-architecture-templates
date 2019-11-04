package ${packageName}.remote.${camelCaseToUnderscore(featureName)}.mapper

import ${packageName}.remote.${camelCaseToUnderscore(featureName)}.model.${responseName}
import ${itemPackage}.${itemName}
import javax.inject.Inject

class ${responseMapperName}
@Inject
constructor() {
    fun mapFromResponse(response: ${responseName}): List<${itemName}> =
        response.items
}