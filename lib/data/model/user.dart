import 'package:renewus/data/model/appointment.dart';
import 'package:renewus/data/model/counselor.dart';

class User {
  String? id;
  String? userId;
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
    required this.userId,
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
          id: json['id'] as String?,
          userId: json['userId'] as String?,
          userEmail: json['userEmail'] as String?,
          userName: json['userName'] as String?,
          appointments:
              (json['appointments'] != null && json['appointments'] is List)
                  ? (json['appointments'] as List)
                      .map((item) => Appointment.fromJson(item))
                      .toList()
                  : [], // Default to empty list if null
          favoriteCounselors: (json['favoriteCounselors'] != null &&
                  json['favoriteCounselors'] is List)
              ? (json['favoriteCounselors'] as List)
                  .map((item) => Counselor.fromJson(item))
                  .toList()
              : [], // Default to empty list if null
          imageUrl: json['imageUrl'] as String? ??
              '', // Default to empty string if null
          chargedMoney:
              json['chargedMoney'] as int? ?? 0, // Default to 0 if null
          isCounselor:
              json['isCounselor'] as bool? ?? false, // Default to false if null
          createdAt: json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt'])
              : null, // Avoid parsing errors
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
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
