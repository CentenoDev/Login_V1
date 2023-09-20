import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() {//Es la función de entrada principal de una aplicación Flutter. En este caso, maines una función que no devuelve nada ( void). Aquí se inicia la ejecución del programa Flutter. La función main llama a runApp, que inicia la aplicación y pasa una instancia de MyApp como raíz de la aplicación.
  runApp(const MyApp());//Esta función inicia la aplicación Flutter y le pasa un objeto de la clase MyApp. runApp toma un Widget y lo construye en el árbol de widgets de la aplicación.
}

class MyApp extends StatelessWidget {// es una clase que se extiende StatelessWidget. Es un widget que no mantiene ningún estado interno y solo depende de los parámetros proporcionados para construir su interfaz de usuario. Al ser un widget sin estado, su construcción no cambia en función de las interacciones del usuario o datos cambiantes.
  const MyApp({super.key});// El constructor de MyApp que puede aceptar un argumento de clave (key) opcional. En este caso, no se está usando una clave, pero se incluye la posibilidad de proporcionar una.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreenv1(),
    );
  }
}/* Este es un método obligatorio que se debe sobrescribir en cualquier widget de Flutter.
 Defina la estructura de la interfaz de usuario que se construirá cuando este widget se renderice en la pantalla.
  En este caso, MyAppretorna un MaterialAppque tiene como pantalla principal ( home) un objeto de la clase 
  LoginScreenv1. MaterialAppestablece la base de la aplicación siguiendo las convenciones de diseño de Material Design. 
  */

class LoginScreenv1 extends StatelessWidget {//es una clase que se extiende StatelessWidget. Al heredar de StatelessWidget, este widget no mantiene ningún estado interno y su apariencia no cambia en función de las interacciones del usuario o datos cambiantes. Se centra en la representación visual basada en las propiedades proporcionadas.
  final TextEditingController usernameController = TextEditingController();//Aquí se está creando una instancia de TextEditingController llamada usernameController. Este controlador se utilizará para controlar y obtener el texto del campo de texto asociado a la entrada del nombre de usuario en la pantalla de inicio de sesión.
  final TextEditingController passwordController = TextEditingController();//Similar al punto anterior, se crea una instancia de TextEditingController llamada passwordController. Este controlador se utilizará para controlar y obtener el texto del campo de texto asociado a la entrada de la contraseña en la pantalla de inicio de sesión.

  LoginScreenv1({super.key});//Este es el constructor de la clase LoginScreenv1. Recibe un argumento de clave (key) opcional. super.keyse utiliza para pasar esta clave a la clase padre ( StatelessWidget).

  @override
Widget build(BuildContext context) {
  // Construcción de la estructura de la pantalla
  return Scaffold(
    body: Stack(
      children: <Widget>[
        // Fondo con ondas
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.10,
          child: RotatedBox(
            quarterTurns: 2,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Colors.orange, Colors.orange.shade100],
                  [Colors.orange, Colors.orange.shade100],
                  [Colors.orange, Colors.orange.shade100],
                  [Colors.orange, Colors.orange.shade200],
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
          ),
        ),
        // Contenido principal en una lista
        ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Login V1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0)),
                  // Campo de texto para el nombre de usuario
                  Card(
                    margin:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    elevation: 11,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Nombre de usuario",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16.0)),
                    ),
                  ),
                  // Campo de texto para la contraseña
                  Card(
                    margin:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    elevation: 11,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Contraseña",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16.0)),
                    ),
                  ),
                  // Botón de inicio de sesión
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acciones al presionar el botón de inicio de sesión
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Inicio de sesión exitoso"),
                              content: const Text(
                                  "¡Has iniciado sesión correctamente!"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Aceptar"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // Puedes agregar código para redirigir al usuario aquí si es necesario
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.orange,
                          elevation: 11,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(40.0))),
                      child: const Text("Login"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}