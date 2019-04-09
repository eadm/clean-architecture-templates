package ru.nobird.arch.generator.settings

import com.intellij.ide.fileTemplates.*
import com.intellij.ide.util.PackageChooserDialog
import com.intellij.openapi.command.WriteCommandAction
import com.intellij.openapi.fileChooser.FileChooser
import com.intellij.openapi.fileChooser.FileChooserDescriptor
import com.intellij.openapi.fileChooser.FileChooserDialog
import com.intellij.openapi.fileTypes.FileTypeManager
import com.intellij.openapi.fileTypes.StdFileTypes
import com.intellij.openapi.options.Configurable
import com.intellij.openapi.project.Project
import com.intellij.openapi.ui.TextFieldWithBrowseButton
import com.intellij.openapi.util.io.FileUtil
import com.intellij.psi.PsiDirectory
import ru.nobird.arch.generator.component.GeneratorProjectComponent
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

    private lateinit var rootPathField: JTextField
    private lateinit var rootPathLabel: JLabel
    private lateinit var cachePathField: JTextField
    private lateinit var cachePathLabel: JLabel
    private lateinit var remotePathField: JTextField
    private lateinit var remotePathLabel: JLabel
    private lateinit var dataPathField: JTextField
    private lateinit var domainPathField: JTextField
    private lateinit var presentationPathField: JTextField
    private lateinit var viewPathField: JTextField
    private lateinit var injectionPathField: JTextField
    private lateinit var dataPathLabel: JLabel
    private lateinit var domainPathLabel: JLabel
    private lateinit var presentationPathLabel: JLabel
    private lateinit var viewPathLabel: JLabel
    private lateinit var injectionPathLabel: JLabel
    private lateinit var rootPanel: JPanel

    private lateinit var rootPathButton: JButton
    private lateinit var cachePathButton: JButton
    private lateinit var remotePathButton: JButton
    private lateinit var dataPathButton: JButton
    private lateinit var domainPathButton: JButton
    private lateinit var presentationPathButton: JButton
    private lateinit var viewPathButton: JButton
    private lateinit var injectionPathButton: JButton

    private var isModified = false

    override fun getDisplayName(): String =
        "Base Generator Settings"

    private val config = GeneratorProjectComponent.getInstance(project)

    override fun createComponent(): JComponent? {
        rootPathField.document.addDocumentListener(this)
        cachePathField.document.addDocumentListener(this)
        remotePathField.document.addDocumentListener(this)
        dataPathField.document.addDocumentListener(this)
        domainPathField.document.addDocumentListener(this)
        presentationPathField.document.addDocumentListener(this)
        viewPathField.document.addDocumentListener(this)
        injectionPathField.document.addDocumentListener(this)

        TextFieldWithBrowseButton(rootPathField) {
            val fileChooserDescriptor = FileChooserDescriptor(false, true, false, false, false, false)
            FileChooser.chooseFile(fileChooserDescriptor, project, null) {
                rootPathField.text = it.canonicalPath
            }
        }

        rootPathButton.addActionListener {
            val dialog = PackageChooserDialog("Choose root package", project)
            val isOk = dialog.showAndGet()


            if (isOk) {
                val pckg = dialog.selectedPackage

                val (mainDir, absolutePath) = pckg.directories
                    .map { it to getFullName(it) }
                    .find { it.second.contains("main") }!!

                rootPathField.text = absolutePath.joinToString(separator = "/")

                val template = getTemplate(KOTLIN_TEMPLATE, KOTLIN_TEMPLATE_EXT)

//                val file = FileTemplateUtil.createFromTemplate(template, "test1.kt", FileTemplateManager.getInstance().defaultProperties, mainDir)

//                val file1 = PsiFileFactory.getInstance(project).createFileFromText("test1.kt", Language.findLanguageByID("kotlin")!!, "")

//                WriteCommandAction.runWriteCommandAction(project) {
////                    mainDir.add(file1)
//                    val props = FileTemplateManager.getInstance(project)
//                        .defaultProperties
//                    props.setProperty("NAME", "test2")
//
//                    FileTemplateUtil.createFromTemplate(template, "test2.kt", props, mainDir)
//                }
            }
//            JFileChooser()
//                .showOpenDialog(rootPanel)
        }

        return rootPanel
    }

    private fun getFullName(pckg: PsiDirectory?): Sequence<String> =
        pckg
            ?.let {
                getFullName(it.parentDirectory) + it.name
            }
            ?: emptySequence()

    override fun isModified(): Boolean =
        isModified

    override fun apply() {
        config.rootPackagePath = rootPathField.text.takeIf(String::isNotBlank)
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