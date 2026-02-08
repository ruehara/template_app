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
      id: (json['login']['uuid'] as String?) ?? '',
      age: (json['dob']['age'] as int?) ?? 0,
      name:
          '${(json['name']['first'] as String?) ?? 'Name'} ${(json['name']['last'] as String?) ?? 'Last'}',
      profilePicture: (json['picture']['large'] as String?) ?? '',
    );
  }
  @override
  String toString() =>
      'id:$id age:$age name:$name profilePicture:$profilePicture';
}
