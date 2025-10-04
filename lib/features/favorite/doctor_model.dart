class Doctor {
  final String name;
  final String specialty;
  final String image;

  Doctor({
    required this.name,
    required this.specialty,
    required this.image,
  });

  // Factory constructor to create a Doctor from a Map
  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      name: map['name'] as String,
      specialty: map['specialty'] as String,
      image: map['image'] as String,
    );
  }

  // Convert Doctor to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialty': specialty,
      'image': image,
    };
  }
}