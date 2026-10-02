import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240136/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String username; // INI VARIABLE YG BUAT NERIMA EMAIL DARI LOGIN
  const ProfileScreen({super.key, required this.username}); // TRUS INI BUAT YG NAMPUNG EMAIL NYA

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.deepPurple[100],
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 16),

          Text(
            "Username",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4),

          // TEKS BUAT NAMPILIN EMAIL YG DIKIRIM DARI LOGIN
          Text(
            username, // VARIABLE EMAIL NYA DIPANGGIL DISINIH
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          
          // INI TOMBOL LOGOUT NYA
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            }, 
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}