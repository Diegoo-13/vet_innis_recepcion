import 'package:flutter/material.dart';
import '../../../../../core/theme.dart';

class RegistrarCirugiaScreen extends StatefulWidget {
  const RegistrarCirugiaScreen({Key? key}) : super(key: key);

  @override
  State<RegistrarCirugiaScreen> createState() => _RegistrarCirugiaScreenState();
}

class _RegistrarCirugiaScreenState extends State<RegistrarCirugiaScreen> {
  // Color azul exacto de los botones del prototipo
  final Color _azulExacto = const Color(0xFF2563EB);

  // Valores simulados para los selectores
  String _medicoSeleccionado = "Dra. Ibarra · Medicina interna";
  String _horaInicioSeleccionada = "9:00 am";
  String _duracionSeleccionada = "2 horas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Registrar cirugía",
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
            // Descripción explicativa de la funcionalidad
            const Text(
              "Mientras el médico esté en cirugía no tiene horarios disponibles; las citas de ese bloque se cancelan.",
              style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
            ),
            const SizedBox(height: 24),

            // Selector de Médico
            const Text(
              "Médico",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _medicoSeleccionado,
                  isExpanded: true,
                  items: <String>[
                    'Dra. Ibarra · Medicina interna',
                    'Dr. Soto · Cirugía general',
                    'Dra. Cobos · Medicina felina'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(fontSize: 13)),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _medicoSeleccionado = val!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Fila para "Inicia" y "Duración"
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Inicia",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _horaInicioSeleccionada,
                            isExpanded: true,
                            items: <String>['9:00 am', '10:00 am', '11:00 am', '1:00 pm', '4:00 pm']
                                .map((String value) => DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 13))))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _horaInicioSeleccionada = val!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Duración",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _duracionSeleccionada,
                            isExpanded: true,
                            items: <String>['1 hora', '2 horas', '3 horas', '4 horas']
                                .map((String value) => DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 13))))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _duracionSeleccionada = val!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Alerta dinámica de citas afectadas (idéntica al mockup)
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFFDE8E8),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF8D7DA)),
              ),
              child: const Text(
                "Se cancelarán 1 cita(s) de Dra. Ibarra: Manchas (9:00 am). Avisa a esos clientes por WhatsApp.",
                style: TextStyle(
                  color: Color(0xFF9C2C2C),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // --- BOTONES DE ACCIÓN ---
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _azulExacto,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {
                  // Acción para bloquear el horario y regresar a la agenda
                  Navigator.pop(context);
                },
                child: const Text(
                  "Bloquear horario y cancelar citas",
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
           // Botón de Cancelar corregido
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFD9534F), // El rojo intenso va aquí dentro de styleFrom
                  foregroundColor: Colors.white,            // El color blanco del texto va aquí dentro de styleFrom
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
      ),
    );
  }
}