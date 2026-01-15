class Attendance {
  final String subject;
  final String date;
  final String status;

  Attendance({
    required this.subject,
    required this.date,
    required this.status,
  });

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      subject: map['subject'],
      date: map['date'],
      status: map['status'],
    );
  }
}

