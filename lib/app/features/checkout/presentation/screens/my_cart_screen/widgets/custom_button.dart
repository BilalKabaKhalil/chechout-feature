import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../extension/theme_extension.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final bool isLoading;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        fixedSize: const Size.fromHeight(60),
      ),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: context.textStyle.font22W500,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
