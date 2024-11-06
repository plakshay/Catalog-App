import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child : Column(
        children: [
          Image.asset("assets/images/login.png"),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20 ,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  // style: ButtonStyle(
                    
                  // ),
                  onPressed: () {
                    print("login button");
                  }, 
                child: Text("Login"),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}