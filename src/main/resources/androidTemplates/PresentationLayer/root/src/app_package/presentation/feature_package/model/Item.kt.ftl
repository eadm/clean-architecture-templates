package ${packageName}.presentation.${camelCaseToUnderscore(featureName)}.model

import ${itemPackage}.${itemName}
import ru.nobird.android.core.model.Identifiable

sealed class ${listItemName} {
    data class Data(
        val ${itemName?uncap_first}: ${itemName}
    ) : ${listItemName}(), Identifiable<${idType}> {
        override val id: Long =
            ${itemName?uncap_first}.id
    }
}