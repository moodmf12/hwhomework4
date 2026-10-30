import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _fieldDecoration(
    String hint,
    IconData icon,
  ) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(179, 150, 145, 145),
        size: 27,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 27,
      ),
      border: InputBorder.none,
      errorStyle: const TextStyle(
        color: Color.fromARGB(255, 246, 70, 70),
        fontSize: 12,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF33251D),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),

            child: Form(
              key: _formKey,

              child: Column(
                children: [

                  const SizedBox(height: 160),

                  // Заголовок
                  const Text(
                    'CREATE ACCOUNT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 130),

                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(45),
                    ),

                    child: TextFormField(
                      controller: _nameController,

                      textCapitalization:
                          TextCapitalization.words,

                      textInputAction: TextInputAction.next,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),

                      decoration: _fieldDecoration(
                        'Имя',
                        Icons.notes,
                      ),

                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Введите имя';
                        }

                        if (v.trim().length < 2) {
                          return 'Слишком короткое имя';
                        }

                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(45),
                    ),

                    child: TextFormField(
                      controller: _emailController,

                      keyboardType:
                          TextInputType.emailAddress,

                      textInputAction: TextInputAction.next,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),

                      decoration: _fieldDecoration(
                        'Email',
                        Icons.mail_outline,
                      ),

                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Введите электронную почту';
                        }

                        if (!RegExp(
                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                        ).hasMatch(v.trim())) {
                          return 'Неправильный Email';
                        }

                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  // PASSWORD
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(45),
                    ),

                    child: TextFormField(
                      controller: _passwordController,

                      obscureText: true,

                      textInputAction: TextInputAction.done,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),

                      decoration: _fieldDecoration(
                        'Пароль',
                        Icons.lock_outline,
                      ),

                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Введите пароль';
                        }

                        if (v.length < 6) {
                          return 'Минимум 6 символов';
                        }

                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 95),

                  SizedBox(
                    width: double.infinity,
                    height: 80,

                    child: OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Аккаунт успешно создан!',
                              ),
                            ),
                          );

                        }
                      },

                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,

                        side: const BorderSide(
                          color: Colors.white38,
                          width: 1.5,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(45),
                        ),
                      ),

                      child: const Text(
                        'Продолжить',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}