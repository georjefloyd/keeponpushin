import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A reusable card widget with Cupertino styling.
final class CupertinoCard extends StatelessWidget {
  const CupertinoCard({
    super.key,
    required this.child,
    this.gradient,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  final Widget child;
  final Gradient? gradient;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? CupertinoTheme.of(context).primaryColor : null,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: card,
      );
    }

    return card;
  }
}
