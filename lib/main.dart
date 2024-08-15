import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/pages/login_screen.dart';
import 'package:provider_flutter/provider/auth_provider.dart';
import 'package:provider_flutter/provider/count_provider.dart';
import 'package:provider_flutter/provider/example_one_provider.dart';
import 'package:provider_flutter/provider/theme_changer_provider.dart';
import 'provider/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider())
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
              themeMode: themeChanger.themeMode,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.red,
                primaryColor: Colors.purple,
                iconTheme: const IconThemeData(color: Colors.red),
                appBarTheme: const AppBarTheme(backgroundColor: Colors.purple),
              ),
              home: const LoginScreen());
        }));
  }
}
