import 'package:firstproject/admin/category/view_product_two.dart';
import 'package:firstproject/admin/category/view_product_three.dart';
import 'package:firstproject/admin/category/view_product_one.dart';
import 'package:flutter/material.dart';

class Viewcategory extends StatelessWidget {
  const Viewcategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text('CATEGORY'),
      ),
      body: ListView(
        children: [
          const SectionHeader(title: 'Select category'),
          SettingsItem(
            icon: Icons.category,
            title: 'biriyani',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Viewproduct()),
              );
            },
          ),
          SettingsItem(
            icon: Icons.category,
            title: 'burger',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Viewproducttwo()),
              );
            },
          ),
          SettingsItem(
            icon: Icons.category,
            title: 'juices',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Viewproductthree()),
              );
            },
          ),
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
      color: Colors.blueGrey,
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
