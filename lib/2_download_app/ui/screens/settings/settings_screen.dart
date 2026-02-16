import 'package:flutter/material.dart';

import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeColorProvider.instance,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),

            SizedBox(height: 50),

            Text(
              "Theme",
              style: AppTextStyles.label.copyWith(color: AppColors.textLight),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ThemeColor.values
                  .map(
                    (theme) => ThemeColorButton(
                      themeColor: theme,
                      isSelected:
                          theme ==
                          ThemeColorProvider.instance.currentThemeColor,
                      onTap: (value) {
                        ThemeColorProvider.instance.updateTheme(value);
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
