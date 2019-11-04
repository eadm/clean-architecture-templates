package ${packageName}.presentation.${camelCaseToUnderscore(featureName)}.mapper

import ${packageName}.presentation.${camelCaseToUnderscore(featureName)}.model.${listItemName}
import ${packageName}.presentation.${camelCaseToUnderscore(featureName)}.${viewName}
import javax.inject.Inject

class ${stateMapperName}
@Inject
constructor() {
    fun mapState(state: ${viewName}.State): ${viewName}.State =
        TODO()
}