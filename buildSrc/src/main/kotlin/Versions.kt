object Versions {
    const val kotlin = "1.4.20"
    const val intellijPlugin = "0.6.5"

    val chosenProduct = Product.LOCAL
}

object GradlePlugins {
    const val gradleIntelliJPlugin = "org.jetbrains.intellij"

    const val setupIdeaPlugin = "ru.hh.plugins.gradle.setup_idea_plugin"
    const val coreModuleMarker = "ru.hh.plugins.gradle.core_module_marker"
    const val collectUpdatePluginsXml = "ru.hh.plugins.gradle.collect_update_plugins"
    const val buildAllPlugins = "ru.hh.plugins.gradle.build_all_plugins"
    const val installGitHooks = "ru.hh.plugins.gradle.install_git_hooks"
}

object BuildPlugins {
    const val kotlinPlugin = "org.jetbrains.kotlin:kotlin-gradle-plugin:${Versions.kotlin}"
}

object Libs {
    const val freemarker = "org.freemarker:freemarker:2.3.30"
    const val flexmark = "com.vladsch.flexmark:flexmark-all:0.50.42"

    val tests = UnitTests

    object UnitTests {
        private const val kotestVersion = "4.3.1"

        const val kotest = "io.kotest:kotest-runner-junit5:$kotestVersion"
    }
}


enum class Product(
    val isLocal: Boolean = false,
    val ideVersion: String,
    val pluginsNames: List<String>
) {
    LOCAL(
        isLocal = true,
        ideVersion = "C:\\Users\\ratio\\Desktop\\android-studio-4-2",
        pluginsNames = listOf(
            "android",
            "android-layoutlib",
            "Kotlin",
            "java",
            "Groovy",
            "git4idea",
            "IntelliLang"
        )
    )
}