class User{
  final String id;
  final String name;
  final int gender;
  final String email;
  final String password;
  final String productId;
  final int status;

  User({
    required this.id,
    required this.name,
    required this.gender,
    required this.email,
    required this.password,
    required this.productId,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    gender: json['gender'],
    email: json['email'],
    password: json['password'],
    productId: json['productId'],
    status: json['status'],
  );
}