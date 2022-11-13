import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  String? fullName, emailAddress, password, confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Registration",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('Name'),
                onChanged: ((value) {
                  setState(() {
                    fullName = value;
                  });
                }),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('Email'),
                onChanged: ((value) {
                  setState(() {
                    emailAddress = value;
                  });
                }),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration("Password"),
                onChanged: ((value) {
                  setState(() {
                    password = value;
                  });
                }),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration(
                  'Confirm Password',
                ),
                onChanged: ((value) {
                  setState(() {
                    confirmPassword = value;
                  });
                }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
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
      fillColor: Colors.white,
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
  String? emailAddress, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: buildTextFieldDecoration('Email'),
                onChanged: ((value) {
                  setState(() {
                    emailAddress = value;
                  });
                }),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: buildTextFieldDecoration("Password"),
                onChanged: ((value) {
                  setState(() {
                    password = value;
                  });
                }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () {},
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
      fillColor: Colors.white,
      filled: true,
    );
  }
}

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Center(
            child: Text(
              'Information.',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Text(
            'User Name: Yaseen Ali',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'User Skill: Flutter Developer',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'User Salary: 25000',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'User Designation: Senior Developer',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

class MyInformation extends StatelessWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Center(
            child: Text(
              'My Information.',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Text(
            'Name: Yaseen Ali',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Roll No: 19SW14',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Department: Software Engineering',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Batch: 19 batch',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Domicile: Dadu',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
