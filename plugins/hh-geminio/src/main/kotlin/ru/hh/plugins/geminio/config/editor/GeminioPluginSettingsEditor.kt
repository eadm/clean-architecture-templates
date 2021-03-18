package ru.hh.plugins.geminio.config.editor

import com.intellij.openapi.project.Project
import com.intellij.ui.layout.CCFlags
import com.intellij.ui.layout.panel
import ru.hh.plugins.PluginsConstants
import ru.hh.plugins.geminio.config.GeminioPluginConfig
import ru.hh.plugins.views.layouts.fileChooserButton
import javax.swing.JComponent
import javax.swing.JTextField


class GeminioPluginSettingsEditor(
    private val initialConfigFilePath: String
) {

    companion object {

        fun newInstance(settings: GeminioPluginSettings): GeminioPluginSettingsEditor {
            return with(settings) {
                GeminioPluginSettingsEditor(
                    initialConfigFilePath = config.configFilePath
                )
            }
        }

    }

    private lateinit var configFilePathTextField: JTextField

    fun createComponent(project: Project): JComponent {
        return panel {
            titledRow("Config file path:") {
                row {
                    configFilePathTextField = JTextField(initialConfigFilePath)
                    configFilePathTextField(CCFlags.growX)
                }
                row {
                    fileChooserButton(
                        project = project,
                        buttonText = "Choose config file",
                        filterText = "Config files",
                        fileChooserButtonText = "Save",
                        filterFilesExtensions = arrayOf(PluginsConstants.YAML_FILES_FILTER_EXTENSION)
                    ) { selectedFile ->
                        configFilePathTextField.text = selectedFile.absolutePath
                    }
                }
            }
        }
    }

    fun isModified(settings: GeminioPluginSettings): Boolean {
        return with(settings) {
            config.configFilePath != configFilePathTextField.text
        }
    }

    fun applyNewConfiguration(settings: GeminioPluginSettings) {
        if (settings.config.configFilePath != configFilePathTextField.text) {
            settings.tryLoadFromConfigFile(configFilePathTextField.text)
        }
    }

}