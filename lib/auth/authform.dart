import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //--------------------
  final _formkey = GlobalKey<
      FormState>(); //it is essential bcoz we need to validate our form in case of wrong email and password
  var _email = '';
  var _password = '';
  var _username = '';
  bool isLoginPage = false; //agr user phla se login h toh dont show his page

  //---------------------

  startauthentication() {
    final validity = _formkey.currentState!.validate();
    FocusScope.of(context)
        .unfocus(); //unfocus both the text fields and keyboard disappears
    if (validity) {
      //if form is valid save it
      _formkey.currentState?.save();
      submitform(_email, _password, _username);
    }
  }

  submitform(String email, String password, String username) async {
    final auth = FirebaseAuth.instance;

    UserCredential authresult;

    try {
      if (isLoginPage) {
        authresult = await auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authresult = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        String uid = authresult.user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': username,
          'email': email,
        });
      }
    } catch (error) {
      print(error);
    }
  }

  //---------------------

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 100,
            ), //sice email vala touch krra h
            child: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isLoginPage)
                  //if u havent on thisn app before then this page will be shown
                  TextFormField(
                    keyboardType: TextInputType.name,
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value == null) {
                        return 'Incorrect Username'; //agr empty usernsme ho toh dunno validate
                      }
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide()),
                      labelText: 'Enter Username',
                      //  labelStyle: GoogleFonts.roboto(),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Incorrect Email'; //agr empty email ho toh dunno validate
                    }
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide()),
                    labelText: 'Enter Email',
                    //  labelStyle: GoogleFonts.roboto(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value == null) {
                      return 'Incorrect Password'; //agr empty email ho toh dunno validate
                    }
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide()),
                    labelText: 'Enter Password',
                    //  labelStyle: GoogleFonts.roboto(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                   height: 40,
                minWidth: 200,
                color: Colors.purple,
                  onPressed: () {
                    print("authentication is done");
                    startauthentication();
                    
                  },
                  child:
                   isLoginPage ? 
                   Text('Login') : 
                   Text('SignUp'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLoginPage = !isLoginPage;
                      });
                      print("sreen is changed");
                    },
                    child: isLoginPage
                        ? Text('Not a member?')
                        : Text('Already a member?'))
              ],
            )),
          )
        ],
      ),
    );
  }
}
