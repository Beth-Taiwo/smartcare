import 'package:flutter/material.dart';
import 'homepage.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  var isPasswordValid = true;
  var isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      body: buildLoginScreenBody(),
    );
  }

  Widget buildLoginScreenBody() {
    TextEditingController emailController = TextEditingController();
    var passwordController = TextEditingController();

    return SafeArea(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          // TODO(INSERT IMAGE AT THE TOP)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: emailController,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'Enter email or phone number',
                  errorText: isEmailValid ? null : "Enter a valid email",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.horizontal(
                          left: const Radius.circular(30.0),
                          right: const Radius.circular(30.0)),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onEditingComplete: () {
                if ((passwordController.text.length < 8)) {
                  setState(() {
                    isPasswordValid = true;
                  });
                }
              },
              textAlign: TextAlign.left,
              obscureText: true,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'Enter password',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.horizontal(
                          left: const Radius.circular(30.0),
                          right: const Radius.circular(30.0)),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                if (validateEmail(emailController.text))
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                height: 40.0,
                width: 200.0,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20.0),
                          right: Radius.circular(20.0)),
                      side: BorderSide(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 0.5)),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: Container(
              width: 100,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("or"),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 1.0,
                    ),
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 56.0),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
              ),
            ),
          )
        ])));
  }

  bool validateEmail(String email) {
    if (!email.contains("@"))
      setState(() {
        isEmailValid = false;
      });
    return isEmailValid;
  }
}
