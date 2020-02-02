package ru.nobird.arch.templates.component

import com.intellij.ide.plugins.PluginManager
import com.intellij.notification.NotificationDisplayType
import com.intellij.notification.NotificationGroup
import com.intellij.notification.NotificationListener
import com.intellij.notification.NotificationType
import com.intellij.openapi.components.PersistentStateComponent
import com.intellij.openapi.components.ProjectComponent
import com.intellij.openapi.components.State
import com.intellij.openapi.components.Storage
import com.intellij.openapi.extensions.PluginId
import com.intellij.openapi.project.Project
import com.intellij.util.xmlb.XmlSerializerUtil
import com.intellij.util.xmlb.annotations.Attribute
import ru.nobird.arch.templates.utils.DemoBundle
import ru.nobird.arch.templates.utils.FileUtils
import ru.nobird.arch.templates.utils.Utils
import java.io.Serializable
import javax.swing.event.HyperlinkEvent


@State(
    name = "TemplatesBaseConfiguration",
    storages = [Storage(value = "baseConfiguration.xml")]
)
class TemplatesProjectComponent :
    ProjectComponent,
    PersistentStateComponent<TemplatesProjectComponent>,
    Serializable {

    companion object {
        private const val PLUGIN_ID = "ru.nobird.arch.templates"

        fun getInstance(project: Project): TemplatesProjectComponent =
            project.getComponent(TemplatesProjectComponent::class.java)
    }

    @Attribute
    private var localVersion: String = "0.0"
    private lateinit var version: String

    override fun initComponent() {
        super.initComponent()

        version = PluginManager
            .getPlugin(PluginId.getId(PLUGIN_ID))
            ?.version
            ?: throw IllegalStateException("Can't get plugin version")

        if (isANewVersion()) {
            val message = Utils.createHyperLink(
                DemoBundle.message("component.jira.template.success.pre"),
                DemoBundle.message("component.jira.template.success.link"),
                DemoBundle.message("component.jira.template.success.post")
            )
            val listener = NotificationListener { notification, event ->
                if (event.eventType === HyperlinkEvent.EventType.ACTIVATED) {
                    notification.hideBalloon()
                    val sourceDirectoryList = listOf("/androidTemplates/")
                    val writeDirectoryList = listOf("/.android/templates/other", "/.android/templates")
                    FileUtils.copyTemplates(sourceDirectoryList, writeDirectoryList, null)
                    localVersion = version
                }
            }
            Utils.createNotification(DemoBundle.message("dialog.update"), message, null, NotificationType.INFORMATION, listener)
        }
    }

    private fun isANewVersion(): Boolean {
        val s1 = localVersion.split("-")[0].split(".")
        val s2 = version.split("-")[0].split(".")

        if (s1.size != s2.size) return false
        var i = 0

        do {
            val l1 = s1[i]
            val l2 = s2[i]
            if (l1 < l2) return true
            i++
        } while (i < s1.size && i < s2.size)

        return false
    }

    override fun getState(): TemplatesProjectComponent? = this

    override fun loadState(state: TemplatesProjectComponent) {
        XmlSerializerUtil.copyBean(state, this)
    }
}