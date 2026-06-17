import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Card;
import '../theme/app_theme.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Главная'),
      largeTitle: Text('Плейсхолдер'),
      trailing: Icon(CupertinoIcons.bell),
    ),
    child: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          const SizedBox(height: 8),

          // Hero card
          CupertinoCard(
            gradient: AppTheme.sunsetGradient,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.flame_fill, color: CupertinoColors.systemYellow, size: 22),
                    SizedBox(width: 8),
                    Text(
                      'iOS Плейсхолдер',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Готов к сборке на Codemagic и установке через AltStore.',
                  style: TextStyle(fontSize: 14, color: CupertinoColors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Quick actions
          const Text(
            'Быстрые действия',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppTheme.textPrimary),
          ),
          const SizedBox(height: 10),

          CupertinoListSection.insetGrouped(
            children: [
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.wrench_fill, color: CupertinoColors.systemBlue),
                title: const Text('Сборка'),
                subtitle: const Text('Codemagic CI/CD pipeline'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {},
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.cloud_download_fill, color: CupertinoColors.systemGreen),
                title: const Text('Установка'),
                subtitle: const Text('AltStore sideloading'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {},
              ),
              CupertinoListTile.notched(
                leading: const Icon(CupertinoIcons.checkmark_seal_fill, color: CupertinoColors.systemPurple),
                title: const Text('Тестирование'),
                subtitle: const Text('TestFlight / устройство'),
                trailing: const CupertinoListTileChevron(),
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Activity slider
          const Text(
            'Прогресс',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppTheme.textPrimary),
          ),
          const SizedBox(height: 10),

          CupertinoCard(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Готовность сборки', style: AppTheme.bodyStyle),
                    Text('80%', style: AppTheme.bodyStyle.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 8),
                const CupertinoSlider(
                  value: 0.8,
                  max: 1.0,
                  min: 0.0,
                  onChanged: null,
                ),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Версия', style: AppTheme.bodyStyle),
                    Text(
                      '1.0.0 (build 1)',
                      style: AppTheme.bodyStyle.copyWith(color: CupertinoColors.systemGrey),
                    ),
                  ],
                ),
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Цель', style: AppTheme.bodyStyle),
                    Text('iOS / IPA', style: AppTheme.bodyStyle.copyWith(color: CupertinoColors.systemGrey)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    ),
  );
}
