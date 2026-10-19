import 'package:flutter/material.dart';
import 'package:vet_innis_recepcion/features/reception/presentation/screens/agenda/detalle_cita_screen.dart';
import 'package:vet_innis_recepcion/features/reception/presentation/screens/agenda/registrar_cirugia_screen.dart';
import 'package:vet_innis_recepcion/features/reception/presentation/screens/agenda/registrar_cita_screen.dart';
import 'package:vet_innis_recepcion/features/reception/presentation/screens/agenda/urgencias_screen.dart';

import '../../../../../core/theme.dart';
import '../../../data/cita_model.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  // Variable para saber qué botón de consultorio está seleccionado actualmente
  String _filtroSeleccionado = "Todos";

  // Lista original de citas (simulada)
  final List<CitaModel> _listaCitasOriginales = [
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
      detalle:
          "Rocco · VC-1001 · Golden Retriever\nDra. Ibarra · Consultorio 2",
      estado: "Conflicto",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Lógica para filtrar las citas según el consultorio seleccionado (C1, C2, C3, C4 o Todos)
    List<CitaModel> listaCitasFiltradas = _listaCitasOriginales.where((cita) {
      if (_filtroSeleccionado == "Todos") return true;
      // Busca si el detalle de la cita incluye el consultorio seleccionado (Ej. "Consultorio 2")
      return cita.detalle.contains(
        _filtroSeleccionado.replaceAll("C", "Consultorio "),
      );
    }).toList();

    // Contamos automáticamente si hay conflictos reales en la lista original
    final int totalConflictos = _listaCitasOriginales
        .where((c) => c.estado == "Conflicto")
        .length;

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
                color: Color(0xFF2563EB),
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
                  color: Color(0xFF2563EB),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
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
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Domingo 18 de octubre",
                      style: TextStyle(
                        color: AppTheme.darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
                      // AQUÍ ESTÁ LA NAVEGACIÓN HACIA EL FORMULARIO
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrarCitaScreen(),
                        ),
                      );
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
                    onPressed: () {
                      // NAVEGACIÓN HACIA REGISTRAR CIRUGÍA
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrarCirugiaScreen()),
                      );
                    },
                    icon: const Icon(Icons.shield_outlined, size: 18),
                    label: const Text("Registrar cirugía", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD9534F),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {  
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UrgenciasScreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_active_outlined,
                      size: 18,
                    ),
                    label: const Text(
                      "Urgencias · guardia",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

            // Filtros interactivos de Consultorios (Todos, C1, C2, C3, C4)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildConsultorioChip("Todos"),
                _buildConsultorioChip("C1"),
                _buildConsultorioChip("C2"),
                _buildConsultorioChip("C3"),
                _buildConsultorioChip("C4"),
              ],
            ),
            const SizedBox(height: 16),

            // Alerta de conflictos dinámica (Solo aparece si hay conflictos verdaderos)
            if (totalConflictos > 0) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8E8),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF8D7DA)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.shield_outlined, color: Color(0xFFD9534F)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "$totalConflictos conflicto(s) de cita detectado(s) por sobrecupo de consultorio/médico. Requieren reasignación.",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF721C24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Mensaje en caso de que un consultorio no tenga citas
            if (listaCitasFiltradas.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    "No hay citas registradas para este consultorio",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              )
            else
              // Listado dinámico de Tarjetas de Citas filtradas
              ...listaCitasFiltradas
                  .map((cita) => _buildCitaCard(context,cita))
                  .toList(),
          ],
        ),
      ),
    );
  }

  // Widget para construir los botones de consultorio interactivos
  Widget _buildConsultorioChip(String label) {
    bool isSelected = _filtroSeleccionado == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _filtroSeleccionado = label; // Actualiza el estado al hacer clic
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF2563EB) : const Color(0xFFE9ECEF),
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
      ),
    );
  }

  // Widget para las tarjetas de cita individuales
  Widget _buildCitaCard(BuildContext context, CitaModel cita) {
    bool esConflicto = cita.estado == "Conflicto";

    return GestureDetector(
      onTap: () {
        // NAVEGACIÓN HACIA EL DETALLE DE LA CITA
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleCitaScreen(cita: cita),
          ),
        );
      },
      child: Container(
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppTheme.darkBlue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: esConflicto
                        ? Colors.red.shade50
                        : Colors.green.shade50,
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
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 13,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
