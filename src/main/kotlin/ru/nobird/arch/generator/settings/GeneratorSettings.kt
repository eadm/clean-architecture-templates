package ru.nobird.arch.generator.settings

import com.intellij.ide.fileTemplates.*
import com.intellij.openapi.fileChooser.FileChooser
import com.intellij.openapi.fileChooser.FileChooserDescriptor
import com.intellij.openapi.fileTypes.FileTypeManager
import com.intellij.openapi.options.Configurable
import com.intellij.openapi.project.Project
import com.intellij.openapi.ui.TextBrowseFolderListener
import com.intellij.openapi.ui.TextFieldWithBrowseButton
import com.intellij.openapi.util.io.FileUtil
import com.intellij.openapi.vfs.VirtualFile
import ru.nobird.arch.generator.component.GeneratorProjectComponent
import ru.nobird.arch.generator.data.Layer
import java.io.InputStreamReader
import javax.swing.*
import javax.swing.event.DocumentEvent
import javax.swing.event.DocumentListener

class GeneratorSettings(
    private val project: Project
) : Configurable, DocumentListener {
    companion object {
        const val KOTLIN_TEMPLATE = "KotlinTestClass"
        private const val KOTLIN_TEMPLATE_EXT = "kt"
    }

    private lateinit var cachePathField: TextFieldWithBrowseButton
    private lateinit var cachePathLabel: JLabel
    private lateinit var remotePathField: TextFieldWithBrowseButton
    private lateinit var remotePathLabel: JLabel
    private lateinit var dataPathField: TextFieldWithBrowseButton
    private lateinit var domainPathField: TextFieldWithBrowseButton
    private lateinit var presentationPathField: TextFieldWithBrowseButton
    private lateinit var viewPathField: TextFieldWithBrowseButton
    private lateinit var injectionPathField: TextFieldWithBrowseButton
    private lateinit var dataPathLabel: JLabel
    private lateinit var domainPathLabel: JLabel
    private lateinit var presentationPathLabel: JLabel
    private lateinit var viewPathLabel: JLabel
    private lateinit var injectionPathLabel: JLabel
    private lateinit var rootPanel: JPanel

    private lateinit var rootPathButton: JButton

    private var isModified = false

    override fun getDisplayName(): String =
        "CLEAN Generator Settings"

    private val config = GeneratorProjectComponent.getInstance(project)

    private lateinit var fields: Map<Layer, TextFieldWithBrowseButton>

    override fun createComponent(): JComponent? {
        fields = mapOf(
            Layer.CACHE to cachePathField,
            Layer.REMOTE to remotePathField,
            Layer.DATA to dataPathField,
            Layer.DOMAIN to domainPathField,
            Layer.PRESENTATION to presentationPathField,
            Layer.VIEW to viewPathField,
            Layer.INJECTION to injectionPathField
        )

        val fileChooserDescriptor = FileChooserDescriptor(false, true, false, false, false, false)
        fields.forEach { (layer, field) ->
            config.paths[layer]?.let(field::setText)

            field.textField.document.addDocumentListener(this)
            field.isEditable = false
            field.addBrowseFolderListener(TextBrowseFolderListener(fileChooserDescriptor, project))
        }

        rootPathButton.addActionListener {
            FileChooser.chooseFile(fileChooserDescriptor, project, null) { dir ->
                fillRootField(dir.children, Layer.values())
            }
        }

        return rootPanel
    }

    private fun fillRootField(children: Array<VirtualFile>, layers: Array<Layer>) {
        layers.forEach  { layer ->
            children.forEach loop@ { child ->
                if (child.name == layer.packageName) {
                    fields[layer]?.text = child.canonicalPath ?: ""
                    child.children?.let {
                        fillRootField(it, layer.children)
                    }
                    return@loop
                }
            }
        }
    }

    override fun isModified(): Boolean =
        isModified

    override fun apply() {
        fields.forEach { (layer, field) ->
            config.paths[layer] = field.text.takeIf(String::isNotBlank)
        }
        isModified = false
    }

    override fun changedUpdate(e: DocumentEvent) {
        isModified = true
    }

    override fun insertUpdate(e: DocumentEvent) {
        isModified = true
    }

    override fun removeUpdate(e: DocumentEvent) {
        isModified = true
    }

    private fun getTemplate(name: String, ext: String): FileTemplate {
        val templateManager = FileTemplateManager.getInstance(project)

        val icon = FileTypeManager.getInstance().getStdFileType("Kotlin").icon
//        templateManager.add
//        FileTemplateGroupDescriptor("", icon)


//        FileTemplateDescriptor(name)

        return templateManager
            .getInternalTemplate(name)!!
            .apply {
                if (text.isBlank()) {
                    text = FileUtil.loadTextAndClose(InputStreamReader(javaClass.classLoader.getResourceAsStream("/fileTemplates/internal/$name.$ext.ft")))
                }
            }

//            ?: templateManager
//                .addTemplate(name, ext)
//                .apply {
//                    text = FileUtil.loadTextAndClose(InputStreamReader(javaClass.classLoader.getResourceAsStream("/fileTemplates/internal/$name.$ext.ft")))
//                }
    }
}