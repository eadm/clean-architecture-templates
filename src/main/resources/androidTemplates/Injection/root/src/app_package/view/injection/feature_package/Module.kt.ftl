package ${packageName}.view.injection.${camelCaseToUnderscore(featureName)}

import androidx.lifecycle.ViewModel
import dagger.Binds
import dagger.Module
import dagger.multibindings.IntoMap
import ${packageName}.presentation.${camelCaseToUnderscore(featureName)}.${presenterName}

@Module
internal abstract class ${moduleName} {

    /**
     * PRESENTATION LAYER
     */
    @Binds
    @IntoMap
    @ViewModelKey(${presenterName}::class)
    internal abstract fun bind${presenterName}(${presenterName?uncap_first}: ${presenterName}): ViewModel
}