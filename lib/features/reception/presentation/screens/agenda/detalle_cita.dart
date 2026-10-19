

import 'package:flutter/material.dart';
import 'package:vet_innis_recepcion/core/theme.dart';
import 'package:vet_innis_recepcion/features/reception/data/cita_model.dart';

class DetalleCitaScreen extends StatelessWidget {
  final CitaModel cita;

  const DetalleCitaScreen({Key? key, required this.cita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color azul exacto de los botones del prototipo
    final Color azulExacto = const Color(0xFF2563EB);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Detalle de cita",
          style: TextStyle(
            color: AppTheme.darkBlue,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: AppTheme.darkBlue),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Tarjeta superior de Estado y Servicio
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      cita.estado,
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cita.servicio,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Manchas",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 2. Tarjeta con datos del paciente (ID, Raza, Teléfono)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: const [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("ID del paciente", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    trailing: Text("VC-1010", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.darkBlue)),
                  ),
                  Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Raza", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    trailing: Text("Criollo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.darkBlue)),
                  ),
                  Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Teléfono del dueño", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    trailing: Text("477 100 2001", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.darkBlue)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 3. Tarjeta con datos de la cita (Hora, Médico, Consultorio)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: const [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Hora", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    trailing: Text("9:00 am", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.darkBlue)),
                  ),
                  Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Médico", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    trailing: Text("Dra. Ibarra", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.darkBlue)),
                  ),
                  Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Consultorio", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    trailing: Text("Consultorio 4", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.darkBlue)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 4. Botones de acción administrativa (Proporcionados y limpios)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: azulExacto,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {},
                icon: const Icon(Icons.swap_horiz, color: Colors.white, size: 18),
                label: const Text("Reasignar consultorio", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEF2F6),
                  foregroundColor: AppTheme.darkBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {},
                icon: const Icon(Icons.person_outline, size: 18),
                label: const Text("Cambiar médico", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEF2F6),
                  foregroundColor: AppTheme.darkBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {},
                icon: const Icon(Icons.phone_outlined, size: 18),
                label: const Text("Contactar cliente", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEF2F6),
                  foregroundColor: AppTheme.darkBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {},
                icon: const Icon(Icons.check_circle_outline, size: 18),
                label: const Text("Marcar llegada", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16),

            // Botón de Concluir cita (Tamaño estándar, ya no gigante)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.done, color: Colors.white, size: 18),
                label: const Text("Concluir cita", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),

            // Botón de Cancelar cita
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDE8E8),
                  foregroundColor: const Color(0xFFD9534F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text("Cancelar cita", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),

            // Botón de Salir a la agenda
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Salir a la agenda", style: TextStyle(color: AppTheme.darkBlue, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}