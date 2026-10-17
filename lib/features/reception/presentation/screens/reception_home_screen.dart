import 'package:flutter/material.dart';
import '../../../../core/theme.dart';
import 'agenda_screen.dart';

class ReceptionHomeScreen extends StatefulWidget {
  const ReceptionHomeScreen({Key? key}) : super(key: key);

  @override
  State<ReceptionHomeScreen> createState() => _ReceptionHomeScreenState();
}

class _ReceptionHomeScreenState extends State<ReceptionHomeScreen> {
  int _currentIndex = 0;

  // Lista de pantallas principales para cada pestaña inferior
  final List<Widget> _screens = [
    const AgendaScreen(),
    const Center(child: Text("Pantalla de Avisos")),
    const Center(child: Text("Pantalla de Domicilio")),
    const Center(child: Text("Pantalla de Perfil")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryBlue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined),
            label: 'Domicilio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}