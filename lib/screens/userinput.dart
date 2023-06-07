import 'package:flutter/material.dart';
import 'package:group4_flutter_assignment/screens/useraccount.dart';

class UserInputForms extends StatefulWidget {
  @override
  _UserInputFormsState createState() => _UserInputFormsState();
}

class _UserInputFormsState extends State<UserInputForms> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: const InputDecoration(
              labelText: 'First Name',
            ),
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: const InputDecoration(
              labelText: 'Last Name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'last name is required ';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'email is required';
              }
              if (!isEmailValid(value)) {
                return ' invalid email type';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            obscureText: _obscurePassword,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              if (!isPasswordValid(value)) {
                return 'Password must be at least 8 characters long and contain a combination of uppercase letters, lowercase letters, and numbers';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _retypePasswordController,
            decoration: const InputDecoration(
              labelText: 'Retype Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please re-enter your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords is not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const useraccounts()));
              }
            },
            child: const Text('Create User'),
          ),
        ],
      ),
    );
  }

  bool isEmailValid(String email) {
    // A simple email validation using a regular expression
    const emailRegex =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})$';
    final regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    // Password validation for at least 8 characters with a combination of uppercase letters, lowercase letters, and numbers
    const passwordRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
    final regExp = RegExp(passwordRegex);
    return regExp.hasMatch(password);
  }
}
