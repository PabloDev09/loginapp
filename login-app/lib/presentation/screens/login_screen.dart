import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loginapp/config/themes/app_theme.dart';
import 'package:loginapp/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: true);
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (loginProvider.logged) {
                  context.push('/home');
                } else {
                  showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('No tiene ninguna cuenta iniciada'),
                            actions: [
                              FilledButton
                              (
                                child: const Text("Aceptar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                }
              },
              icon: const Icon(Icons.person),
            )
          ],
          centerTitle: true,
          title: const Text('Login'),
        ),
        body: Center(
          child: SizedBox(
            height: screenHeight * 0.35,
            width: screenWidth * 0.5,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text(
                      'Iniciar sesión',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:  Color.fromARGB(199, 82, 12, 128),
                        fontSize: 30
                      ),
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(labelText: 'Usuario'),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Contraseña'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FilledButton(
                      onPressed: () {
                        final valueUsername = usernameController.text;
                        final valuePassUsername = passwordController.text;
                      
                        if (loginProvider.checkIsCorrectValues(valueUsername.trim(), valuePassUsername.trim())) 
                        {
                          usernameController.clear();
                          passwordController.clear();
                          context.push('/home');
                        } else {
                          showDialog(    
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text('Los valores introducidos no son correctos'),
                                actions: [
                                  FilledButton
                                  (
                                    child: const Text("Aceptar"),
                                    onPressed: () {
                                      usernameController.clear();
                                      passwordController.clear();
                                      context.pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
