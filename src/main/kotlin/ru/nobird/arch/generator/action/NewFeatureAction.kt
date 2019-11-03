package ru.nobird.arch.generator.action

import com.intellij.notification.NotificationDisplayType
import com.intellij.notification.NotificationGroup
import com.intellij.notification.NotificationType
import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.actionSystem.CommonDataKeys
import com.intellij.openapi.actionSystem.LangDataKeys
import ru.nobird.arch.generator.component.GeneratorProjectComponent
import ru.nobird.arch.generator.data.Layer

class NewFeatureAction : AnAction() {
    override fun actionPerformed(e: AnActionEvent) {
        val module = LangDataKeys.MODULE.getData(e.dataContext)
            ?: return

        val targetDirectory = CommonDataKeys.VIRTUAL_FILE.getData(e.dataContext)
            ?: return

        val config = GeneratorProjectComponent.getInstance(e.project ?: return)

        val noti = NotificationGroup("myplugin", NotificationDisplayType.STICKY_BALLOON, true)
        noti.createNotification("My Title",
            "My Message module = ${module.name}, " +
                    "targetDir = ${targetDirectory.canonicalPath}" +
                    "conf = ${config.paths[Layer.DOMAIN]}",
            NotificationType.INFORMATION,
            null
        ).notify(e.project)

        println("DO")
    }
}
