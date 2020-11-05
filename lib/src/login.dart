import 'package:flutter/material.dart';
import 'mixins/validation_mixin.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
  
}

class LoginState extends State<Login> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
    String email = '';
    String password = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
           
            emailField(),
            passwordField(),
             
            RaisedButton(
                 child: Text('SUBMIT'),
                 color: Colors.blueGrey,
                 textColor: Colors.white,
                 onPressed: () {
                   
                   if(formKey.currentState.validate()) {
                     print('Form is valid');
                     formKey.currentState.save();
                     print(email);
                     print(password);
                   }
                   },
                 ),
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'abc@gmail.com',
      
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail
      ,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '',
        
      ),
      obscureText: true,
      onSaved: (String value) {
        password = value;
      },
    );
  }



  
}