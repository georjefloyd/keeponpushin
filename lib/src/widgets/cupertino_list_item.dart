import 'package:flutter/cupertino.dart';

/// A reusable Cupertino-style list item.
final class CupertinoListItem extends StatelessWidget {
  const CupertinoListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final row = Row(
      children: [
        if (leading != null) ...[leading!, const SizedBox(width: 12)],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 17)),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(fontSize: 13, color: CupertinoColors.systemGrey),
                ),
            ],
          ),
        ),
        if (trailing != null) trailing!,
        if (onTap != null)
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(CupertinoIcons.chevron_right, size: 18, color: CupertinoColors.systemGrey3),
          ),
      ],
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).barBackgroundColor,
            border: Border(
              bottom: BorderSide(color: CupertinoColors.systemGrey5, width: 0.5),
            ),
          ),
          child: row,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).barBackgroundColor,
        border: Border(
          bottom: BorderSide(color: CupertinoColors.systemGrey5, width: 0.5),
        ),
      ),
      child: row,
    );
  }
}
