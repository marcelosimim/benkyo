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
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Aproveite todos os benefícios da Benkyō agora mesmo!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 100), child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _textFormFieldWidth,
                          height: _textFormFieldHeight,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            controller: _nameController,
                            decoration: textFormFieldInputDecoration(
                                Icon(Icons.account_circle, color: Colors.white70), 'Nome'),
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
                              style: TextStyle(color: Colors.white, fontSize: 15),
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: textFormFieldInputDecoration(
                                  Icon(Icons.mail, color: Colors.white70), 'Email'),
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
                            padding: EdgeInsets.only(left: 50),
                            child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: _textFormFieldWidth,
                              height: _textFormFieldHeight,
                              child: TextFormField(
                                style: TextStyle(color: Colors.white, fontSize: 15),
                                obscureText: _obscureText,
                                controller: _passController,
                                decoration: textFormFieldInputDecoration(
                                    Icon(Icons.lock, color: Colors.white70), 'Senha'),
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
                          ],)
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: _textFormFieldWidth,
                            height: _textFormFieldHeight,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white, fontSize: 15),
                              obscureText: _obscureText,
                              decoration: textFormFieldInputDecoration(
                                  Icon(Icons.lock, color: Colors.white70), 'Confirme sua senha'),
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
                      ],
                    ),
                  ),),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Padding(padding: EdgeInsets.only(bottom: 100), child: ElevatedButton(onPressed: () {
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
                    }, child: Text('ENVIAR')),),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, route.loginPage);
                        },
                        child: Text(
                            'Já tem uma conta cadastrada? Acesse ela agora mesmo')),
                  ),],
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