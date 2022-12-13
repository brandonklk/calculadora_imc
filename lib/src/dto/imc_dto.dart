class ImcDto {
  String id;
  String name;
  double height;
  double weight;
  String imc;

  ImcDto(
      {this.id = '',
      required this.name,
      required this.height,
      required this.weight,
      required this.imc});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'height': height,
      'weight': weight,
      'imc': imc
    };
  }

  static ImcDto fromJson(Map<String, dynamic> json) {
    return ImcDto(
        id: json['id'],
        name: json['name'],
        height: json['height'],
        weight: json['weight'],
        imc: json['imc']);
  }
}
