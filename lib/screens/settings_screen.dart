// ignore_for_file: use_build_context_synchronously

import 'package:firstproject/admin/admin_page.dart';
import 'package:firstproject/screens/about_us.dart';
import 'package:firstproject/screens/buy_now.dart';
import 'package:firstproject/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.orange[300],
      ),
      body: ListView(
        children: [
          const SectionHeader(title: 'About'),
          SettingsItem(
            icon: Icons.info,
            title: 'About Us',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutUsPage()));
            },
          ),
          const SectionHeader(title: 'Orders'),
          SettingsItem(
            icon: Icons.shopping_cart,
            title: 'my orders',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BuyNowPage()));
            },
          ),
          SettingsItem(
              icon: Icons.admin_panel_settings,
              title: 'admin',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Adminpage()));
              }),
          SettingsItem(
              icon: Icons.logout,
              title: 'log out',
              onTap: () async {
                final sharedprf = await SharedPreferences.getInstance();
                await sharedprf.clear();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              })
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
