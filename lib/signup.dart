import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildSignUpForm();
  }

  Widget buildSignUpForm() {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: buildForm(),
          appBar: PreferredSize(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(16.0)),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 32.0,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          ),
                          widthFactor: 5,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Divider(
                      color: Colors.grey,
                      indent: 3.0,
                      height: 32.0,
                    )
                  ],
                ),
              ),
              preferredSize: Size(null, 100))),
    );
  }

  Widget buildForm() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 1.5,
                  child: ListView(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 190,
                            child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: buildTextField("First Name",
                                    keyboardType: TextInputType.text,
                                    autoFocus: true)),
                          ),
                          Container(
                            width: 190,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: buildTextField("Last Name",
                                    keyboardType: TextInputType.text)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTextField("email",
                            keyboardType: TextInputType.text),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTextField(
                          "Password",
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        buildTextField("Confirm Password", obscureText: true),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildButton(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                    ),
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600)))
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                )
              ],
            )),
      ),
    );
  }

  Widget buildButton() {
    return Material(
      child: InkWell(
        splashColor: Colors.blue,
        highlightColor: Colors.blue,
        child: RaisedButton(
          onPressed: () => {},
          child: Center(
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20.0), right: Radius.circular(20.0))),
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget buildTextField(String hint,
      {TextEditingController controller,
        TextInputType keyboardType,
        bool obscureText = false,
        bool autoFocus = false}) {
    return TextField(
      keyboardType: keyboardType,
      textAlign: TextAlign.left,
      obscureText: obscureText,
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
      autofocus: autoFocus,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 18, color: Colors.black54, fontStyle: FontStyle.italic),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.horizontal(
                  left: const Radius.circular(30.0),
                  right: const Radius.circular(30.0)),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
          filled: true,
          fillColor: Colors.grey),
    );
  }
}
