import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Header
         const UserAccountsDrawerHeader(
            accountEmail: Text(""),
            accountName: Text(""),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),


          ),

          // Sidebar Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height:40,
                ),
                SidebarItem(
                  icon: Icons.person,
                  title: "Reset Password",
                  onTap: () {
                    Navigator.pop(context);
                    // Reset password navigation logic
                  },
                ),

                const SizedBox(
                  height:15,
                ),

                SidebarItem(
                  icon: FontAwesomeIcons.signOutAlt,
                  title: "Log Out",
                  onTap: () {
                    Navigator.pop(context);
                    // Log out navigation logic
                  },
                ),

                const SizedBox(
                  height:15,
                ),


                SidebarItem(
                  icon: Icons.delete,
                  title: "Delete Account",
                  onTap: () {
                    Navigator.pop(context);
                    // Delete account navigation logic
                  },
                ),





              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Helper Widget for Sidebar Item
class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SidebarItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
          letterSpacing: 1.5),
        ),
        onTap: onTap,
      ),
    );
  }
}
