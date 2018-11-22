import 'package:flutter/material.dart';
import 'package:hello_world/db/db_helper.dart';
import 'package:hello_world/models/user.dart';
import 'package:hello_world/pages/login/login_presenter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> implements LoginContract {
  final title = 'Login';
  BuildContext _ctx;
  bool _isLoading;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username = '';
  String _password = '';
  
  LoginPresenter _presenter;

  _LoginState() {
    _presenter = new LoginPresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text('Login success'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text('Login'),
      color: Colors.green,
    );

    // var loginBtn = new RaisedButton(
    //   onPressed: _submit,
    //   child: new Text('Login'),
    //   color: Colors.green,
    // );

    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text('Login', textScaleFactor: 2.0,),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: 'Username'),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: 'Password'),
                ),
              ),
            ],
          ),
        ),
        loginBtn,
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;
    });
    var db = new DbHelper();
    await db.saveUser(user);
    Navigator.of(context).pushNamed('/receiving');
  }
}

