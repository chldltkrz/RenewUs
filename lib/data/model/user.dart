import 'package:renewus/data/model/appointment.dart';
import 'package:renewus/data/model/counselor.dart';

class User {
  String? id;
  String? userEmail;
  String? userName;
  List<Appointment>? appointments;
  List<Counselor>? favoriteCounselors;
  String? imageUrl;
  int? chargedMoney;
  bool? isCounselor;
  DateTime? createdAt;

  User({
    required this.id,
    required this.userEmail,
    required this.userName,
    required this.appointments,
    required this.favoriteCounselors,
    required this.imageUrl,
    required this.chargedMoney,
    required this.isCounselor,
    required this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          userEmail: json['userEmail'],
          userName: json['userName'],
          appointments: json['appointments'] is List
              ? (json['appointments'] as List<dynamic>)
                  .map((item) => Appointment.fromJson(item))
                  .toList()
              : [], // Default to empty list if it's not a List
          favoriteCounselors: json['favoriteCounselors'] is List
              ? (json['favoriteCounselors'] as List<dynamic>)
                  .map((item) => Counselor.fromJson(item))
                  .toList()
              : [], // Default to empty list if it's not a List
          imageUrl: json['imageUrl'],
          chargedMoney: json['chargedMoney'],
          isCounselor: json['isCounselor'],
          createdAt: DateTime.parse(json['createdAt']),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userEmail': userEmail,
        'userName': userName,
        'appointments': appointments,
        'favoriteCounselors': favoriteCounselors,
        'imageUrl': imageUrl,
        'chargedMoney': chargedMoney,
        'isCounselor': isCounselor,
        'createdAt': createdAt?.toIso8601String(),
      };
}
