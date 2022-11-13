import 'package:flutter/material.dart';

class SignUpWithValidation extends StatefulWidget {
  const SignUpWithValidation({Key? key}) : super(key: key);

  @override
  State<SignUpWithValidation> createState() => _SignUpWithValidationState();
}

class _SignUpWithValidationState extends State<SignUpWithValidation> {
  final _formKey = GlobalKey<FormState>();
  String? fullName, emailAddress, password, confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Registration",
                style: TextStyle(fontSize: 30),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('Name'),
                onChanged: ((value) {
                  setState(() {
                    fullName = value;
                  });
                }),
                validator: ((value) =>
                    (value == null || value.isEmpty) ? "Name Required." : null),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('Email'),
                onChanged: ((value) {
                  setState(() {
                    emailAddress = value;
                  });
                }),
                validator: ((value) => (value == null || value.isEmpty)
                    ? "Email Required."
                    : null),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration("Password"),
                onChanged: ((value) {
                  setState(() {
                    password = value;
                  });
                }),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Password Required."
                      : value.length < 6
                          ? "Password should be at least 6 characters."
                          : null;
                },
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('Confirm Password'),
                onChanged: ((value) {
                  setState(() {
                    confirmPassword = value;
                  });
                }),
                validator: (value) => (value == null || value.isEmpty)
                    ? "Password Required."
                    : value.length < 6
                        ? "Password should be at least 6 characters."
                        : password != confirmPassword
                            ? "Password does not match."
                            : null,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              Navigator.pop(context);
                            });
                            return const AlertDialog(
                              content: Text('Form Submitted successfully.'),
                              title: Text('Info.'),
                            );
                          });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Register'),
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

class RepresentData extends StatefulWidget {
  const RepresentData({Key? key}) : super(key: key);

  @override
  State<RepresentData> createState() => _RepresentData();
}

class _RepresentData extends State<RepresentData> {
  final _formKey = GlobalKey<FormState>();
  String? fullName, emailAddress, rollNo, department, batch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Registration",
                style: TextStyle(fontSize: 30),
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
                decoration: buildTextFieldDecoration("Roll no"),
                onChanged: ((value) {
                  setState(() {
                    rollNo = value;
                  });
                }),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('E-Mail'),
                onChanged: ((value) {
                  setState(() {
                    emailAddress = value;
                  });
                }),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('Department'),
                onChanged: ((value) {
                  setState(() {
                    department = value;
                  });
                }),
              ),
              TextFormField(
                decoration: buildTextFieldDecoration('Batch'),
                onChanged: ((value) {
                  setState(() {
                    batch = value;
                  });
                }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  '$fullName\n$rollNo\n$emailAddress\n$department\n$batch'),
                              title: const Text('Registration Infromation'),
                            );
                          });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Register'),
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
