import 'package:flutter/material.dart';
import 'package:flutter_project_4/pages/my_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://tlhxywkhqqtblagbypkx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRsaHh5d2tocXF0YmxhZ2J5cGt4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzY2NTYxMzMsImV4cCI6MTk5MjIzMjEzM30.kYYIzSS-0Jv8DS1xo4HMv6eNlYtORmrKK6Onju3teqk',
  );
  runApp(const MyApp());
}
