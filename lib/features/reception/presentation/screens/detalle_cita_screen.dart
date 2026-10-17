import 'package:flutter/material.dart';
import '../../../../core/theme.dart';
import '../../data/cita_model.dart';

class DetalleCitaScreen extends StatelessWidget {
  final CitaModel cita;

  const DetalleCitaScreen({Key? key, required this.cita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de Cita"),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Estado: ${cita.estado}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            Text("Servicio: ${cita.servicio}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkBlue)),
            const SizedBox(height: 12),
            Text("Detalles del paciente:\n${cita.detalle}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => Navigator.pop(context),
                child: const Text("Concluir cita / Marcar llegada", style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}