class CitaModel {
  final String id;
  final String hora;
  final String servicio;
  final String detalle;
  final String estado; // Confirmada, Conflicto, Pendiente

  CitaModel({
    required this.id,
    required this.hora,
    required this.servicio,
    required this.detalle,
    required this.estado,
  });
}