package ${packageName}.view.injection.${camelCaseToUnderscore(featureName)}

import dagger.Subcomponent

@Subcomponent(modules = [

])
interface ${componentName} {
    @Subcomponent.Builder
    interface Builder {
        fun build(): ${componentName}
    }


}