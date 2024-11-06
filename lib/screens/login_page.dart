import 'package:flutter/material.dart';
import 'package:target10days/utils/routes.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child : SingleChildScrollView(
        child: Column(
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
                    height: 50,
                  ),
                  ElevatedButton(
                    child: Text("Login"),
                    style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeroute);
                    }, 
                  
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}