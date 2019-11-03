package ru.nobird.arch.generator.dialog

import com.intellij.openapi.project.Project
import com.intellij.openapi.ui.DialogWrapper
import javax.swing.JComponent
import javax.swing.JPanel

class NewFeatureDialog(project: Project) : DialogWrapper(project) {
    private lateinit var rootComponent: JPanel

    init {
        init()
        title = "Create new feature"
    }

    override fun createCenterPanel(): JComponent? =
        rootComponent
}