package ru.nobird.arch.generator.action

import com.android.tools.idea.npw.model.RenderTemplateModel
import com.android.tools.idea.npw.project.AndroidPackageUtils
import com.intellij.notification.NotificationDisplayType
import com.intellij.notification.NotificationGroup
import com.intellij.notification.NotificationType
import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.actionSystem.CommonDataKeys
import com.intellij.openapi.actionSystem.LangDataKeys
import com.intellij.openapi.util.io.FileUtil
import org.jetbrains.android.facet.AndroidFacet
import ru.nobird.arch.generator.component.GeneratorProjectComponent
import ru.nobird.arch.generator.data.Layer

class NewFeatureAction : AnAction() {
    override fun actionPerformed(e: AnActionEvent) {
        val module = LangDataKeys.MODULE.getData(e.dataContext)
            ?: return

        val targetDirectory = CommonDataKeys.VIRTUAL_FILE.getData(e.dataContext)
            ?: return

        val facet = AndroidFacet.getInstance(module) ?: return
        val moduleTemplates = AndroidPackageUtils.getModuleTemplates(facet, targetDirectory)
        val packageSuggestion = AndroidPackageUtils.getPackageForPath(facet, moduleTemplates, targetDirectory)
        val project = facet.module.project
        val config = GeneratorProjectComponent.getInstance(project)


        val noti = NotificationGroup("myplugin", NotificationDisplayType.STICKY_BALLOON, true)
        noti.createNotification("My Title",
            "My Message module = ${module.name}, \n" +
                    "targetDir = ${targetDirectory.canonicalPath},\n" +
                    "conf = ${config.paths[Layer.DOMAIN]}\n" +
                    "packageSuggestion = $packageSuggestion",
            NotificationType.INFORMATION,
            null
        ).notify(e.project)

        println("DO")
    }
}
