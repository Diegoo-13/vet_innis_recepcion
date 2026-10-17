import 'package:flutter/material.dart';
import '../../../../core/theme.dart';
import '../../data/cita_model.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de citas ajustada exactamente al prototipo visual
    final List<CitaModel> listaCitas = [
      CitaModel(
        id: "1",
        hora: "9:00 am · Consulta general",
        servicio: "Consulta general",
        detalle: "Manchas · VC-1010 · Criollo\nDra. Ibarra · Consultorio 4",
        estado: "Confirmada",
      ),
      CitaModel(
        id: "2",
        hora: "9:30 am · Desparasitación",
        servicio: "Desparasitación",
        detalle: "Toby · VC-1011 · Schnauzer\nDr. Soto · Consultorio 2 · En sala",
        estado: "Confirmada",
      ),
      CitaModel(
        id: "3",
        hora: "11:00 am · Vacunación",
        servicio: "Vacunación",
        detalle: "Rocco · VC-1001 · Golden Retriever\nDra. Ibarra · Consultorio 2",
        estado: "Conflicto",
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              "Vet Care",
              style: TextStyle(
                color: AppTheme.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "RECEPCION",
                style: TextStyle(
                  color: AppTheme.primaryBlue,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado de Fecha y Botón de "+"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "AGENDA DE HOY",
                      style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Miércoles 14 de octubre",
                      style: TextStyle(color: AppTheme.darkBlue, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: AppTheme.darkBlue),
                    onPressed: () {
                      // Acción para registrar cita
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Botones superiores: "Registrar cirugía" y "Urgencias · guardia"
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEEF2F6),
                      foregroundColor: AppTheme.darkBlue,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.shield_outlined, size: 18),
                    label: const Text("Registrar cirugía", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFED477A), // Color rosado/rojo del mockup
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_active_outlined, size: 18),
                    label: const Text("Urgencias · guardia", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Buscador
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar por mascota, ID, teléfono o médico...",
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Filtros de Consultorios (Todos, C1, C2, C3, C4)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildChip("Todos", true),
                _buildChip("C1", false),
                _buildChip("C2", false),
                _buildChip("C3", false),
                _buildChip("C4", false),
              ],
            ),
            const SizedBox(height: 16),

            // Banner de Alerta de Conflictos
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFDE8E8),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF8D7DA)),
              ),
              child: Row(
                children: const [
                  Icon(Icons.shield_outlined, color: Color(0xFFD9534F)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "2 conflicto(s) de cita detectado(s) por sobrecupo de consultorio/médico. Requieren reasignación.",
                      style: TextStyle(fontSize: 12, color: Color(0xFF721C24)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Listado de Tarjetas de Citas
            ...listaCitas.map((cita) => _buildCitaCard(cita)).toList(),
          ],
        ),
      ),
    );
  }

  // Widget para los botones de filtro (C1, C2, etc.)
  Widget _buildChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryBlue : const Color(0xFFE9ECEF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  // Widget para las tarjetas de cita individuales idénticas al mockup
  Widget _buildCitaCard(CitaModel cita) {
    bool esConflicto = cita.estado == "Conflicto";

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: esConflicto ? Colors.red.shade300 : Colors.grey.shade200,
          width: esConflicto ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cita.hora,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.darkBlue),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: esConflicto ? Colors.red.shade50 : Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  cita.estado,
                  style: TextStyle(
                    color: esConflicto ? Colors.red : Colors.green.shade700,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            cita.detalle,
            style: const TextStyle(color: Colors.black54, fontSize: 13, height: 1.3),
          ),
        ],
      ),
    );
  }
}