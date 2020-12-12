import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login_Screen extends StatefulWidget {
  @override
  Login_Screen_State createState() => Login_Screen_State();
}

class Login_Screen_State extends State<Login_Screen> {
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();
  //key for currentstate, it is used for the email & password input validator
  GlobalKey<FormState> _form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _screen_height = MediaQuery.of(context).size.height;
    double _screen_width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Container(
          child: Form(
            key: _form_key,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    //upperpart
                    Container(
                      height: _screen_height - (_screen_height / 2),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            height: 250,
                            width: 250,
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //lowerpart
                    Container(
                      height: _screen_height - (_screen_height / 2),
                      color: Colors.amberAccent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 90,
                            // color: Colors.green,
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: TextFormField(
                              controller: _email_controller,
                              keyboardType: TextInputType.emailAddress,
                              autovalidate: true,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Please fill your email'),
                                EmailValidator(
                                    errorText: 'Invalid email format'),
                              ]),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                labelText: 'Email',
                                icon: Icon(Icons.mail),
                                labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 2),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            // color: Colors.green,
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: _password_controller,
                              obscureText: true,
                              autovalidate: true,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Please fill password'),
                                MinLengthValidator(5,
                                    errorText:
                                        'Password must be longer than 4 letters'),
                              ]),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                labelText: 'Password',
                                icon: Icon(Icons.lock),
                                labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 70,
                            // color: Colors.amber,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(10, 0, 35, 25),
                            child: Container(
                              child: SizedBox(
                                height: 100,
                                width: 130,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    //if the 2 input are corect, process this
                                    if (_form_key.currentState.validate()) {
                                      print(_email_controller.text);
                                      print(_password_controller.text);
                                    }
                                    // if the any input is failed, process this
                                    else {
                                      print('failed');
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: Colors.deepOrange[400],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushReplacementNamed("/RegisterScreen"),
                            child: Text(
                              'No account yet? Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
