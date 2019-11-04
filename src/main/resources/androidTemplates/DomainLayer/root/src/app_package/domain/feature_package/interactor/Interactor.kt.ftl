package ${packageName}.domain.${camelCaseToUnderscore(featureName)}.interactor

import ${packageName}.domain.${camelCaseToUnderscore(featureName)}.repository.${repositoryName}
import ${itemPackage}.${itemName}
import javax.inject.Inject

class ${interactorName}
@Inject
constructor(
    private val ${repositoryName?uncap_first}: ${repositoryName}
) {

}