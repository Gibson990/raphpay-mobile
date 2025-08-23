# Project Setup Guide - RaphPay Mobile App

## 🚀 Initial Setup

This guide will walk you through setting up the RaphPay Flutter project from scratch.

## 📋 Prerequisites

Before starting, ensure you have:

- [ ] **Flutter SDK** (3.x or higher)
- [ ] **Dart SDK** (3.x or higher)
- [ ] **Android Studio** or **VS Code** with Flutter extensions
- [ ] **Git** for version control
- [ ] **Android Emulator** or **iOS Simulator** (or physical device)

## 🔧 Step 1: Verify Flutter Installation

```bash
# Check Flutter version
flutter --version

# Check Flutter doctor for any issues
flutter doctor

# Verify all components are properly installed
flutter doctor -v
```

**Expected Output**: All checks should pass with green checkmarks.

## 🏗️ Step 2: Create Flutter Project

```bash
# Navigate to your desired directory
cd /path/to/your/workspace

# Create new Flutter project
flutter create raphpay_mobile

# Navigate into project directory
cd raphpay_mobile
```

## 📁 Step 3: Set Up Project Structure

Create the following folder structure in the `lib/` directory:

```bash
# Create core directories
mkdir -p lib/core/constants
mkdir -p lib/core/errors
mkdir -p lib/core/utils
mkdir -p lib/core/theme

# Create data layer directories
mkdir -p lib/data/datasources
mkdir -p lib/data/models
mkdir -p lib/data/repositories

# Create domain layer directories
mkdir -p lib/domain/entities
mkdir -p lib/domain/repositories
mkdir -p lib/domain/usecases

# Create presentation layer directories
mkdir -p lib/presentation/providers
mkdir -p lib/presentation/screens
mkdir -p lib/presentation/widgets
mkdir -p lib/presentation/navigation

# Create shared directories
mkdir -p lib/shared/components
mkdir -p lib/shared/mixins

# Create test directories
mkdir -p test/unit
mkdir -p test/widget
mkdir -p test/integration
```

## 📦 Step 4: Configure Dependencies

Update your `pubspec.yaml` file with the following dependencies:

```yaml
name: raphpay_mobile
description: A modern Flutter fintech application
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.1.1
  
  # UI Components
  cupertino_icons: ^1.0.2
  
  # HTTP & API
  http: ^1.1.0
  dio: ^5.3.2
  
  # Local Storage
  shared_preferences: ^2.2.2
  sqflite: ^2.3.0
  
  # Navigation
  go_router: ^12.1.3
  
  # Utilities
  intl: ^0.18.1
  uuid: ^4.2.1
  
  # Security
  crypto: ^3.0.3
  local_auth: ^2.1.6
  
  # UI Enhancements
  flutter_svg: ^2.0.9
  cached_network_image: ^3.3.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Code Quality
  flutter_lints: ^3.0.0
  
  # Testing
  mockito: ^5.4.2
  build_runner: ^2.4.7
  
  # Integration Testing
  integration_test:
    sdk: flutter
  
  flutter_launcher_icons: ^0.13.1

flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
    - assets/icons/
    - assets/fonts/
  
  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Medium.ttf
          weight: 500
        - asset: assets/fonts/Inter-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Inter-Bold.ttf
          weight: 700
```

## 🔧 Step 5: Install Dependencies

```bash
# Get all dependencies
flutter pub get

# Verify no conflicts
flutter pub deps
```

## ⚙️ Step 6: Configure Linting

Create `.analysis_options.yaml` in the root directory:

```yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    # Code style
    prefer_const_constructors: true
    prefer_const_literals_to_create_immutables: true
    prefer_const_declarations: true
    avoid_print: true
    prefer_single_quotes: true
    
    # Performance
    avoid_unnecessary_containers: true
    prefer_sized_box_for_whitespace: true
    
    # Maintainability
    prefer_final_fields: true
    prefer_final_locals: true
    avoid_void_async: true
    
    # Error handling
    avoid_catches_without_on_clauses: true
    prefer_typing_uninitialized_variables: true

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
  errors:
    invalid_annotation_target: ignore
```

## 🎨 Step 7: Set Up Basic Theme

Create `lib/core/theme/app_theme.dart`:

```dart
import 'package:flutter/material.dart';

class AppTheme {
  // Color palette
  static const Color primaryColor = Color(0xFF2563EB);
  static const Color secondaryColor = Color(0xFF64748B);
  static const Color accentColor = Color(0xFF10B981);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color successColor = Color(0xFF10B981);
  
  // Background colors
  static const Color backgroundColor = Color(0xFFF8FAFC);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color cardColor = Color(0xFFFFFFFF);
  
  // Text colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);
  
  // Border colors
  static const Color borderColor = Color(0xFFE2E8F0);
  
  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      background: backgroundColor,
      error: errorColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: surfaceColor,
      foregroundColor: textPrimary,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: textSecondary,
      ),
    ),
  );
}
```

## 🧪 Step 8: Set Up Basic Testing

Create `test/unit/core/theme/app_theme_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:raphpay_mobile/core/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    test('should return light theme', () {
      final theme = AppTheme.lightTheme;
      expect(theme, isA<ThemeData>());
      expect(theme.brightness, equals(Brightness.light));
    });
    
    test('should have correct primary color', () {
      final theme = AppTheme.lightTheme;
      expect(theme.colorScheme.primary, equals(AppTheme.primaryColor));
    });
  });
}
```

## 🚀 Step 9: Create Basic App Structure

Create `lib/main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raphpay_mobile/core/theme/app_theme.dart';
import 'package:raphpay_mobile/presentation/providers/app_provider.dart';

void main() {
  runApp(const RaphPayApp());
}

class RaphPayApp extends StatelessWidget {
  const RaphPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        title: 'RaphPay',
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'RaphPay',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Your Financial Future Starts Here',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🔍 Step 10: Verify Setup

```bash
# Run the app
flutter run

# Run tests
flutter test

# Check for any issues
flutter analyze
```

## 📝 Step 11: Initial Commit

```bash
# Initialize git repository
git init

# Add all files
git add .

# Initial commit
git commit -m "Initial project setup with clean architecture"

# Create .gitignore if not exists
echo "*.iml
.gradle
/local.properties
/.idea/caches
/.idea/libraries
/.idea/modules.xml
/.idea/workspace.xml
/.idea/navEditor.xml
/.idea/assetWizardSettings.xml
.DS_Store
/build
/captures
.externalNativeBuild
.cxx
local.properties" > .gitignore
```

## ✅ Verification Checklist

- [ ] Flutter project created successfully
- [ ] All dependencies installed without conflicts
- [ ] Project structure created
- [ ] Basic theme implemented
- [ ] App runs without errors
- [ ] Tests pass
- [ ] Linting configured
- [ ] Git repository initialized

## 🚧 Troubleshooting

### Common Issues:

1. **Flutter version conflicts**: Ensure you're using Flutter 3.x
2. **Dependency conflicts**: Run `flutter clean` then `flutter pub get`
3. **Android SDK issues**: Check `flutter doctor` output
4. **iOS simulator issues**: Ensure Xcode is properly configured

### Getting Help:

- Check Flutter documentation
- Review error messages carefully
- Use `flutter doctor -v` for detailed diagnostics
- Check GitHub issues for known problems

## 🎯 Next Steps

After completing this setup:

1. Review the [Architecture Guide](./ARCHITECTURE.md)
2. Check the [Sprint Backlog](./SPRINT_BACKLOG.md)
3. Start implementing core entities
4. Set up Provider state management
5. Begin UI development

---

**Congratulations!** 🎉 Your RaphPay Flutter project is now set up with clean architecture principles.
