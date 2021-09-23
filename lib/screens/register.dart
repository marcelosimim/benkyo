import 'package:benkyo/components/inputDecoration.dart';
import 'package:benkyo/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:benkyo/route/route.dart' as route;
import 'package:scoped_model/scoped_model.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _textFormFieldWidth = 250.0;
  final _textFormFieldHeight = 80.0;
  var _showPassword = Icons.visibility;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          return Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 30),
                    child: Text(
                      'Aproveite todos os benefícios da Benkyō agora mesmo!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: _textFormFieldWidth,
                    height: _textFormFieldHeight,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: textFormFieldInputDecoration(
                          Icon(Icons.account_circle), 'Nome'),
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Campo obrigatório';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: _textFormFieldWidth,
                      height: _textFormFieldHeight,
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: textFormFieldInputDecoration(
                            Icon(Icons.mail), 'Email'),
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
                  Container(
                    width: _textFormFieldWidth,
                    height: _textFormFieldHeight,
                    child: TextFormField(
                      obscureText: _obscureText,
                      controller: _passController,
                      decoration: textFormFieldInputDecoration(
                          Icon(Icons.lock), 'Senha'),
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Campo obrigatório';
                        } else if (value.length < 6) {
                          return 'Insira pelo menos 6 caracteres';
                        }
                        return null;
                      },

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: _textFormFieldWidth,
                      height: _textFormFieldHeight,
                      child: TextFormField(
                        obscureText: _obscureText,
                        decoration: textFormFieldInputDecoration(
                            Icon(Icons.lock), 'Confirme sua senha'),
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Campo obrigatório';
                          } else if (value != _passController.text) {
                            return 'As senhas não coincidem';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> userData = {
                        "name": _nameController.text,
                        "email": _emailController.text,
                        "interval": 5
                      };
                      model.signUp(
                          userData: userData,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail
                      );
                    } else {
                      _onFail();
                    }
                  }, child: Text('ENVIAR')),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, route.loginPage);
                      },
                      child: Text(
                          'Já tem uma conta cadastrada? Acesse ela agora mesmo'))
                ],
              ),
            ),
          );
        }));
  }

  void _onSuccess(){
    print('sucess');
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.pushNamedAndRemoveUntil(context, route.homePage, (route) => false);
    });
  }

  void _onFail(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color(0xFF6C6C6C),
        content: Text(
          'Falha ao criar usuário.',
        ),
      ),
    );
    print('fail');
  }
}