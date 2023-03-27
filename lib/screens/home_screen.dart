import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  PageController pageController = PageController(initialPage: 1);

  void onPageChanged(index) {
    setState(() {
      currentPage = index;
    });
  }

  void onTap(index) {
    print('Index: $index');
    currentPage = index;

    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* AppBAr
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purple,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.indigo[400],
        title: Text('Mi Viaje CR $currentPage'),
      ),
      //* Render Body CustomScreen(color: Colors.indigo.shade50)
      //? RENDER BODY

      body: PageView(
        //physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          CustomScreen(color: Color.fromARGB(255, 103, 115, 182)),
          CustomScreen(color: Color.fromRGBO(232, 234, 246, 1)),
          CustomScreen(color: Color.fromARGB(255, 103, 117, 111))
        ],
      ),

      //* TABS
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 212, 94, 16),
              Colors.purple,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: onTap,
          backgroundColor: Colors.indigo.shade50,
          selectedItemColor: Colors.indigo[400],
          //unselectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.travel_explore), label: 'Historial')
          ],
        ),
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  // Lo que esta comentado es una varible que es requerida

  final Color color;
  //final Color? color;

  const CustomScreen({Key? key, required this.color}) : super(key: key);
  //const CustomScreen({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: const Center(
        child: Text('Render Body '),
      ),
    );
  }
}
