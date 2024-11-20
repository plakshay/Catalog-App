import 'package:flutter/material.dart';
import 'package:target10days/screens/cart_page.dart';
import 'package:target10days/utils/routes.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
 class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? name="";
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
            if (_formkey.currentState?.validate() ?? false) {

              setState(() {
                  changeButton=true;
                   });
                        await Future.delayed(Duration(seconds: 1));// await is used to delay the navigator operation by 1 second using asynchronus function
                        await Navigator.pushNamed(context, MyRoutes.homeroute);
                        setState(() {
                          changeButton=false;
                        });
  }
  }
  bool changeButton = false; // this is very important, false by default, we will change its state to true and apply conditional statement in every button operation
  @override
  
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child : SingleChildScrollView( // single child scroll view is used in order to scroll thorugh the pages and avoid the overflow or distortion of UI in smaller screens
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/login.png"),
              Text(
                "Welcome $name",
                // $ name is used in order to display the name dynamically after welcome
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
                     
                      validator: (value) {
                       if (value == null || value.isEmpty) {
                            return "username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        // this is used to apply a changed value of name, value is taken as an input argument in the onchanged function which is passed to name
                        name=value; 
                        setState(() {
                          // setstate is used to call the build function again and helps to change the state of a specific thing
                        });
                      },
                       
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                       validator: (value) {
                        if (value == null || value.isEmpty) {
                            return "password cannot be empty";
                        }
                        else if(value.length<6){
                            return "invalid password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
          
                      // login button
                    Material(
                      color: MyTheme.darkblueColor,
                      borderRadius: BorderRadius.circular(changeButton? 50:8),
                      child: InkWell( //to make it clickable : two options- 1. inkwell  2. gesturedetector - gives no response/ no ripple effect in the UI
                        onTap: () => moveToHome(context), 
                        
                        child: AnimatedContainer(
                          // to make the button animated we used AnimateContainer 
                          duration: Duration(seconds: 1 ),// duration for animation/ after how many seconds will the animation happen
                          width: changeButton? 50 : 150,
                          height:   50,
                          alignment: Alignment.center,
                          child: changeButton? Icon(Icons.done,color: Colors.white,): Text(
                            "Login",
                            style: TextStyle(
                              color:Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          // decoration: BoxDecoration(
                          //   color: Colors.deepPurple,
                          //   borderRadius: BorderRadius.circular(changeButton? 50:8),
                          //   ), we are giving ink a parent- material so its ancestor children should not contain any decoration it causes conflict
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeroute);
                    //     // navigator is used to navigate to different pages that are routed
                    //   }, 
                    
                    // ) commented in order to make an animation for button 
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}