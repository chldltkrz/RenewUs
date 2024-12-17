import 'package:renewus/data/model/appointment.dart';

class User {
  String id;
  String userEmail;
  String userName;
  String password;
  List<Appointment> appointments;
  String imageUrl;
  int chargedMoney;
  DateTime createdAt;

  User({
    required this.id,
    required this.userEmail,
    required this.userName,
    required this.password,
    required this.appointments,
    required this.imageUrl,
    required this.chargedMoney,
    required this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          userEmail: json['userEmail'],
          userName: json['userName'],
          password: json['password'],
          appointments: json['appointments'],
          imageUrl: json['imageUrl'],
          chargedMoney: json['chargedMoney'],
          createdAt: DateTime.parse(json['createdAt']),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userEmail': userEmail,
        'userName': userName,
        'password': password,
        'appointments': appointments,
        'imageUrl': imageUrl,
        'chargedMoney': chargedMoney,
        'createdAt': createdAt.toIso8601String(),
      };
}
