package ru.nobird.arch.generator.data

enum class Layer(
    val packageName: String,
    val children: Array<Layer> = emptyArray()
) {
    INJECTION("injection"),

    CACHE("cache"),
    REMOTE("remote"),
    DATA("data"),
    DOMAIN("domain"),
    PRESENTATION("presentation"),
    VIEW("view", children = arrayOf(INJECTION))
}