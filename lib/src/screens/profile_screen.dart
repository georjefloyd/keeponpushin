import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;
import '../theme/app_theme.dart';

final class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Профиль'),
      largeTitle: Text('Профиль'),
    ),
    child: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          const SizedBox(height: 8),

          // Avatar + name section
          Center(
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    gradient: AppTheme.sunsetGradient,
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: const Icon(CupertinoIcons.person_fill, color: CupertinoColors.white, size: 44),
                ),
                const SizedBox(height: 14),
                const Text(
                  'iOS Developer',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
                ),
                const SizedBox(height: 4),
                const Text(
                  'codemagic@altstore.io',
                  style: TextStyle(fontSize: 15, color: CupertinoColors.systemGrey),
                ),
                const SizedBox(height: 18),
                CupertinoButton.filled(
                  child: const Text('Изменить профиль'),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Account section
          CupertinoListSection.insetGrouped(
            header: const Text('АККАУНТ'),
            children: [
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.person_2_fill, color: CupertinoColors.systemBlue),
                title: const Text('Информация'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {},
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.lock_fill, color: CupertinoColors.systemGreen),
                title: const Text('Безопасность'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {},
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.creditcard_fill, color: CupertinoColors.systemOrange),
                title: const Text('Подписка'),
                additionalInfo: const Text('Free', style: TextStyle(color: CupertinoColors.systemGrey)),
                trailing: const CupertinoListTileChevron(),
                onTap: () {},
              ),
            ],
          ),

          // Build info
          CupertinoListSection.insetGrouped(
            header: const Text('СБОРКА'),
            children: [
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.hammer_fill, color: CupertinoColors.systemGrey),
                title: const Text('Codemagic'),
                subtitle: const Text('CI/CD pipeline'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {},
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.arrow_down_doc_fill, color: CupertinoColors.systemTeal),
                title: const Text('AltStore'),
                subtitle: const Text('Sideloading ready'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Sign out
          Center(
            child: CupertinoButton(
              child: const Text(
                'Выйти',
                style: TextStyle(color: CupertinoColors.systemRed),
              ),
              onPressed: () => _showSignOutDialog(context),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    ),
  );

  void _showSignOutDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Выйти?'),
        content: const Text('Вы уверены, что хотите выйти из аккаунта?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Отмена'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Выйти'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
