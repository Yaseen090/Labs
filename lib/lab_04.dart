import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  User? user;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        user = ModalRoute.of(context)!.settings.arguments as User;
        print(user);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Info.',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Text(
            'Username: ${user!.username}',
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            'Email: ${user!.email}',
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String? fullName, emailAddress, password, confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Sign Up. It's free!",
                style: TextStyle(fontSize: 30),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('FULL NAME'),
                onChanged: ((value) {
                  setState(() {
                    fullName = value;
                  });
                }),
                validator: ((value) =>
                    (value == null || value.isEmpty) ? "Enter a name." : null),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('YOUR EMAIL ADDRESS'),
                onChanged: ((value) {
                  setState(() {
                    emailAddress = value;
                  });
                }),
                validator: ((value) => (value == null || value.isEmpty)
                    ? "Enter email address."
                    : null),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration("PASSWORD"),
                onChanged: ((value) {
                  setState(() {
                    password = value;
                  });
                }),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Enter password."
                      : value.length < 6
                          ? "Password should be at least 6 characters."
                          : null;
                },
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('CONFIRM PASSWORD'),
                onChanged: ((value) {
                  setState(() {
                    confirmPassword = value;
                  });
                }),
                validator: (value) => (value == null || value.isEmpty)
                    ? "Enter confirm password."
                    : value.length < 6
                        ? "Password should be at least 6 characters."
                        : password != confirmPassword
                            ? "Confirm password does not match with password."
                            : null,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Sign up Successful.");
                      Navigator.pushNamed(
                        context,
                        '/login',
                        arguments: User(
                          password: password!,
                          email: emailAddress!,
                          username: fullName!,
                        ),
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('SIGN UP'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildTextFieldDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      fillColor: const Color.fromARGB(255, 49, 54, 57),
      filled: true,
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User? user;
  String? emailAddress, password;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        user = ModalRoute.of(context)!.settings.arguments as User;
        print(user);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login.",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: buildTextFieldDecoration('YOUR EMAIL ADDRESS'),
                onChanged: ((value) {
                  setState(() {
                    emailAddress = value;
                  });
                }),
                validator: ((value) => (value == null || value.isEmpty)
                    ? "Enter email address."
                    : null),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: buildTextFieldDecoration("PASSWORD"),
                onChanged: ((value) {
                  setState(() {
                    password = value;
                  });
                }),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Enter password."
                      : value.length < 6
                          ? "Password should be at least 6 characters."
                          : null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (emailAddress == user!.email &&
                          password == user!.password) {
                        print("Sign up Successful.");
                        Navigator.pushNamed(
                          context,
                          '/info',
                          arguments: user,
                        );
                      } else {
                        print("Invalid credentials!");
                      }
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('LOGIN'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildTextFieldDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      fillColor: const Color.fromARGB(255, 49, 54, 57),
      filled: true,
    );
  }
}

class User {
  String username;
  String email;
  String password;

  User({required this.password, required this.email, required this.username});

  @override
  String toString() {
    return "User{username:$username,email:$email}";
  }
}
