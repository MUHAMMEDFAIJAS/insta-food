import 'package:firstproject/admin/adminfunction/add_screen.dart';
import 'package:firstproject/admin/adminfunction/admin_function.dart';
import 'package:firstproject/admin/chart_page.dart';
import 'package:firstproject/admin/view_category.dart';

import 'package:flutter/material.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text('admin page'),
      ),
      body: ListView(
        children: [
          const SectionHeader(title: 'About'),
          SettingsItem(
              icon: Icons.add_shopping_cart_rounded,
              title: 'add product',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Addscreen()));
              }),
          SettingsItem(
              icon: Icons.view_compact_rounded,
              title: 'view products',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Viewcategory()));
              }),
          SettingsItem(
            icon: Icons.list,
            title: 'chart',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BarChart(),
                ),
              );
            },
          ),
          SettingsItem(
              icon: Icons.delete_forever,
              title: 'delete all products',
              onTap: () {
                deleteall();
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
      color: Colors.grey.shade300,
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
