class UserModel {
  final String id;
  final int age;
  final String name;
  final String profilePicture;

  UserModel({
    required this.id,
    required this.age,
    required this.name,
    required this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['login']['uuid'] ?? '',
      age: json['dob']['age'] ?? 0,
      name:
          '${json['name']['first'] ?? 'Name'} ${json['name']['last'] ?? 'Last'}',
      profilePicture: json['picture']['large'] ?? '',
    );
  }
  @override
  String toString() =>
      'id:$id age:$age name:$name profilePicture:$profilePicture';
}
