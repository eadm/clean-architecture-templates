<#macro ids isSingleItem=false><#if isSingleItem!false>id<#else>ids</#if></#macro>
<#macro items isSingleItem=false><#if isSingleItem!false>item<#else>items</#if></#macro>

<#macro getter itemName idType isSingleItem=false  isOverride=false isSupportSourceType=false primarySourceType="">
    <#if isOverride!false>override</#if> fun get${itemName}<#if isSingleItem == true>(id<#else>s(vararg ids</#if>: ${idType}<#if isSupportSourceType!false>, primarySourceType: DataSourceType<#if primarySourceType?has_content> = primarySourceType</#if></#if>): Single<<#if isSingleItem == true>${itemName}<#else>List<${itemName}></#if>>
</#macro>

<#macro setter itemName isSingleItem=false isOverride=false>
    <#if isOverride!false>override</#if> fun save${itemName}<#if isSingleItem == true>(item: ${itemName}<#else>s(items: List<${itemName}></#if>): Completable
</#macro>

<#macro presenterInject presenterName="Presenter">
    @Inject
    internal lateinit var viewModelFactory: ViewModelProvider.Factory

    private lateinit var ${presenterName?uncap_first}: ${presenterName}
</#macro>

<#macro presenterInit presenterName="Presenter">
    ${presenterName?uncap_first} = ViewModelProviders
        .of(this, viewModelFactory)
        .get(${presenterName}::class.java)
</#macro>

<#macro presenterAttach presenterName="Presenter" isFullscreenDialog=false>
    override fun onStart() {
        super.onStart()
        <#if isFullscreenDialog>
        dialog
            ?.window
            ?.let { window ->
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT,  ViewGroup.LayoutParams.MATCH_PARENT)
                window.setWindowAnimations(R.style.AppTheme_FullScreenDialog)
            }
        </#if>

        ${presenterName?uncap_first}.attachView(this)
    }

    override fun onStop() {
        ${presenterName?uncap_first}.detachView(this)
        super.onStop()
    }
</#macro>

<#macro injectComponent componentName>
    private fun injectComponent() {
        App.component()
            .${componentName}ComponentBuilder()
            .build()
            .inject(this)
    }
</#macro>

<#macro listImports>
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import ru.nobird.android.ui.adapters.DefaultDelegateAdapter
</#macro>