import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _artistTypeController = TextEditingController();

  bool _showAdditionalInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 100.0,
              color: Colors.blue,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email or Username',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add login functionality here
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: _showAdditionalInfo,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _showAdditionalInfo ? 200.0 : 0.0,
                child: Column(
                  children: [
                    TextField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: _artistTypeController,
                      decoration: InputDecoration(
                        hintText: 'Type of Artist',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showAdditionalInfo = !_showAdditionalInfo;
                });
              },
              child: Text('Don\'t have an account?'),
            ),
          ],
        ),
      ),
    );
  }
}
