import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loginapp/config/themes/app_theme.dart';
import 'package:loginapp/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: true);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
          leading: const Icon(Icons.home),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Cerrar sesión'),
                      content: const Text('¿Estás seguro que quieres cerrar sesión?'),
                      actions: [
                        FilledButton(
                          child: const Text("No"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FilledButton(
                          child: const Text("Sí"),
                          onPressed: () {
                            loginProvider.logOut();
                            context.pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
        body: Center(
          child: SizedBox(
            width: screenWidth * 0.8,
            height: screenHeight * 0.8,
            child: Container(
              padding: const EdgeInsets.all(35),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              width: screenWidth * 0.9,
              child: Column(
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    'Información de la cuenta',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035, 
                      color: const Color.fromARGB(199, 82, 12, 128)
                    ),
                    )
                  ],),
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),   
                  const Divider(
                    color: const Color.fromARGB(199, 82, 12, 128),
                    thickness: 5,
                  ),
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${loginProvider.usuario['nombre']!} ${loginProvider.usuario['apellidos']!}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.025, 
                          ),
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          '${loginProvider.usuario['foto']!}',
                          width: screenWidth * 0.10,
                          height: screenWidth * 0.10, 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),   
                  Row(
                    children: [
                      Text('Curso: ${loginProvider.usuario['curso']}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.02
                      ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),   
                  Row(
                    children: [
                      Text('Telefono: ${loginProvider.usuario['telefono']}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.02
                      ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),   
                  Row(
                    children: [
                      Text('Correo: ${loginProvider.usuario['correo']}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.02
                      ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),   
                  Row(
                    children: [
                      Text('Edad: ${loginProvider.usuario['edad']}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.02
                      ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),   
                  Row(
                    children: [
                      Text('Fecha de nacimiento: ${loginProvider.usuario['fecha_nacimiento']}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.02
                      ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
