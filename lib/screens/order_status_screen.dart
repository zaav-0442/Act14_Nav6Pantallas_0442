import 'package:flutter/material.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Fondo oscuro coherente
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  "MI PEDIDO",
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                    color: Color(0xFFFF00FF), // Acento Fucsia
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            
            // Línea de tiempo adaptada
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ListView(
                  children: [
                    _buildStep(icon: Icons.list_alt, title: "Realiza tu lista", subtitle: "Productos seleccionados", isFirst: true, isCompleted: true),
                    _buildStep(icon: Icons.payment, title: "Haz tu pedido", subtitle: "Pago confirmado", isCompleted: true),
                    _buildStep(icon: Icons.soup_kitchen, title: "En preparación", subtitle: "Cocinando tu pedido...", isCompleted: false),
                    _buildStep(icon: Icons.delivery_dining, title: "En camino", subtitle: "Repartidor cerca", isLast: true, isCompleted: false),
                  ],
                ),
              ),
            ),

            // Mapa desde GitHub con borde neón
            Container(
              margin: const EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFF00FF), width: 2),
                boxShadow: [
                  BoxShadow(color: const Color(0xFFFF00FF).withOpacity(0.3), blurRadius: 10)
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  "https://raw.githubusercontent.com/zaav-0442/Act15_Examen/main/pantalla2/mapa.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
            child: Row(
              children: [
                const Icon(
                  Icons.flash_on,
                  color: Color(0xFF00FFFF),
                  size: 28,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Freddy's", 
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF00FFFF))
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white), 
            onPressed: () {}
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required IconData icon, 
    required String title, 
    required String subtitle, 
    bool isFirst = false, 
    bool isLast = false, 
    bool isCompleted = false
  }) {
    // Definimos los colores del estado
    final Color stateColor = isCompleted ? const Color(0xFFFF00FF) : Colors.grey[800]!;
    final Color textColor = isCompleted ? Colors.white : Colors.grey;

    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(width: 2, height: 20, color: isFirst ? Colors.transparent : stateColor),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isCompleted ? const Color(0xFFFF00FF) : Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: stateColor, width: 2),
                  boxShadow: isCompleted ? [BoxShadow(color: const Color(0xFFFF00FF).withOpacity(0.5), blurRadius: 8)] : [],
                ),
                child: Icon(icon, color: isCompleted ? Colors.white : Colors.grey, size: 24),
              ),
              Expanded(child: Container(width: 2, color: isLast ? Colors.transparent : stateColor)),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
                Text(subtitle, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ],
      ),
    );
  }
}