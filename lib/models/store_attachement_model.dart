class StoreAttachement {
  final String id;
  final String name;
  final String type;
  final String imagePath;

  StoreAttachement({
    required this.id,
    required this.name,
    required this.type,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'imagePath': imagePath,
    };
  }

  factory StoreAttachement.fromMap(Map<String, dynamic> map) {
    return StoreAttachement(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      imagePath: map['imagePath'],
    );
  }
}
