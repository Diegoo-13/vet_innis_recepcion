import 'package:flutter/material.dart';
import '../../../../../../core/theme.dart';

class AvisosScreen extends StatelessWidget {
  const AvisosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // El tono de verde brillante que definimos para WhatsApp
    final Color verdeWhatsapp = const Color(0xFF00E676);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado con título de la sección
              const Text(
                "RECORDATORIOS AUTOMATIZADOS",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Citas de mañana",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkBlue,
                ),
              ),
              const SizedBox(height: 16),

              // Tarjeta informativa superior (color rosita suave)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8E8),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.red.shade100),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.notifications_active_outlined, color: Colors.red.shade400, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Antes, recepción llamaba una por una. Ahora un solo botón manda el recordatorio por WhatsApp, un día antes, a todos los clientes con cita mañana.",
                        style: TextStyle(
                          color: Colors.red.shade900,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Lista de citas automatizadas
              _buildAvisoCard("Rocco · 10:00 am", "Mariana López · WhatsApp"),
              const SizedBox(height: 12),
              _buildAvisoCard("Mimi · 9:30 am", "Carlos Reyes · WhatsApp"),
              const SizedBox(height: 12),
              _buildAvisoCard("Nube · 1:00 pm", "Ana Torres · WhatsApp"),
              const SizedBox(height: 24),

              // Botón inferior para enviar recordatorios por WhatsApp
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verdeWhatsapp, // Verde WhatsApp (0xFF00E676)
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Recordatorios enviados por WhatsApp exitosamente")),
                    );
                  },
                  icon: const Icon(Icons.send_outlined, size: 20),
                  label: const Text(
                    "Enviar recordatorios por WhatsApp",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para las tarjetas de cada paciente
  Widget _buildAvisoCard(String titulo, String subtitulo) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkBlue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitulo,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],  
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Enviado por\nWhatsApp",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF23C552),
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}