import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/auth/provider/auth_provider.dart';
import 'package:todo_app/auth/view/login_Screen.dart';
import 'package:todo_app/auth/view/signup_Screen.dart';
import 'package:todo_app/comman/app_theme.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/provider/theme_provide.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/screens/widget/edit%20_task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// FirebaseFirestore.instance.disableNetwork();
// FirebaseFirestore.instance.settings=const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvide()),
      ChangeNotifierProvider(create: (_) => TaskProvider()),
      ChangeNotifierProvider(create: (_) => LocalAuthProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Localizations Sample App',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(Provider.of<ThemeProvide>(context).localeCode),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: Provider.of<ThemeProvide>(context).themeMode,
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          SignupScreen.routeName: (_) => const SignupScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
          EditTask.routeName: (_) => const EditTask()
        },
        initialRoute: FirebaseAuth.instance.currentUser?.uid == null
            ? LoginScreen.routeName
            : HomeScreen.routeName);
  }
}
