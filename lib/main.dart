import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:raphpay/core/theme/app_theme.dart';
import 'package:raphpay/presentation/providers/app_provider.dart';
import 'package:raphpay/presentation/screens/home_screen.dart';
import 'package:raphpay/core/constants/app_constants.dart';

void main() {
  // Set system UI overlay style for the entire app
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  
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
      child: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return MaterialApp(
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appProvider.currentTheme == 'dark' 
                ? ThemeMode.dark 
                : ThemeMode.light,
            home: const HomeScreen(), // Using HomeScreen for testing
            debugShowCheckedModeBanner: false,
            // Global error handling
            builder: (context, child) {
              return Consumer<AppProvider>(
                builder: (context, appProvider, child) {
                  if (appProvider.hasError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(appProvider.errorMessage ?? 'An error occurred'),
                          backgroundColor: AppTheme.errorColor,
                          behavior: SnackBarBehavior.floating,
                          action: SnackBarAction(
                            label: 'Dismiss',
                            textColor: Colors.white,
                            onPressed: () => appProvider.clearError(),
                          ),
                        ),
                      );
                    });
                  }
                  return child!;
                },
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
