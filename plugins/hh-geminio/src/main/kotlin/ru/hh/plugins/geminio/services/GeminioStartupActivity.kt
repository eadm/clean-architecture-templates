package ru.hh.plugins.geminio.services

import com.intellij.openapi.actionSystem.ActionManager
import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.DefaultActionGroup
import com.intellij.openapi.project.DumbService
import com.intellij.openapi.project.Project
import com.intellij.openapi.startup.StartupActivity
import ru.hh.plugins.extensions.toUnderlines
import ru.hh.plugins.geminio.GeminioConstants
import ru.hh.plugins.geminio.actions.template.ExecuteGeminioTemplateAction
import ru.hh.plugins.geminio.config.GeminioPluginConfig
import ru.hh.plugins.geminio.config.editor.GeminioPluginSettings
import java.io.File


/**
 * This code will be executed on project's startup.
 */
class GeminioStartupActivity : StartupActivity {

    companion object {
        private const val BASE_ID = "ru.hh.plugins.geminio.actions."

        private const val NEW_GROUP_ID_SUFFIX = "NewGroup."
        private const val GROUP1_ID_SUFFIX = "Group1."
        private const val GROUP2_ID_SUFFIX = "Group2."
        private const val GENERATE_GROUP_ID_SUFFIX = "GenerateGroup."
    }


    override fun runActivity(project: Project) {
        DumbService.getInstance(project).runWhenSmart {
            println("GeminioStartupActivity::")
            val pluginConfig = GeminioPluginSettings.getConfig(project)

            val pathToConfig = pluginConfig.configFilePath
            val pathToTemplates: String? = pluginConfig
                .templateGroupsPath
                .let { path ->
                    if (path.startsWith("./") || path.startsWith(".\\")) {
                        // convert relative path to absolute
                        val basePath: String = pathToConfig.let { base ->
                            base.replaceAfterLast("/", "", "")
                                .takeIf { it.isNotEmpty() }
                                ?: base.replaceAfterLast("\\", "", "")
                        }

                        (basePath + path.substring(2)).takeIf { basePath.isNotEmpty() }
                    } else {
                        // if it isn't relative then it is absolute
                        path
                    }
                }
                ?.takeIf { it.isNotEmpty() }

            println("\tpathToConfig: $pathToConfig")
            println("\tpathToTemplates: $pathToTemplates")
            println("============")
            println("============")

            if (pathToTemplates != null) {
                val pathEndSlash = "/".takeUnless { pathToTemplates.endsWith('/') } ?: ""

                if (pluginConfig.groupsNames.group1.isNotEmpty()) {
                    val fullPath = pathToTemplates + pathEndSlash + pluginConfig.groupsNames.group1
                    createActionsForTemplates(pluginConfig, fullPath, true)
                }

                if (pluginConfig.groupsNames.group2.isNotEmpty()) {
                    val fullPath = pathToTemplates + pathEndSlash + pluginConfig.groupsNames.group2
                    createActionsForTemplates(pluginConfig, fullPath, false)
                }
            }

            println("GeminioStartupActivity::END")
            println("==============================================")
        }
    }


    private fun createActionsForTemplates(
        pluginConfig: GeminioPluginConfig,
        rootDirPath: String,
        isGroup1: Boolean
    ) {
        val rootDirectory = File(rootDirPath)
        if (rootDirectory.exists().not() || rootDirectory.isDirectory.not()) {
            println("Templates directory doesn't exists [path: $rootDirPath, isGroup1: $isGroup1]")
            return
        }

        println("\tTemplates directory exists [path: $rootDirPath, isGroup1: $isGroup1]")
        val templatesDirs = rootDirectory.list { file, _ -> file.isDirectory } ?: emptyArray()

        println("\tTemplates count: ${templatesDirs.size}")
        println("============")

        val actionManager = ActionManager.getInstance()

        val bundle = getTemplateActionsBundle(pluginConfig, isGroup1)
        val groupIdSuffix = if (isGroup1) GROUP1_ID_SUFFIX else GROUP2_ID_SUFFIX

        val hhNewGroup = actionManager.getAction(bundle.templatesNewGroupId) as DefaultActionGroup
        hhNewGroup.templatePresentation.text = bundle.templatesNewGroupName
        val hhGenerateGroup = actionManager.getAction(bundle.templatesGenerateGroupId) as DefaultActionGroup

        templatesDirs.forEach { templateName ->
            val newActionForNewGroup = createActionForTemplate(
                templatesRootDirPath = rootDirPath,
                templateDirName = templateName,
                actionManager = actionManager,
                actionId = BASE_ID + NEW_GROUP_ID_SUFFIX + groupIdSuffix + templateName.toUnderlines()
            )

            if (newActionForNewGroup != null) {
                hhNewGroup += newActionForNewGroup
            }

            val newActionForGenerateGroup = createActionForTemplate(
                templatesRootDirPath = rootDirPath,
                templateDirName = templateName,
                actionManager = actionManager,
                actionId = BASE_ID + GENERATE_GROUP_ID_SUFFIX + groupIdSuffix + templateName.toUnderlines()
            )

            if (newActionForGenerateGroup != null) {
                hhGenerateGroup += newActionForGenerateGroup
            }
        }
    }


    private fun createActionForTemplate(
        templatesRootDirPath: String,
        templateDirName: String,
        actionManager: ActionManager,
        actionId: String,
    ): AnAction? {
        val action = ExecuteGeminioTemplateAction(
            actionText = templateDirName,
            actionDescription = "Action for executing '$templateDirName'",
            geminioRecipePath = getGeminioRecipeFilePath(templatesRootDirPath, templateDirName)
        )

        return if (actionManager.getAction(actionId) == null) {
            actionManager.registerAction(actionId, action)
            action
        } else {
            null
        }
    }

    private fun getGeminioRecipeFilePath(templatesRootDirPath: String, templateDirName: String): String {
        return "$templatesRootDirPath/$templateDirName/${GeminioConstants.GEMINIO_TEMPLATE_CONFIG_FILE_NAME}"
    }


    private fun getTemplateActionsBundle(
        pluginConfig: GeminioPluginConfig,
        isGroup1: Boolean
    ): TemplateActionsBundle {
        return when {
            isGroup1 -> {
                TemplateActionsBundle(
                    GeminioConstants.HH_MODULES_TEMPLATES_NEW_GROUP_ID,
                    GeminioConstants.HH_MODULES_TEMPLATES_GENERATE_GROUP_ID,
                    pluginConfig.groupsNames.group1
                )
            }

            else -> {
                TemplateActionsBundle(
                    GeminioConstants.HH_TEMPLATES_NEW_GROUP_ID,
                    GeminioConstants.HH_TEMPLATES_GENERATE_GROUP_ID,
                    pluginConfig.groupsNames.group2
                )
            }
        }
    }


    private data class TemplateActionsBundle(
        val templatesNewGroupId: String,
        val templatesGenerateGroupId: String,
        val templatesNewGroupName: String
    )

    private operator fun DefaultActionGroup.plusAssign(action: AnAction) {
        this.add(action)
    }

}