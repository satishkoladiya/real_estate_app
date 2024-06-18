import 'package:flutter/material.dart';

import 'custom_bottom_bar.dart';

class ApplicationScaffold extends StatelessWidget {
  const ApplicationScaffold({
    super.key,
    required this.child,
    required this.destinations,
    required this.selected,
    required this.onChanged,
  });

  final List<CustomBottomBarItem> destinations;
  final CustomBottomBarItem selected;
  final ValueChanged<CustomBottomBarItem> onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: child),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: CustomBottomBar(
                onChanged: onChanged,
                destinations: destinations,
                selected: selected,
              ),
            ),
          )
        ],
      ),
    );
  }
}
