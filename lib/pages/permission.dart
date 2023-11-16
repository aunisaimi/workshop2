import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  Color myCustomColor = const Color(0xFF00008B);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myCustomColor,
      appBar: AppBar(title: const Text('Permission Access'),
        backgroundColor: Colors.black38),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:  Text('By granting an access of Microphone, '
                    'Camera you will be able to access more of our features',
                  style: GoogleFonts.tiltNeon(
                      textStyle: const TextStyle(fontSize: 32,
                          color: Colors.white),
                  ),
                ),

                ),

              ],

            ),
        ),
      ),

    );


  }
}
