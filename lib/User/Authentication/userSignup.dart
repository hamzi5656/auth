//login screen

import 'package:auth/User/Authentication/userlogin.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Signup extends StatelessWidget {
    Signup({super.key});
final TextEditingController _emailController= TextEditingController();
final TextEditingController _passwordController= TextEditingController();
final TextEditingController _nameController= TextEditingController();
Signupmethod() async {
  try {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _emailController.text,
    password: _passwordController.text
  ).then((User){
  
    FirebaseFirestore.instance.collection("UserDetail").doc(User.user!.uid).set({
      "Name": _nameController.text,
    }).then((value) {
  
    });

  } );
 
 
} on FirebaseAuthException catch (e) {
 print(e.code);
}
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: "poppins"),
                ),
              ),
              Center(
                child: Text(
                  "Register Here",
                  style: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "poppins"),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Flexible(
                child: TextField(
                  controller:_emailController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Full Name",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Confirm Password",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(   
                onPressed: (){
                  Signupmethod();
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Login()));
                },
                style: ElevatedButton.styleFrom(
                   //  primary: Colors.deepPurple, // Background color
                    // onPrimary: Colors.white, 
                    foregroundColor: Colors.white,
                     backgroundColor: Colors.blue, // Text color
                    elevation: 5,
                    minimumSize: Size(
                        MediaQuery.sizeOf(context).width * .9,
                        MediaQuery.sizeOf(context).width *
                            .16) // Elevation (shadow)
                    ),
                child: const Text("sign up"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    "Have an account?",
                    style: TextStyle(),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Login()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
