import 'package:chat_more/pages/home_page.dart';
import 'package:chat_more/pages/login.dart';
import 'package:chat_more/services/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_more/components/my_text_field.dart';
import 'package:chat_more/components/my_button.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Color myCustomColor = const Color(0xFF00008B);

  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  //Sign Up user
  Future<void> signUp()
  async {
    if (passwordController.text != confirmpasswordController.text){
      ScaffoldMessenger.of(context)
          .showSnackBar(
          SnackBar(
            content: Text("Passwords do not match"),
          ),
      );
      return;
    }

    //get the authentication service
    final authService = Provider.of<AuthService>(context, listen: false);

    try{
      await authService.signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text);

    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: myCustomColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 0),
                  //logo
                  Image.asset("assets/logo.png",
                    width: 200,
                    height: 200,),
                  //Welcome Back Message
                  const SizedBox(height: 0.5),
                  const Text("Welcome New User!",
                    style: TextStyle(
                      fontSize: 20, color: Colors.white,
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
                  const SizedBox(height: 25),
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password', // hint text
                      obscureText: true //akan jadi hidden.
                  ),
                  const SizedBox(height: 25),
                  // sign in button
                  //MyButton(onTap: signUp, text: "Login!"),

                  //const SizedBox(height: 25),

                  // confirm password textfield
                 // const SizedBox(height: 25),
                  MyTextField(
                      controller: confirmpasswordController,
                      hintText: 'Confirm Password', // hint text
                      obscureText: true //akan jadi hidden.
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: (){
                      // implement logic login here
                      String email = emailController.text;
                      String password = passwordController.text;
                      String confirmpassword = confirmpasswordController.text;


                      if (email == 'auni@gmail.com' && password == 'password'
                          && confirmpassword == 'password'){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            )
                        );
                      }
                      else{
                        // show error message
                        showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: const Text('Detail Error'),
                              content: const Text('email is taken,'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },

                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 25),

                  // not a member? Register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already A Member?",
                      style: TextStyle(color: Colors.white),),
                      const SizedBox(width: 4),
                      TextButton(
                        child: const Text('Sign In Now',
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent),),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => LoginPage(onTap: () {  },),
                          ),
                          );
                        } )

                      /*
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text("Sign In Now",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent),
                        ),
                      ) */

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
