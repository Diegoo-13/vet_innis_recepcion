import 'package:flutter/material.dart';
import '../../../../core/theme.dart';

class RegistrarCitaScreen extends StatelessWidget {
  const RegistrarCitaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Cita"),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Paciente / Mascota")),
            const SizedBox(height: 12),
            const TextField(decoration: InputDecoration(labelText: "Servicio")),
            const SizedBox(height: 12),
            const TextField(decoration: InputDecoration(labelText: "Médico asignado")),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryBlue),
                onPressed: () => Navigator.pop(context),
                child: const Text("Guardar cita", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}