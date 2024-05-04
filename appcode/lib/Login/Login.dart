import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 140, 77, 208),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(40),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(60),
                  child: const Text(
                    'FindSpacZ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w800,
                        fontSize: 50),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    labelStyle: TextStyle(
                      // Set the label text style
                      color: const Color.fromARGB(
                          255, 255, 255, 255), // Change the label color here
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      // Set the label text style
                      color: const Color.fromARGB(
                          255, 255, 255, 255), // Change the label color here
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  selectionColor: Color.fromARGB(255, 229, 229, 229),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      // print(nameController.text);
                      // print(passwordController.text);
                      String username = nameController.text;
                      String password = passwordController.text;
                      if (username == "kishan" && password == "1234") {
                        // Navigate to the home page if credentials are correct
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           Home()), // Navigate to the Home page
                        // );
                      } else {
                        // Show a SnackBar indicating incorrect credentials
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Incorrect username or password',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 140, 77, 208)),
                            ),
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          ),
                        );
                      }
                    },
                  )),
            ],
          )),
    );
  }
}
