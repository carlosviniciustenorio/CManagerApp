import 'package:cmanagerapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../controllers/login_controller.dart';
import '../../models/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _mailAdressController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginController _loginController = LoginController();

  bool _isLoading = false;
  String _errorMessage = '';

  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final _userModel = UserModel(
        mailAdress: _mailAdressController.text,
        password: _passwordController.text);

    var success = await _loginController.signInWithMail(_userModel);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        _errorMessage = 'Nome de usuário ou senha inválidos.';
      });
    }
  }

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.asset('assets/logo.jpg'),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: false,
                controller: _mailAdressController,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please, input your mail adress'
                    : null,
                decoration: InputDecoration(
                    labelText: 'E-mail', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please, input your password'
                    : null,
                decoration: InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  child: Text('Sign in'),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: _isLoading ? null : _login,
                  child: Text('Create new account'),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Title(color: Colors.white, child: Text("OR")),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () => _isLoading
                      ? null
                      : AuthService().signInWithGoogle(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          _body(),
        ],
      ),
    );
  }
}
