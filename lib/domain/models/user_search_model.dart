class UserSearchModel{
  final int id;
  final String name;
  final bool? isFavorite;

  const UserSearchModel({
    required this.id,
    required this.name,
    this.isFavorite,
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isFavorite': isFavorite,
    };
  }

  factory UserSearchModel.fromMap(Map<String, dynamic> map) {
    return UserSearchModel(
      id: map['id'] as int,
      name: map['name'] as String,
      isFavorite: map['isFavorite'] as dynamic,
    );
  }



  UserSearchModel copyWith({
    int? id,
    String? name,
    bool? isFavorite,
  }) {
    return UserSearchModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}