import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate_app/config/theme.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.destinations,
    required this.selected,
    required this.onChanged,
  });

  final List<CustomBottomBarItem> destinations;
  final CustomBottomBarItem selected;
  final ValueChanged<CustomBottomBarItem> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.darkLess,
        borderRadius: BorderRadius.circular(64),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: destinations.map((i) {
          return AnimatedContainer(
            duration: 300.ms,
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              color:
                  i.icon == selected.icon ? AppTheme.gold : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: IconButton(
              onPressed: () => onChanged(i),
              style: IconButton.styleFrom(
                backgroundColor:
                    i.icon == selected.icon ? null : AppTheme.darken,
              ),
              icon: AnimatedScale(
                duration: 300.ms,
                curve: Curves.easeOutCubic,
                scale: i.icon == selected.icon ? 1.2 : 0.9,
                child: Icon(i.icon, color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    ).animate(delay: 3.seconds).fadeIn(duration: 500.ms).slideY(begin: 50);
  }
}

class CustomBottomBarItem {
  final IconData icon;

  const CustomBottomBarItem(this.icon);
}
