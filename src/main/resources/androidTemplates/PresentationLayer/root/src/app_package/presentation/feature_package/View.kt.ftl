package ${packageName}.presentation.${camelCaseToUnderscore(featureName)}

interface ${viewName} {
    sealed class State {
        object Idle : State()
        object Loading : State()

        class Content(val items: List<<#if isCreateListItem!false>${listItemName}<#else>${itemName}</#if>>) : State()
    }

    fun setState(state: State)
    fun showNetworkError()
}