package ru.nobird.arch.generator.action

import com.intellij.notification.NotificationDisplayType
import com.intellij.notification.NotificationGroup
import com.intellij.notification.NotificationType
import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.AnActionEvent

class NewFeatureAction1 : AnAction() {
    override fun actionPerformed(e: AnActionEvent) {
        val noti = NotificationGroup("myplugin", NotificationDisplayType.STICKY_BALLOON, true)
        noti.createNotification("My Title",
            "My Message",
            NotificationType.INFORMATION,
            null
        ).notify(e.project)

        println("DO")
    }
}