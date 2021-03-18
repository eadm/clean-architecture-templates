#### Команда `instantiate`

Параметры:

- `from` -- текстовое [выражение](/plugins/hh-geminio/docs/ru/EXPRESSIONS.md), обычно - относительный путь от корня папки с рецептом до нужного ftl-шаблона
- `to` -- текстовое [выражение](/plugins/hh-geminio/docs/ru/EXPRESSIONS.md), путь до целевого файла с кодом

Команда берёт freemarker-ный ftl-файл, путь до которого вычисляется из [выражение](/plugins/hh-geminio/docs/ru/EXPRESSIONS.md) `from`,
пробрасывает в него параметры, генерирует код, и помещает результат в файл, путь которого указан
в [выражение](/plugins/hh-geminio/docs/ru/EXPRESSIONS.md) `to`.

--- 

[Обратно к списку команд](/plugins/hh-geminio/docs/ru/recipe_content/RECIPE.md)