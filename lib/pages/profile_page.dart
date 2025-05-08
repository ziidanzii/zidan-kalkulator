import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil")),
      body: Center(
  child: Container(
    constraints: BoxConstraints(
      minWidth: 100,
      maxWidth: 200,
    ),
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/profile.png', width: 100, height: 100, fit: BoxFit.cover),
        SizedBox(height: 10),
        Text("Nama: ziidann", style: TextStyle(fontSize: 20)),
        Text("Email: ziidann@gmail.com", style: TextStyle(fontSize: 16)),
      ],
    ),
  ),
),

    );
  }
}
