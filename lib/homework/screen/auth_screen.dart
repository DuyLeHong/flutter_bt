import 'package:flutter/material.dart';

enum AuthMode { signup, login }

class AuthScreenPage extends StatefulWidget {
  static const routeName = '/auth';
  const AuthScreenPage({Key? key, this.counter}) : super(key: key);
  final int? counter;

  @override
  State<AuthScreenPage> createState() => _AuthScreenPageState();
}

class _AuthScreenPageState extends State<AuthScreenPage> {
  @override
  void initState() {
    debugPrint('Auth-initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint('Auth-didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AuthScreenPage oldWidget) {
    debugPrint('Auth-didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    debugPrint('Auth-reassemble');
    super.reassemble();
  }

  @override
  void activate() {
    debugPrint('Auth-activate');
    super.activate();
  }

  @override
  void deactivate() {
    debugPrint('Auth-deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('Auth-dispose');
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    debugPrint('Auth-setState');
    super.setState(fn);
  }

  AuthMode _authMode = AuthMode.login;
  void _switchAuthMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signup;
      });
      // _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
      // _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Page'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffb7a1f0), Color(0xfffadbbb)],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    transform: Matrix4.rotationZ(-0.1),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'My Shop ${widget.counter}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 8.0,
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              obscureText: true,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            if (_authMode == AuthMode.signup)
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Confirm Password',
                                ),
                                obscureText: true,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, _authMode);
                              },
                              child: Text(_authMode == AuthMode.login
                                  ? 'LOGIN'
                                  : 'SIGN UP'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: _switchAuthMode,
                              child: Text(
                                  '${_authMode == AuthMode.login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 4),
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
