import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import 'config/theme.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'widgets/application_scaffold.dart';
import 'widgets/custom_bottom_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = false;
  Animate.defaultCurve = Curves.easeOutCubic;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CustomBottomBarItem selected = const CustomBottomBarItem(IconlyBold.home);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tech Task',
        theme: AppTheme.lightTheme,
        home: ApplicationScaffold(
          destinations: const [
            CustomBottomBarItem(IconlyBold.search),
            CustomBottomBarItem(IconlyBold.chat),
            CustomBottomBarItem(IconlyBold.home),
            CustomBottomBarItem(IconlyBold.heart),
            CustomBottomBarItem(IconlyBold.profile),
          ],
          selected: selected,
          onChanged: (s) => setState(() => selected = s),
          child: PageTransitionSwitcher(
            reverse: [IconlyBold.search].contains(selected.icon),
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: selected.icon == IconlyBold.search
                ? const MapScreen()
                : selected.icon == IconlyBold.home
                    ? const HomeScreen()
                    : const Scaffold(),
          ),
        ),
      ),
    );
  }
}
