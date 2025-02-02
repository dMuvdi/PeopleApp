class User {
  final int id;
  final String name;
  final String phone;
  final String phoneExt;
  final String email;
  bool? isShowing = true;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.phoneExt,
    this.isShowing
  });

  // Factory constructor to create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'].toString().contains('x') ? json['phone'].toString().split(" x")[0] : json['phone'],
      phoneExt: json['phone'].toString().contains('x') ? json['phone'].toString().split(" x")[1] : 'Sin Extensión',
      email: json['email'],
      isShowing: true,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'email': email,
    'isShowing':true
  };
}
