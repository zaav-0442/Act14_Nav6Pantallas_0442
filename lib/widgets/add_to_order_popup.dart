import 'package:flutter/material.dart';
import '../screens/order_status_screen.dart';

void showOrderSheet(BuildContext context, String imageUrl, String productName) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, // Para manejar el diseño custom
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A), // Fondo oscuro
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          border: Border(top: BorderSide(color: Color(0xFFFF00FF), width: 2)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            // Tirador superior fucsia
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFFF00FF).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFFF00FF), width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 26, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.white,
                        letterSpacing: 1.2
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Este producto forma parte de nuestra colección exclusiva de temporada.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 45),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF00FF), // Botón Fucsia
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 10,
                          shadowColor: const Color(0xFFFF00FF).withOpacity(0.5),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const OrderStatusScreen()),
                          );
                        },
                        child: Text(
                          "AGREGAR AL PEDIDO",
                          style: TextStyle(fontSize: 18),
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
    },
  );
}