package ${packageName}.view.${camelCaseToUnderscore(featureName)}.ui.activity
<#include "../../../../../../../../common/Common.kt.ftl" />
import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
<#if isMvp!false>
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import ru.nobird.android.ui.viewstatedelegate.ViewStateDelegate
import ${packageName}.presentation.${camelCaseToUnderscore(featureName)}.${presenterName}
import ${packageName}.presentation.${camelCaseToUnderscore(featureName)}.${viewName}
</#if>
import ${packageName}.R
<#if isCreateList!false><@listImports /></#if>
import kotlinx.android.synthetic.main.${activityLayoutName}.*
import javax.inject.Inject

class ${activityName} : AppCompatActivity()<#if isMvp!false>, ${viewName}</#if> {
    companion object {
        fun createIntent(context: Context): Intent =
            Intent(context, ${activityName}::class.java)
    }

<#if isMvp!false>
<@presenterInject presenterName=presenterName />
</#if>

<#if isCreateList!false>
    private lateinit var ${listItemName?uncap_first}adapter: DefaultDelegateAdapter<${listItemName}>
</#if>

<#if isMvp!false>
    private lateinit var viewStateDelegate: ViewStateDelegate<${viewName}.State>
</#if>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.${activityLayoutName})

        <#if isHasComponent!false>
        injectComponent()
        </#if>

        <#if isMvp!false>
        <@presenterInit presenterName=presenterName />
        viewStateDelegate = ViewStateDelegate()
        </#if>

        <#if isCreateList!false>
        ${listItemName?uncap_first}adapter = DefaultDelegateAdapter()

        with(recycler) {
            adapter = ${listItemName?uncap_first}adapter
            layoutManager = LinearLayoutManager(context)
        }
        </#if>
    }

<#if isHasComponent!false>
<@injectComponent componentName=componentName />
</#if>

<#if isMvp!false>
<@presenterAttach presenterName=presenterName />

    override fun setState(state: ${viewName}.State) {
        when (state) {

        }
    }

    override fun showNetworkError() {

    }
</#if>
}