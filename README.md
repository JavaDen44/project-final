## [REST API](http://localhost:8080/doc)

## Концепция:
- Spring Modulith
  - [Spring Modulith: достигли ли мы зрелости модульности](https://habr.com/ru/post/701984/)
  - [Introducing Spring Modulith](https://spring.io/blog/2022/10/21/introducing-spring-modulith)
  - [Spring Modulith - Reference documentation](https://docs.spring.io/spring-modulith/docs/current-SNAPSHOT/reference/html/)

```
  url: jdbc:postgresql://localhost:5432/jira
  username: jira
  password: JiraRush
```
- Есть 2 общие таблицы, на которых не fk
  - _Reference_ - справочник. Связь делаем по _code_ (по id нельзя, тк id привязано к окружению-конкретной базе)
  - _UserBelong_ - привязка юзеров с типом (owner, lead, ...) к объекту (таска, проект, спринт, ...). FK вручную будем проверять

## Аналоги
- https://java-source.net/open-source/issue-trackers

## Тестирование
- https://habr.com/ru/articles/259055/

Список выполненных задач:
- Разобраться со структурой проекта (onboarding)
- Удалить социальные сети: _vk_, _yandex_
- Вынести чувствительную информацию (логин, пароль БД, идентификаторы для OAuth регистрации/авторизации, настройки
   почты) в отдельный проперти файл. Значения этих проперти должны считываться при старте сервера из переменных
   окружения машины.

> Вся чусвительная ифомация вынесена в _./env.env_


- Переделать тесты так, чтоб во время тестов использовалась in memory БД (H2), а не PostgreSQL. Для этого нужно
   определить 2 бина, и выборка какой из них использовать должно определяться активным профилем Spring.

> Для тестов созданы проперти файлы для создания базы данных H2 _application-dev.yaml_
> и для предоставления заполнения тестовыми данными _application-test.yaml_


- Написать Dockerfile для основного сервера

- Написать docker-compose файл для запуска контейнера сервера вместе с БД и nginx. Для nginx используй конфиг-файл
   _config/nginx.conf_. При необходимости файл конфига можно редактировать.

> Для запуска приложения необходимо использовать команду:
>
> ```docker-compose up -d```
>
> Приложение станет доступно по адресу: http://localhost:8080