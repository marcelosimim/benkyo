import 'package:benkyo/components/inputDecoration.dart';
import 'package:benkyo/models/userModel.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:benkyo/route/route.dart' as route;
import 'package:scoped_model/scoped_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _textFormFieldWidth = 250.0;
  final _textFormFieldHeight = 80.0;
  String? _email;
  String? _password;
  var _showPassword = Icons.visibility;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              return Form(
                  key: _formKey,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 50, bottom: 30),
                          child: Text(
                            'É sempre um prazer recebê-lo!',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            width: _textFormFieldWidth,
                            height: _textFormFieldHeight,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.white, fontSize: 15),
                              controller: _emailController,
                              decoration: textFormFieldInputDecoration(Icon(Icons.email,color: Colors.white70), 'Email'),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Campo obrigatório';
                                } else if (EmailValidator.validate(value)) {
                                  return null;
                                }
                                return 'Email inválido!';
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10, left: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: _textFormFieldWidth,
                                height: _textFormFieldHeight,
                                child: TextFormField(
                                  obscureText: _obscureText,
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                  controller: _passwordController,
                                  decoration: textFormFieldInputDecoration(Icon(Icons.lock,color: Colors.white70), 'Senha'),
                                  validator: (value) {
                                    _password = value;
                                    if (value == null || value == '') {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: IconButton(
                                  icon: Icon(_showPassword),
                                  color: Colors.white70,
                                  onPressed: (){
                                    if(_showPassword.toString() == 'IconData(U+0E6BD)'){
                                      setState(() {
                                        _showPassword = Icons.visibility_off;
                                        _obscureText = false;
                                      });
                                    }else{
                                      setState(() {
                                        _showPassword = Icons.visibility;
                                        _obscureText = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                model.signIn(
                                    email: _emailController.text,
                                    pass: _passwordController.text,
                                    onSuccess: _onSuccess,
                                    onFail: _onFail);
                              }
                              else {
                                print('falha na validação ');
                              }
                            },
                            child: Text('ENTRAR'))
                      ],
                    ),
                  ));
            }
        )
    );
  }

  void _onSuccess(){
    Navigator.pushNamedAndRemoveUntil(context, route.homePage, (route) => false);
  }

  void _onFail(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color(0xFF6C6C6C),
        content: Text(
          'Usuário ou senha inválido(s)',
        ),
      ),
    );
    print('Fail');
  }
}
