import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/menu.dart'; // Sesuaikan dengan nama package proyekmu
// TODO: Impor halaman ProjectFormPage jika sudah dibuat (nanti kita aktifkan setelah form dibuat)

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Bagian Drawer Header
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Portfolio',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore personal projects and experiences!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          
          // Bagian Routing Menu Utama (Home)
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          
          // Bagian Routing ke Halaman Tambah Proyek
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Project'),
            onTap: () {
              // TODO: Navigasi ke ProjectFormPage akan diisi setelah halamannya dibuat
            },
          ),
        ],
      ),
    );
  }
}