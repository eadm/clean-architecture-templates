package ru.hh.plugins.geminio.config

import ru.hh.plugins.extensions.EMPTY


data class GeminioPluginConfig(
    var configFilePath: String = String.EMPTY,
    var templateGroupsPath: String = String.EMPTY,
    var groupsNames: GroupsNames = GroupsNames(),
) {

    data class GroupsNames(
        var group1: String = String.EMPTY,
        var group2: String = String.EMPTY
    )

}