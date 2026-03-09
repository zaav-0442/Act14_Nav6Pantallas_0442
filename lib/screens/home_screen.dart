import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          const Icon(
            Icons.flash_on,
            color: Color(0xFF00FFFF),
          ),
          const SizedBox(width: 10),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFFFF00FF)),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF0A0A0A),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                "SISTEMA CENTRAL",
                style: TextStyle(color: Color(0xFFFF00FF), fontSize: 24),
              ),
            ),
            _buildHoverMenuItem(context, "Cerrar Sesión"),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // --- CARRUSEL ---
          SizedBox(
            height: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    double scale = (1 - (_currentPage - index).abs() * 0.2)
                        .clamp(0.8, 1.0);
                    return Transform.scale(
                      scale: scale,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            // --- EL TOQUE NEÓN ---
                            border: Border.all(
                              color: const Color(0xFF00FFFF),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00FFFF).withOpacity(0.5),
                                blurRadius: 15,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                'https://raw.githubusercontent.com/zaav-0442/Act13_Navegacion3PantallasNegocio/refs/heads/main/assets/promo${index + 1}.webp',
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xFF00FFFF),
                                        ),
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                      Icons.broken_image,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Flecha Izquierda
                Positioned(
                  left: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                // Flecha Derecha
                Positioned(
                  right: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // --- CATEGORÍAS ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "CATEGORÍAS",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Ver Más",
                    style: TextStyle(color: Color(0xFFFF00FF), fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              itemCount: 6,
              // --- SECCIÓN DE CATEGORÍAS ACTUALIZADA ---
              itemBuilder: (context, index) => Container(
                width: 120,
                margin: const EdgeInsets.only(right: 15, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  // --- ACENTO ROSA NEÓN ---
                  border: Border.all(color: const Color(0xFFFF00FF), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF00FF).withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: AspectRatio(
                    aspectRatio:
                        1 / 1,
                    child: Image.network(
                      'https://raw.githubusercontent.com/zaav-0442/Act13_Navegacion3PantallasNegocio/main/assets/cat${index + 1}.webp',
                      key: ValueKey(
                        'cat_${index}_${DateTime.now().second}',
                      ),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFFFF00FF),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        print("Error cargando imagen: $error");
                        return const Icon(
                          Icons.broken_image,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHoverMenuItem(BuildContext context, String title) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Color(0xFF00FFFF))),
      hoverColor: const Color(0xFFFF00FF).withOpacity(0.2),
      onTap: () => Navigator.pushReplacementNamed(context, '/login'),
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
