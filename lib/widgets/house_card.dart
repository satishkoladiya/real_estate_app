import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:real_estate_app/config/assets.dart';
import 'package:real_estate_app/config/theme.dart';

class HouseCard extends StatelessWidget {
  const HouseCard({
    super.key,
    required this.image,
    required this.label,
    this.type = HouseCardType.small,
    this.height = 200,
  });

  final IMG image;
  final String label;
  final HouseCardType type;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        image: DecorationImage(
          image: AssetImage(image.path),
          fit: BoxFit.cover,
        ),
      ),
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SlideButton(
            label: label,
            pad: type == HouseCardType.small ? 8 : 16,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class SlideButton extends StatelessWidget {
  const SlideButton({super.key, required this.pad, required this.label});

  final double pad;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMinInteractiveDimension,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pad),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    color: Colors.white24,
                  ),
                ),
              ).animate(delay: 1800.ms).fadeIn(duration: 1.seconds),
            ),
            Align(
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
            )
                .animate(delay: 1700.ms)
                .fadeIn(duration: 1.seconds)
                .slideX(begin: -5),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                color: AppTheme.darken,
                icon: const Icon(
                  IconlyLight.arrow_right_2,
                  size: 12,
                ),
                style: IconButton.styleFrom(backgroundColor: Colors.white),
              ),
            ).animate(delay: 1600.ms).slideX(begin: -10, duration: 1.seconds)
          ],
        ),
      ),
    );
  }
}

enum HouseCardType { large, small }
