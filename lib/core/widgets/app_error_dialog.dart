import 'package:flutter/material.dart';

import '../helpers/extensions.dart';
import '../theming/styles.dart';

class AppErrorDialog extends StatelessWidget {
  final String errorMessage;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const AppErrorDialog({
    super.key,
    required this.errorMessage,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        errorMessage,
        style: TextStyles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: onButtonPressed ?? () => context.pop(),
          child: Text(
            buttonText ?? 'Got it',
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    );
  }

  /// Helper method to show the error dialog
  static void show(
    BuildContext context,
    String errorMessage, {
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) => AppErrorDialog(
        errorMessage: errorMessage,
        buttonText: buttonText,
        onButtonPressed: onButtonPressed,
      ),
    );
  }
}
