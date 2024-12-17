class Appointment {
  String username;
  String counselorName;
  DateTime appointmentDate;
  String appointmentTime;
  bool extended;
  DateTime createdAt;
  bool finished;

  Appointment({
    required this.username,
    required this.counselorName,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.extended,
    required this.createdAt,
    required this.finished,
  });

  Appointment.fromJson(Map<String, dynamic> json)
      : this(
          username: json['username'],
          counselorName: json['counselorName'],
          appointmentDate: DateTime.parse(json['appointmentDate']),
          appointmentTime: json['appointmentTime'],
          extended: json['extended'],
          createdAt: DateTime.parse(json['createdAt']),
          finished: json['finished'],
        );

  Map<String, dynamic> toJson() => {
        'username': username,
        'counselorName': counselorName,
        'appointmentDate': appointmentDate.toIso8601String(),
        'appointmentTime': appointmentTime,
        'extended': extended,
        'createdAt': createdAt.toIso8601String(),
        'finished': finished,
      };
}
