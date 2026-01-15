import 'package:flutter/material.dart';
import '../services/attendance_service.dart';
import '../models/attendance_model.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = AttendanceService();

    return FutureBuilder<List<Attendance>>(
      future: service.fetchMyAttendance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!;

        if (data.isEmpty) {
          return const Center(child: Text('No attendance records'));
        }

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, i) {
            final a = data[i];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(a.subject),
                subtitle: Text(a.date),
                trailing: Text(a.status),
              ),
            );
          },
        );
      },
    );
  }
}
