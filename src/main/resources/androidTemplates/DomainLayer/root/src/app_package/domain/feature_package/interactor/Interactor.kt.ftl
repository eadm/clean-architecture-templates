package ${packageName}.domain.${camelCaseToUnderscore(featureName)}.interactor

class ${interactorName}
@Inject
constructor(
    private val ${repositoryName?uncap_first}: ${repositoryName}
) {

}