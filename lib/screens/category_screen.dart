import 'package:flutter/material.dart';
import '../widgets/add_to_order_popup.dart'; // Asegúrate de que la ruta sea correcta

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  final String imagePath;

  CategoryScreen({required this.categoryName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Fondo oscuro
      appBar: AppBar(
        title: Text(categoryName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFFF00FF)), // Acento Fucsia
      ),
      body: Column(
        children: [
          // Banner dinámico con la imagen del recuadro anterior
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagePath), // Cambiado a NetworkImage para URLs
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
              child: Center(
                child: Text(
                  categoryName.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    shadows: [
                      Shadow(color: Color(0xFFFF00FF), blurRadius: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildProductList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          color: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Color(0xFFFF00FF), width: 0.5),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imagePath, width: 60, height: 60, fit: BoxFit.cover),
            ),
            title: Text("Producto Neón ${index + 1}", 
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: const Text("Disponible en stock", style: TextStyle(color: Colors.grey)),
            trailing: const Text("\$299.00", 
              style: TextStyle(color: Color(0xFFFF00FF), fontWeight: FontWeight.bold, fontSize: 16)),
            onTap: () {
              // Llamada al Popup modificado
              showOrderSheet(context, imagePath, "Producto Neón ${index + 1}");
            },
          ),
        );
      },
    );
  }
}