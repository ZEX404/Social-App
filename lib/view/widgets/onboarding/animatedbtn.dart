import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../core/constants/colors.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController, required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width / 1.8,
        child: Stack(
          children: [
            RiveAnimation.asset(
              'assets/animations/button.riv',
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.arrow_right,
                    color: AppColors.kPrimaryColor,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text("Join Now",
                      style: Theme.of(context).textTheme.displayLarge!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
