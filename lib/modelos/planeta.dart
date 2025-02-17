class Planeta {
  int? id;
  String nome;
  double tamanho;
  double distancia;
  String? apelido;

  // Construtor principal
  Planeta({
    this.id,
    required this.nome,
    required this.tamanho,
    required this.distancia,
    this.apelido,
  });

  // Construtor alternativo para criar um planeta vazio
  Planeta.vazio()
      : nome = '',
        tamanho = 0.0,
        distancia = 0.0,
        apelido = '';

  // Converter um Map (do banco de dados) para um objeto Planeta
  factory Planeta.fromMap(Map<String, dynamic> map) {
    return Planeta(
      id: map['id'],
      nome: map['nome'] ?? '',
      tamanho: (map['tamanho'] as num).toDouble(), // Garante que seja double
      distancia: (map['distancia'] as num).toDouble(),
      apelido: map['apelido'] as String?,
    );
  }

  // Converter um objeto Planeta para um Map (para salvar no banco)
  Map<String, dynamic> toMap() {
    final map = {
      'nome': nome,
      'tamanho': tamanho,
      'distancia': distancia,
      'apelido': apelido,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }
}
