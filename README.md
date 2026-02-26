# Финальный проект DevOps: Docker

## Описание проекта
Развертывание инфраструктуры разработки на Docker-контейнерах с централизованным управлением пользователями через LDAP.

## Состав инфраструктуры
- **LDAP сервер** (OpenLDAP) — управление пользователями
- **phpLDAPadmin** — веб-интерфейс для LDAP
- **GitLab** — система управления репозиториями
- **Rocket.Chat** — корпоративный мессенджер
- **MongoDB** — база данных для Rocket.Chat

## Запуск проекта
```bash
#docker-compose up -d


Доступ к сервисам
Сервис       |       	URL              |         	Логин	Пароль
             |                         |                                  
phpLDAPadmin |	http://localhost:8080  |	cn=admin,dc=ignatenko,dc=ru	admin
GitLab	     |  http://localhost:8081	 |  iivanov	password123
Rocket.Chat	 |  http://localhost:3000	 |  iivanov	password123


## Учетные записи

- Администратор LDAP: cn=admin,dc=ignatenko,dc=ru / admin
- Тестовый пользователь: iivanov / password123

## Выполненные задачи

✅ Развернут LDAP-сервер
✅ Добавлен веб-интерфейс phpLDAPadmin
✅ Установлен и настроен GitLab
✅ Выполнена интеграция GitLab с LDAP
✅ Создан пользователь в LDAP
✅ Установлен Rocket.Chat с MongoDB
✅ Выполнена интеграция Rocket.Chat с LDAP
