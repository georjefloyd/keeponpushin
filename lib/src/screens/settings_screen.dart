import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';

final class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  bool _analytics = false;
  double _cacheSize = 24.5;

  String _selectedLanguage = 'Русский';

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Настройки'),
      largeTitle: Text('Настройки'),
    ),
    child: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          const SizedBox(height: 8),

          // General settings
          CupertinoListSection.insetGrouped(
            header: const Text('ОСНОВНЫЕ'),
            children: [
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.bell_fill, color: CupertinoColors.systemRed),
                title: const Text('Уведомления'),
                trailing: CupertinoSwitch(
                  value: _notificationsEnabled,
                  onChanged: (v) => setState(() => _notificationsEnabled = v),
                ),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.moon_fill, color: CupertinoColors.systemIndigo),
                title: const Text('Тёмная тема'),
                trailing: CupertinoSwitch(
                  value: _darkMode,
                  onChanged: (v) => setState(() => _darkMode = v),
                ),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.chart_bar_fill, color: CupertinoColors.systemOrange),
                title: const Text('Аналитика'),
                trailing: CupertinoSwitch(
                  value: _analytics,
                  onChanged: (v) => setState(() => _analytics = v),
                ),
              ),
            ],
          ),

          // Language picker
          CupertinoListSection.insetGrouped(
            header: const Text('РЕГИОН'),
            children: [
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.globe, color: CupertinoColors.systemTeal),
                title: const Text('Язык'),
                additionalInfo: Text(_selectedLanguage, style: const TextStyle(color: CupertinoColors.systemGrey)),
                trailing: const CupertinoListTileChevron(),
                onTap: () => _showLanguagePicker(context),
              ),
            ],
          ),

          // Storage
          CupertinoListSection.insetGrouped(
            header: const Text('ДАННЫЕ'),
            children: [
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.archivebox_fill, color: CupertinoColors.systemGrey),
                title: const Text('Кэш'),
                additionalInfo: Text(
                  '${_cacheSize.toStringAsFixed(1)} MB',
                  style: const TextStyle(color: CupertinoColors.systemGrey),
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text('Очистить', style: TextStyle(color: CupertinoColors.systemRed, fontSize: 14)),
                  onPressed: () => setState(() => _cacheSize = 0),
                ),
              ),
            ],
          ),

          // About
          CupertinoListSection.insetGrouped(
            header: const Text('О ПРИЛОЖЕНИИ'),
            children: [
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.info_circle_fill, color: CupertinoColors.systemBlue),
                title: const Text('Версия'),
                additionalInfo: const Text('1.0.0', style: TextStyle(color: CupertinoColors.systemGrey)),
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.doc_text_fill, color: CupertinoColors.systemGrey),
                title: const Text('Лицензия'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    ),
  );

  void _showLanguagePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Выберите язык'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              setState(() => _selectedLanguage = 'Русский');
              Navigator.pop(context);
            },
            child: const Text('Русский'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              setState(() => _selectedLanguage = 'English');
              Navigator.pop(context);
            },
            child: const Text('English'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              setState(() => _selectedLanguage = 'Español');
              Navigator.pop(context);
            },
            child: const Text('Español'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
      ),
    );
  }
}
