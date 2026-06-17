# ios_placeholder_app

Flutter приложение-плейсхолдер с нативными iOS компонентами (Cupertino).

## Стек

- **Flutter** 3.16+
- **Cupertino** (system iOS design)
- **Codemagic** CI/CD
- **AltStore** sideloading

## Сборка на Codemagic

1. Подключи репозиторий в Codemagic
2. Настрой iOS code signing (Automated / Manual)
3. Pipeline соберёт `.ipa` и зальёт как артефакт

## Установка через AltStore

1. Скачай `.ipa` из артефактов Codemagic
2. Открой AltStore → My Apps → `+` → выбери `.ipa`
3. Готово, приложение на устройстве

## Структура

```
lib/
├── main.dart
├── ios_placeholder_app.dart       # barrel export
└── src/
    ├── app.dart                    # CupertinoApp + TabBar
    ├── screens/
    │   ├── home_screen.dart        # Главная
    │   ├── settings_screen.dart    # Настройки
    │   └── profile_screen.dart     # Профиль
    ├── widgets/
    │   ├── cupertino_card.dart     # Переиспользуемая карточка
    │   └── cupertino_list_item.dart
    └── theme/
        └── app_theme.dart          # Тема/цвета
```
