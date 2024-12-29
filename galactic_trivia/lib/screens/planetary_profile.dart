import 'package:flutter/material.dart';
import 'package:galactic/screens/planet_info.dart';
import 'package:galactic/screens/planet_structure.dart';

class HouseInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Planet Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 4,
      ),
      body: Center(
        child: Text(
          'Welcome to Planet Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}

class PlanetaryProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Planetary Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.png'), // Original background
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildInfoOption(
              context,
              'Planet Info',
              Icons.info_outline,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlanetInfoScreen()),
                );
              },
            ),
            _buildInfoOption(
              context,
              'Planet Structure',
              Icons.public,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SolarSystemScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoOption(BuildContext context, String title, IconData icon,
      VoidCallback onPressed) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        onTap: onPressed,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        leading: Icon(
          icon,
          size: 32,
          color: Colors.deepPurple,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
