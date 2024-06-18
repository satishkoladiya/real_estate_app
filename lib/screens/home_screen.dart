import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:real_estate_app/config/assets.dart';
import 'package:real_estate_app/config/theme.dart';
import 'package:real_estate_app/widgets/counter_widget.dart';
import 'package:real_estate_app/widgets/house_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kToolbarHeight),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xffF8F8F8), Color(0xffffad8b1)],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      FilledButton.tonal(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              IconlyBold.location,
                              size: 16,
                              color: AppTheme.brown,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Saint Petersburg',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppTheme.brown),
                            )
                          ],
                        ),
                      ).animate().fadeIn(duration: 1.seconds, begin: .5).custom(
                            builder: (context, a, child) => Transform.translate(
                              offset: Offset(a, 0),
                              child:
                                  child.animate().fadeIn(duration: 1.seconds),
                            ),
                            begin: -20,
                            end: 0,
                          ),
                      const Spacer(),
                      Container(
                        height: 48,
                        width: 48,
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: AppTheme.gold,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset('assets/img/avatar.png'),
                        ),
                      )
                          .animate()
                          .fadeIn(
                            duration: 1.seconds,
                            begin: .5,
                            curve: Curves.easeOutCubic,
                          )
                          .scale()
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Hi, Marina',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: AppTheme.brown),
                                )
                                    .animate(delay: 500.ms)
                                    .fadeIn(duration: 1.seconds)
                                    .slideY(begin: .5),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'let\'s select your',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: AppTheme.darken,
                                          fontWeight: FontWeight.w400),
                                )
                                    .animate(delay: 800.ms)
                                    .fadeIn(duration: 1.seconds)
                                    .slideY(begin: .5),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'perfect place',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: AppTheme.darken,
                                          fontWeight: FontWeight.w400),
                                )
                                    .animate(delay: 1.seconds)
                                    .fadeIn(duration: 1.seconds)
                                    .slideY(begin: .5),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return CounterWidget(
                                          size: constraints.maxWidth,
                                          label: 'BUY',
                                          count: 1034,
                                          color: AppTheme.gold,
                                          textColor: AppTheme.lighten,
                                          shape: BoxShape.circle,
                                        );
                                      },
                                    )
                                        .animate(delay: 1000.ms)
                                        .fadeIn(duration: 1.seconds)
                                        .slideY(begin: 0.3)
                                        .scale(),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return CounterWidget(
                                          size: constraints.maxWidth,
                                          label: 'RENT',
                                          count: 2212,
                                          color: AppTheme.lighten,
                                          textColor: AppTheme.brown,
                                        )
                                            .animate(delay: 1000.ms)
                                            .fadeIn(duration: 1.seconds)
                                            .slideY(begin: 0.3)
                                            .scale();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        )
                            .animate(
                                adapter:
                                    ScrollAdapter(_scrollController, end: 400))
                            .fadeOut(begin: 1)
                            .desaturate()
                            .flipV(begin: 0, end: -0.5)
                            .moveY(end: -10),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: const Column(
                            children: [
                              HouseCard(
                                label: 'Gladkova St., 25',
                                image: ImageAssets.room1,
                                type: HouseCardType.large,
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: HouseCard(
                                      label: 'Monie 007',
                                      image: ImageAssets.room5,
                                      height: 400,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        HouseCard(
                                          label: 'Point Ave.',
                                          image: ImageAssets.room4,
                                        ),
                                        SizedBox(height: 8),
                                        HouseCard(
                                          label: 'Point Ave.',
                                          image: ImageAssets.room2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 100),
                            ],
                          ),
                        ).animate(delay: 1400.ms).fadeIn().slideY(begin: .5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
