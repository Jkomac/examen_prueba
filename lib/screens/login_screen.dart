// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sort_child_properties_last, use_build_context_synchronously, use_key_in_widget_constructors
import 'package:examen_prueba/preferences/preferences.dart';
import 'package:examen_prueba/ui/input_decorations.dart';
import 'package:examen_prueba/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

/*
Clase que representa la ventana del Login donde se validan los datos para ser persistidos en caso deseado
*/

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250), // Espacio de separacion entre el CardContainer - margen superior de la pantalla
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text('Login', style: Theme.of(context).textTheme.headlineLarge),
                    SizedBox(height: 30),
                    ChangeNotifierProvider( // Gestión del estado permitiendo al child escuchar y reaccionar a los cambios hechos
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm()
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction, // Validacion ante interaccion del usuario
        child: Column(
          children: [
            TextFormField( // CAMPO EMAIL
              initialValue: Preferences.email,
              autocorrect: false, // Autocorrector desactivado
              keyboardType: TextInputType.emailAddress, // Teclado optimo para emails
              decoration: InputDecorations.authInputDecoration(
                hintText: 'example@gmail.com', 
                labelText: 'Email',
                prefixIcon: Icons.alternate_email
              ),
              onChanged: (value) {
                loginForm.email = value; // Cambio del estado de la variable email
              },
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value!) // Comprobacion del email con el patron
                  ? null // Si es correcto, no se notifica nada
                  : 'Incorrect Email Address'; // Si es incorrecto, se notifica al usuario
              },
            ),
            SizedBox(height: 30),
            TextFormField( // CAMPO CONTRASENYA
              initialValue: Preferences.password,
              autocorrect: false,
              obscureText: true, // Ocultar los caracteres de texto
              keyboardType: TextInputType.visiblePassword, // Teclado optimo para contrasenyas
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****', 
                labelText: 'Password',
                prefixIcon: Icons.lock_open
              ),
              onChanged: (value) {
                loginForm.password = value; // Cambio del estado de la variable password
              },
              validator: (value) {
                return (value != null && value.length >= 5)
                  ? null
                  : 'Password must have at least 5 characters';
              },
            ),
            SizedBox(height: 30),
            SizedBox( // CHECKBOX REMEMBER PASSWORD
              height: 20,
              child: Row(
                children: [
                  Checkbox(
                    value: Preferences.remember,
                    fillColor: MaterialStateColor.resolveWith((states) => Color.fromRGBO(29, 233, 182, 1)),
                    checkColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        Preferences.remember = value!;
                        loginForm.remember = Preferences.remember;
                        print(value);
                      });
                    },
                  ),
                  Text(
                    'Remember me', 
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            MaterialButton( // BOTON INICIAR SESION
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              disabledColor: Colors.blueGrey[100],
              elevation: 0,
              color: Colors.tealAccent[400],
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                child: Text(
                  loginForm.isLoading ? 'Wait' : 'Log in',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onPressed: loginForm.isLoading
                ? null
                : () async {
                  // Deshabilitacion del teclado
                  FocusScope.of(context).unfocus();

                  if (loginForm.isValidForm()){

                    if (loginForm.remember){ // Persistencia de los datos al hacer el Login
                      Preferences.email = loginForm.email;
                      Preferences.password = loginForm.password;
                      Preferences.remember = loginForm.remember;
                    } else{ // No persistencia de los datos al hacer el Login
                      Preferences.email = "";
                      Preferences.password = "";
                      Preferences.remember = false;
                    }

                    loginForm.isLoading = true;
                    // Simulacion de peticion
                    await Future.delayed(Duration(seconds: 2));
                    loginForm.isLoading = false;
                    Navigator.pushReplacementNamed(context, 'home');
                  }
                }
            ),
            Container( // FORGOT PASSWORD?
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => print('Forgot Password?... Again?'), 
                child: Text(
                  'Forgot Password?', 
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}