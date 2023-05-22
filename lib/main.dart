// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:examen_prueba/preferences/preferences.dart';
import 'package:examen_prueba/providers/login_form_provider.dart';
import 'package:examen_prueba/screens/detail_screen.dart';
import 'package:examen_prueba/screens/home_screen.dart';
import 'package:examen_prueba/screens/login_screen.dart';
import 'package:examen_prueba/screens/new_user_screen.dart';
import 'package:examen_prueba/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  // Para poder ejecutar metodos async antes de ejecutar el runApp()
  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserService(),
    ),
  ], child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users App',
      initialRoute: 'login',
      routes: {
        'login' : (_) => LoginScreen(),
        'home' : (_) => HomeScreen(),
        'newUser' : (_) => NewUserScreen(),
        'detail' : (_) => DetailScreen(),
      },
      theme: ThemeData.light().copyWith( // Personaliza y ajusta fácilmente los temas sin reescribir todo el objeto completo.
        scaffoldBackgroundColor: Colors.grey[300], // Color del fondo
        appBarTheme: AppBarTheme( // Aspectos sobre el AppBar de la App
        centerTitle: true,
          color: Colors.tealAccent[400], // Color fondo
          elevation: 0,
          foregroundColor: Colors.black87,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData( // Aspectos sobre los FloatingButtons
          backgroundColor: Colors.tealAccent[400],
          elevation: 10,
          foregroundColor: Colors.black87 // Color del icono/fuente
        ),
      ),
    );
  }
}