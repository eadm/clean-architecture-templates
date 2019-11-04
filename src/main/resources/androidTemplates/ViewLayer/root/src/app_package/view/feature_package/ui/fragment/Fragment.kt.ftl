package ${packageName}.view.${camelCaseToUnderscore(featureName)}.ui.fragment
<#include "../../../../../../../../common/Common.kt.ftl" />
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import ru.nobird.android.view.base.ui.extension.argument
<#if isMvp!false>
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import ru.nobird.android.ui.viewstatedelegate.ViewStateDelegate
import ${packageName}.presentation.${camelCaseToUnderscore(featureName)}.${presenterName}
import ${packageName}.presentation.${camelCaseToUnderscore(featureName)}.${viewName}
</#if>
import ${packageName}.R
<#if isCreateList!false><@listImports /></#if>
import kotlinx.android.synthetic.main.${layoutName}.*
import javax.inject.Inject

class ${fragmentName} : Fragment()<#if isMvp!false>, ${viewName}</#if> {
    companion object {
        fun newInstance(): Fragment =
            ${fragmentName}()
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

        <#if isHasComponent!false>
        injectComponent()
        </#if>

        <#if isMvp!false>
            <@presenterInit presenterName=presenterName />
        </#if>
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? =
        inflater.inflate(R.layout.${layoutName}, container, false)

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        <#if isMvp!false>
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