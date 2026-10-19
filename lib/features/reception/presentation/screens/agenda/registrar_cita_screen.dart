import 'package:flutter/material.dart';
import '../../../../../core/theme.dart';

class RegistrarCitaScreen extends StatefulWidget {
  const RegistrarCitaScreen({Key? key}) : super(key: key);

  @override
  State<RegistrarCitaScreen> createState() => _RegistrarCitaScreenState();
}

class _RegistrarCitaScreenState extends State<RegistrarCitaScreen> {
  // Color exacto azul brillante de tus botones en el mockup
  final Color _azulExacto = const Color(0xFF2563EB);

  bool _esPacienteRegistrado = true;

  // Opciones de color limpias (sin mezclar "Manchado / Otro")
  String _colorSeleccionado = "Blanco";
  final TextEditingController _otroColorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Agregar cita",
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
            const Text(
              "Para citas tomadas por teléfono o en mostrador.",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 16),

            // Selector de pestañas con el tono de azul exacto de la imagen
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _esPacienteRegistrado = true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _esPacienteRegistrado ? _azulExacto : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Paciente registrado",
                          style: TextStyle(
                            color: _esPacienteRegistrado ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _esPacienteRegistrado = false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: !_esPacienteRegistrado ? _azulExacto : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Paciente nuevo",
                          style: TextStyle(
                            color: !_esPacienteRegistrado ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- VISTA CONDICIONAL SEGÚN LA PESTAÑA ---
            if (_esPacienteRegistrado) ...[
              // PACIENTE REGISTRADO
              const Text(
                "Buscar por teléfono, dueño o mascota",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "Ej. Teresa Asanza o 418182...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.pets, color: Color(0xFF2563EB)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Max · Labrador (Dueño: Teresa Asanza)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          Text("Tel: 418 182 0775", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
              ),
            ] else ...[
              // PACIENTE NUEVO
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Nombre de mascota", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Ej. Luna",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
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
                        const Text("Especie", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Ej. Perro",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Text("Categoría", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
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
                    value: "Especies pequeñas",
                    isExpanded: true,
                    items: <String>['Especies pequeñas', 'Exóticos', 'Grandes especies']
                        .map((String value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                        .toList(),
                    onChanged: (_) {},
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Selector de Color limpio (Blanco, Negro, Café, Miel, Manchado, Otro)
              const Text("Color de la mascota", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
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
                    value: _colorSeleccionado,
                    isExpanded: true,
                    items: <String>['Blanco', 'Negro', 'Café', 'Miel', 'Manchado', 'Otro']
                        .map((String value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _colorSeleccionado = val!;
                      });
                    },
                  ),
                ),
              ),

              // SI SE SELECCIONA "Otro", APARECE UN CAMPO DE TEXTO LIBRE PARA ESCRIBIR
              if (_colorSeleccionado == "Otro") ...[
                const SizedBox(height: 12),
                TextField(
                  controller: _otroColorController,
                  decoration: InputDecoration(
                    hintText: "Especifique el color...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                  ),
                ),
              ],
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Raza", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Ej. Labrador",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
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
                        const Text("Edad (años)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
                        const SizedBox(height: 8),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Ej. 2",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Text("Nombre del dueño", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "Ej. Mariana López",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                ),
              ),
              const SizedBox(height: 16),

              const Text("Teléfono del dueño", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "477 123 4567",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                ),
              ),
            ],

            const SizedBox(height: 24),

            // --- CAMPOS DE LA CITA ---
            const Text("Servicio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
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
                  value: "Consulta general",
                  isExpanded: true,
                  items: <String>['Consulta general', 'Vacunación', 'Desparasitación', 'Cirugía', 'Limpieza dental']
                      .map((String value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                      .toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Médico", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
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
                            value: "Dra. Ibarra",
                            isExpanded: true,
                            items: <String>['Dra. Ibarra', 'Dr. Soto', 'Dra. Cobos']
                                .map((String value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                                .toList(),
                            onChanged: (_) {},
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
                      const Text("Consultorio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
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
                            value: "Consultorio 4",
                            isExpanded: true,
                            items: <String>['Consultorio 1', 'Consultorio 2', 'Consultorio 3', 'Consultorio 4']
                                .map((String value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                                .toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            const Text("Hora", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkBlue)),
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
                  value: "10:00 am",
                  isExpanded: true,
                  items: <String>['9:00 am', '10:00 am', '11:30 am', '1:00 pm']
                      .map((String value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                      .toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- BOTÓN PRINCIPAL CON EL AZUL EXACTO ---
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _azulExacto,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Guardar cita", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFD9534F),   
                  foregroundColor: Colors.white,            
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