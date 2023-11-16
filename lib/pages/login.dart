import 'package:chat_more/pages/home_page.dart';
//import 'package:chat_more/pages/permission.dart';
import 'package:chat_more/services/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_more/components/my_text_field.dart';
//import 'package:chat_more/components/my_button.dart';
import 'package:provider/provider.dart';
import 'register.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
  required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color myCustomColor = const Color(0xFF00008B);

  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // User Sign In
  void signIn() async {
    // get the authentication
    // access all the methods
    final authService = Provider.of<AuthService>(context, listen:false);

    try{
      await authService.signInWithEmailandPassword(
          emailController.text,
          passwordController.text);
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString(),
      ),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.deepPurple])
      ),
      child: Scaffold(
        backgroundColor: myCustomColor, // background app color
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height:10),
                  //logo
                 Image.asset("assets/logo.png",
                 width: 200,
                 height: 200,),
                  //Welcome Back Message
                  const SizedBox(height: 2),
                  const Text("Welcome Back!",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  ),
                  const SizedBox(height:40),
                  // email textfield
                  MyTextField(
                      controller: emailController,
                      hintText: 'Email', // hint text
                      obscureText: false
                  ),
                  // password textfield
                  const SizedBox(height: 20),
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password', // hint text
                      obscureText: true //akan jadi hidden.
                  ),
                  const SizedBox(height: 10),
                  // sign in button
                 // MyButton(onTap: signIn, text: "Login!"),

                  const SizedBox(height: 25),
                  ElevatedButton(
                      onPressed: (){
                        // implement logic login here
                        String email = emailController.text;
                        String password = passwordController.text;
                        if (email == 'test@gmail.com' && password == '123456'){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage(),
                            )
                          );
                        }
                        else{
                          // show error message
                          showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: const Text('Login Failed'),
                                  content: const Text('Invalid Email or Password,'),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(onTap: () {  },),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                          );
                        }
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // Change the button's background color
                      foregroundColor: Colors.white, // Change the text color
                      padding: const EdgeInsets.all(16), // Adjust padding as needed
                      minimumSize: const Size(150, 48), // Adjust minimum size as needed
                      textStyle: const TextStyle(
                        fontSize: 18, // Change the text size
                      ),
                    ),

                      child:
                      const Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ),
                  const SizedBox(height: 20),

                  // Not A member? Register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not A member?",
                      style: TextStyle(color: Colors.white,
                      fontSize: 20),),
                      const SizedBox(width: 4),

                      TextButton(
                          child: const Text('Register Now',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                              fontSize: 20),
                          ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(onTap: () {  },),
                            ),
                          );
                        },
                      /*GestureDetector(
                        onTap: widget.onTap,
                        child: const Text("Register Now",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        )
                      )*/
                      ),
                        ],
                  )
                ],
              )
            ),
          )
        )
      ),
    );
  }
}
