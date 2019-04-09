package ru.nobird.arch.generator.component

import com.intellij.ide.plugins.PluginManager
import com.intellij.openapi.components.*
import com.intellij.openapi.extensions.PluginId
import com.intellij.openapi.project.Project
import com.intellij.psi.PsiPackage
import com.intellij.util.xmlb.XmlSerializerUtil
import com.intellij.util.xmlb.annotations.Attribute
import ru.nobird.arch.generator.migration.MigrationManager
import java.io.Serializable

@State(
    name = "GeneratorBaseConfiguration",
    storages = [Storage(value = "baseConfiguration.xml")]
)
class GeneratorProjectComponent(
    project: Project? = null
) : AbstractProjectComponent(project),
    PersistentStateComponent<GeneratorProjectComponent>,
    Serializable {

    companion object {
        private const val PLUGIN_ID = "ru.nobird.arch.generator"

        fun getInstance(project: Project): GeneratorProjectComponent =
            project.getComponent(GeneratorProjectComponent::class.java)
    }

    private val migrationManager = MigrationManager()

    @Attribute
    private var localVersion: String = "0.0"
    private lateinit var version: String

    @Attribute
    internal var rootPackagePath: String? = null

    override fun initComponent() {
        super.initComponent()

        version = PluginManager
            .getPlugin(PluginId.getId(PLUGIN_ID))
            ?.version
            ?: throw IllegalStateException("Can't get plugin version")

        if (isANewVersion()) {
            migrationManager.migrate(fromVersion = localVersion, toVersion = version)
            localVersion = version
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

    override fun getState(): GeneratorProjectComponent? = this

    override fun loadState(state: GeneratorProjectComponent) {
        XmlSerializerUtil.copyBean(state, this)
    }
}