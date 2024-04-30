import 'package:flutter/material.dart';
import 'package:pixelpulse/main_page.dart';

/*
PLANS:
-Background Gradient
-Email and Password Text box format
-Add buttons
-Add the Facebook, IG, and Google logos
-"Dont have an Account?" animation slider
*/
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[200]!, Colors.purple[700]!],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
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
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
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
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: _artistTypeController,
                          decoration: InputDecoration(
                            hintText: 'Type of Artist',
                            filled: true,
                            fillColor: Colors.white,
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
        ),
      ),
    );
  }
}
