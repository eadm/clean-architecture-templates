# clean-architecture-templates
Set of templates for Android Studio to work with [feature based CLEAN architecture](https://hackmd.io/@4F6roGkFSHeYx4R4sBs7ew/BJg82eA7N?type=view)

[Plugin page in marketplace](https://plugins.jetbrains.com/plugin/13275-code-templates-for-feature-based-clean-android-architecture)

## Installation 
Install plugin from marketplace or by downloading plugin file and installing manually. After installation import plugins by pressing button in following notification.

<img src="https://raw.githubusercontent.com/eadm/clean-architecture-templates/master/images/notification.png" width="360" />

## Usage
Templates could be found under **Clean Architecture** category in new file menu. 

<img src="https://raw.githubusercontent.com/eadm/clean-architecture-templates/master/images/category.png" width="360" />

### Root package
Each template has **Root package** parameter that should be equal to parent package of layer packages. For example **Root package** for following package structure is **org.stepik.android**.

<img src="https://i.imgur.com/5YOAvWy.png" width="240" />

### Order of layers
Generally order of layers creation is not crucial but to avoid issues with imports it is recommended to follow dependency graph of layers. So recommended order is following:
1. domain
2. data
3. cache
4. remote
5. presentation
6. injection
7. view

# clean-architecture-templates RU
## Установка 
Установите плагин из репозитория JetBrains либо вручную, скачав zip архив. После установки необходимо импортировать новые шаблоны, нажав на кнопку на уведомлении.

<img src="https://raw.githubusercontent.com/eadm/clean-architecture-templates/master/images/notification.png" width="360" />

## Использвание
Шаблоны могут быть найдены в категории **Clean Architecture** в меню создания нового файла. 

<img src="https://raw.githubusercontent.com/eadm/clean-architecture-templates/master/images/category.png" width="360" />

### Root package
Каждый шаблон имеет параметр **Root package**, который должен быть равен родителю пакетов слоёв. Например для следующей структуры пакетов **Root package** должен быть равен **org.stepik.android**.

<img src="https://i.imgur.com/5YOAvWy.png" width="240" />

### Порядок создания слоев
В общем, порядок создания слоёв не является критичным, однако для избежания проблем с импортами рекомендуется придерживаться порядка, заданного графом зависимостей между слоями. Таким образом рекомендованный порядок следующий:
1. domain
2. data
3. cache
4. remote
5. presentation
6. injection
7. view
