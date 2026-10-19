import 'package:flutter/material.dart';
import 'package:vet_innis_recepcion/core/theme.dart';
import 'package:vet_innis_recepcion/features/reception/data/cita_model.dart';

class DetalleCitaScreen extends StatelessWidget {
  final CitaModel cita;

  const DetalleCitaScreen({Key? key, required this.cita}) : super(key: key);

  // Método para mostrar el BottomSheet de Reasignar Consultorio
  void _mostrarModalReasignar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Reasignar consultorio",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkBlue,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Cita de Manchas a las 9:00 am.",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 20),
              _buildConsultorioOption(context, "Consultorio 1"),
              const SizedBox(height: 10),
              _buildConsultorioOption(context, "Consultorio 2"),
              const SizedBox(height: 10),
              _buildConsultorioOption(context, "Consultorio 3"),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFC0392B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget auxiliar para opciones de consultorio
  Widget _buildConsultorioOption(BuildContext context, String consultorio) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF1F3F5),
          foregroundColor: AppTheme.darkBlue,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Cita reasignada a $consultorio")),
          );
        },
        child: Text(
          consultorio,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Widget auxiliar para opciones de médico
  Widget _buildMedicoOption(BuildContext context, String medico) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF1F3F5),
          foregroundColor: AppTheme.darkBlue,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Médico actualizado a $medico")),
          );
        },
        child: Text(
          medico,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Método para mostrar el BottomSheet de Cambiar Médico
  void _mostrarModalCambiarMedico(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Cambiar médico",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkBlue,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Cita de Manchas a las 9:00 am.",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 20),
              _buildMedicoOption(context, "Dr. Soto"),
              const SizedBox(height: 10),
              _buildMedicoOption(context, "Dra. Cobos"),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFC0392B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Método para mostrar el BottomSheet de Contactar Cliente
  void _mostrarModalContactarCliente(BuildContext context) {
    final Color azulExacto = const Color(0xFF2563EB);
    final Color verdeWhatsapp = const Color(0xFF00E676);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Contactar cliente",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkBlue,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Dueño de Manchas · 477 100 2001.",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 20),

              // Botón Llamar (Azul principal)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulExacto,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // Lógica para llamar
                  },
                  icon: const Icon(Icons.phone_outlined, size: 18),
                  label: const Text("Llamar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 12),

              // Botón WhatsApp (Verde oficial exacto de la 2da imagen)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verdeWhatsapp,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // Lógica para WhatsApp
                  },
                  icon: const Icon(Icons.send_outlined, size: 18),
                  label: const Text("WhatsApp", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 12),

              // Botón Cerrar
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F3F5),
                    foregroundColor: AppTheme.darkBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cerrar",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            // 1. Tarjeta superior: Estado, Servicio y Mascota
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
                        fontSize: 11,
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

            // 2. Datos del paciente
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

            // 3. Datos de la cita
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

            // 4. Botones de acción administrativa
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: azulExacto,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {
                  _mostrarModalReasignar(context);
                },
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
                onPressed: () {
                  _mostrarModalCambiarMedico(context);
                },
                icon: const Icon(Icons.person_outline, size: 18),
                label: const Text("Cambiar médico", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),

            // Conexión del botón "Contactar cliente" con su respectivo modal
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
                onPressed: () {
                  _mostrarModalContactarCliente(context);
                },
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

            // Botón de Concluir cita
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
                  backgroundColor: const Color(0xFFC0392B),
                  foregroundColor: Colors.white,
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