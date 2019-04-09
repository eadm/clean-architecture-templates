package ru.nobird.arch.generator.template

import com.intellij.ide.fileTemplates.FileTemplateDescriptor
import com.intellij.ide.fileTemplates.FileTemplateGroupDescriptor
import com.intellij.ide.fileTemplates.FileTemplateGroupDescriptorFactory
import com.intellij.openapi.fileTypes.FileTypeManager
import ru.nobird.arch.generator.settings.GeneratorSettings

class GeneratorTemplateFactory : FileTemplateGroupDescriptorFactory {
    companion object {
        private const val GROUP_NAME = "CLEAN"

        private val icon = FileTypeManager.getInstance().getStdFileType("Kotlin").icon
    }

    override fun getFileTemplatesDescriptor(): FileTemplateGroupDescriptor =
        FileTemplateGroupDescriptor(GROUP_NAME, icon)
            .apply {
                addTemplate(FileTemplateDescriptor(GeneratorSettings.KOTLIN_TEMPLATE))
            }
}