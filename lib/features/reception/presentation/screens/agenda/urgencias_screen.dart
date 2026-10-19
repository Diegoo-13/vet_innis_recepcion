import 'package:flutter/material.dart';
import '../../../../../core/theme.dart';

class UrgenciasScreen extends StatelessWidget {
  const UrgenciasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color azul exacto de los botones del mockup
    final Color azulBoton = const Color(0xFF2563EB);
    // Color rosa exacto del botón de WhatsApp del mockup
    final Color rosaBoton = const Color(0xFFED477A);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Urgencias y guardia",
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
            // Subtítulo de la sección
            const Text(
              "Médico(s) de guardia ahora:",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),

            // Tarjeta del médico de guardia (Dra. Cobos)
            Container(
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
              child: Row(
                children: [
                  // Icono circular azul con estetoscopio
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.medical_services_outlined,
                      color: Color(0xFF1B4965),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Información de la doctora
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Dra. Cobos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppTheme.darkBlue,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Medicina felina · 10:00 am – 6:00 pm",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Botón de Llamar a urgencias (Azul)
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: azulBoton,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 0,
                ),
                onPressed: () {
                  // Acción de llamada
                },
                icon: const Icon(Icons.phone_outlined, color: Colors.white, size: 20),
                label: const Text(
                  "Llamar a urgencias · 418 690 4279",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Botón de WhatsApp (Rosa / Fucsia)
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00E676), // Color verde oficial de WhatsApp,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 0,
                ),
                onPressed: () {
                  // Acción de WhatsApp
                },
                icon: const Icon(Icons.send_outlined, color: Colors.white, size: 20),
                label: const Text(
                  "WhatsApp · 418 690 4279",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Botón de Cerrar
            SizedBox(
              width: double.infinity,
              height: 52,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cerrar",
                  style: TextStyle(
                    color: AppTheme.darkBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}