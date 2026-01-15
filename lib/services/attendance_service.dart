import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/attendance_model.dart';

class AttendanceService {
  final _client = Supabase.instance.client;

  Future<List<Attendance>> fetchMyAttendance() async {
    final res = await _client.from('attendance').select();

    return (res as List)
        .map((e) => Attendance.fromMap(e))
        .toList();
  }
}
