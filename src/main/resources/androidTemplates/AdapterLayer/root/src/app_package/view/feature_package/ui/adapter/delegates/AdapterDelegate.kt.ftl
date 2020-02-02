import android.view.View
import android.view.ViewGroup
import ${packageName}.R
import ru.nobird.android.ui.adapterdelegates.AdapterDelegate
import ru.nobird.android.ui.adapterdelegates.DelegateViewHolder
import kotlinx.android.extensions.LayoutContainer

class ${adapterName}<#if hasClickListener!false>(
    private val onClick: (${listItemName}) -> Unit = {}
)</#if>: AdapterDelegate<${listItemName}, DelegateViewHolder<${listItemName}>>() {

    override fun isForViewType(position: Int, data: ${listItemName}): Boolean =
        data is ${listItemName}

    override fun onCreateViewHolder(parent: ViewGroup): DelegateViewHolder<${listItemName}> =
        ViewHolder(createView(parent, R.layout.${adapterLayoutName}))

    private inner class ViewHolder(
        override val containerView: View
    ) : DelegateViewHolder<${listItemName}>(containerView), LayoutContainer {

        <#if hasClickListener!false>
            init {
                containerView.setOnClickListener {
                    val data = itemData ?: return@setOnClickListener
                    onClick(data)
                }
            }
        </#if>
        override fun onBind(data: ${listItemName}) {

        }
    }
}