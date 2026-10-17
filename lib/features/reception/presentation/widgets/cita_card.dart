import 'package:flutter/material.dart';
import '../../data/cita_model.dart';

class CitaCard extends StatelessWidget {
  final CitaModel cita;
  final VoidCallback onTap;

  const CitaCard({Key? key, required this.cita, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Definimos el color del estado dinámicamente
    Color estadoColor = Colors.green;
    if (cita.estado == 'Conflicto') estadoColor = Colors.red;
    if (cita.estado == 'Pendiente') estadoColor = Colors.orange;

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        onTap: onTap,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cita.hora,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: estadoColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                cita.estado,
                style: TextStyle(
                  color: estadoColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              cita.servicio,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D1B2A),
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              cita.detalle,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}