import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // --- BARRA DE NAVEGACIÓN AGREGADA ---
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.flash_on, color: Color(0xFF00FFFF), size: 28),
            SizedBox(width: 8),
            Text(
              "Freddy's",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00FFFF),
              ),
            ),
          ],
        ),
      ),
      // ------------------------------------
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "NUEVA CUENTA",
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFFFF00FF),
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(color: Color(0xFFFF00FF), blurRadius: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildNeonTextField("Nombre Completo"),
                    const SizedBox(height: 15),
                    _buildNeonTextField("Correo"),
                    const SizedBox(height: 15),
                    _buildNeonTextField("Contraseña", obscureText: true),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00FFFF),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("CREAR CUENTA"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildNeonTextField(String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFFFF00FF)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 255, 255),
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00FFFF), width: 2),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      color: Colors.black,
      child: const Text(
        "© Zoé Aranza Alva Vazquez - 2026",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 10, color: Colors.grey),
      ),
    );
  }
}
