package ${packageName}.domain.${camelCaseToUnderscore(featureName)}.interactor

import ${itemPackage}.${itemName}

class ${interactorName}
@Inject
constructor(
    private val ${repositoryName?uncap_first}: ${repositoryName}
) {

}