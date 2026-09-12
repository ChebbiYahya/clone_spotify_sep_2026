---
name: flutter-clean-theme
description: Build Flutter screens using the project's centralized AppTheme/TColors style, clean feature folders, and small test_theme validation widgets.
---

# Flutter Clean Theme

Use this skill when working on a Flutter project that should follow the theme and organization style from `clone_spotify_sep_2026`.

The expected result is a Flutter app with:

- a centralized theme in `lib/utils/themes`;
- color constants in `lib/utils/constants/colors.dart`;
- custom Material component themes split by widget type;
- feature code organized with `screens`, `controllers`, and `models`;
- simple visual test screens similar to `lib/test_theme`.

## Project Shape

Prefer this structure for new screens and features:

```text
lib/
  main.dart
  features/
    feature_name/
      screens/
        feature_name_screen.dart
      controllers/
        feature_name_controller.dart
      models/
        feature_name_model.dart
      widgets/
        feature_name_card.dart
  test_theme/
    test_button.dart
    test_text.dart
    test_formfield.dart
  utils/
    constants/
      colors.dart
      api_constant.dart
    themes/
      theme.dart
      custom_themes/
        appbar_theme.dart
        bottom_sheet_theme.dart
        checkbox_theme.dart
        chip_theme.dart
        dialog_theme.dart
        elevated_button_theme.dart
        outlined_button_theme.dart
        text_button_theme.dart
        text_theme.dart
        textformfield_theme.dart
```

For a small training project, keeping `test_theme/` directly under `lib/` is acceptable. For a production app, keep feature-specific UI under `features/<feature>/widgets`.

## Theme Rules

Keep design tokens centralized:

- Put reusable colors in `TColors` with a private constructor: `TColors._();`.
- Put global light/dark themes in `AppTheme.lightTheme` and `AppTheme.darkTheme`.
- Use `Theme.of(context)` inside screens and widgets instead of hardcoding text styles or component colors.
- Add each Material component theme in a separate file under `lib/utils/themes/custom_themes`.
- Import custom theme files into `lib/utils/themes/theme.dart`, then register them in `ThemeData`.
- Preserve Material 3 with `useMaterial3: true`.
- Use the global font family from the theme, currently `Poppins`, when the target project has the font configured.

The theme entrypoint should look like this pattern:

```dart
class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: TColors.light,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: TColors.dark,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
```

In `main.dart`, wire both themes:

```dart
MaterialApp(
  title: 'App Name',
  themeMode: ThemeMode.system,
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  home: const HomeScreen(),
)
```

## Clean Feature Rules

For each feature:

- `screens/` contains pages and route-level widgets.
- `controllers/` contains state, `TextEditingController`, `GlobalKey<FormState>`, visibility flags, loading flags, and actions.
- `models/` contains data classes only.
- `widgets/` contains reusable UI fragments for that feature.

Keep screens focused on layout. Move business logic and mutable UI state into controllers when the screen starts to grow.

For simple training examples, a `StatefulWidget` can hold local form controllers, as in `TestFormField`. For reusable features, prefer a controller class:

```dart
class LoginController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordVisible = false;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
```

Models should be plain and serializable when needed:

```dart
class SongModel {
  const SongModel({
    required this.id,
    required this.title,
    required this.artist,
  });

  final String id;
  final String title;
  final String artist;
}
```

## Widget Style

When creating widgets:

- Prefer `const` constructors and `const` child widgets when possible.
- Use `Scaffold`, `AppBar`, `Padding`, `ListView`, `Column`, `Row`, and Material widgets that inherit the theme naturally.
- Do not override button/text/form styles in screens unless the screen truly needs a special variant.
- Use `copyWith` only for small contextual changes, for example changing one text color:

```dart
Text(
  'Title',
  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
        color: TColors.primary,
      ),
)
```

Use current theme brightness when choosing between light and dark container colors:

```dart
final isLight = Theme.of(context).brightness == Brightness.light;
final containerColor = isLight ? TColors.lightContainer : TColors.darkContainer;
```

## Test Theme Screens

For every new themed component, add or update a small visual test widget in `lib/test_theme`.

Follow this style:

- one file per component family, such as `test_button.dart` or `test_formfield.dart`;
- a `Scaffold` with an `AppBar`;
- enabled and disabled states when relevant;
- full-width and normal-size examples for buttons;
- validation success/error examples for forms;
- light/dark compatibility by relying on the app `themeMode`.

Example:

```dart
class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test des Boutons')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 20),
            const ElevatedButton(
              onPressed: null,
              child: Text('Disabled Elevated Button'),
            ),
          ],
        ),
      ),
    );
  }
}
```

Temporarily set `home:` in `main.dart` to a test widget while validating theme work. Restore the real home screen after validation.

## Implementation Checklist

When applying this style to another project:

1. Copy or recreate `TColors`.
2. Copy or recreate `AppTheme`.
3. Copy or recreate the files in `custom_themes`.
4. Register `theme` and `darkTheme` in `MaterialApp`.
5. Organize new features under `features/<feature>/screens`, `controllers`, `models`, and optional `widgets`.
6. Add a `test_theme` widget for every new theme family.
7. Run `flutter analyze`.
8. Run the app in light and dark mode and visually inspect the relevant `test_theme` screen.

## Naming Conventions

Use these naming patterns:

- colors class: `TColors`;
- app theme class: `AppTheme`;
- theme helper classes: `T<Component>NameTheme`, for example `TElevatedButtonTheme`;
- screens: `FeatureNameScreen`;
- controllers: `FeatureNameController`;
- models: `FeatureNameModel`;
- test widgets: `TestButton`, `TestText`, `TestFormField`.

Keep imports relative inside `lib/utils/themes`, matching the source project style:

```dart
import '../constants/colors.dart';
import 'custom_themes/elevated_button_theme.dart';
```

Inside feature files, use package imports when the target project already follows that convention.
