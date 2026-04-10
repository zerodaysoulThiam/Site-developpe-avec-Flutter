import 'package:flutter/material.dart';

class MyNavbar extends StatelessWidget implements PreferredSizeWidget {
  const MyNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Sécurité Numérique SN', style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      )),
      centerTitle: false,
      actions: [
        if (MediaQuery.of(context).size.width > 800) ...[
          _buildNavButton(context, "Accueil", '/'),
          _buildNavButton(context, "À propos", '/about'),
          _buildNavButton(context, "Services", '/services'),
          _buildNavButton(context, "Contact", '/contact'),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/auth'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A64D9),
                foregroundColor: Colors.white,
              ),
              child: const Text("Connexion"),
            ),
          ),
        ] else ...[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _showMobileMenu(context),
          ),
        ],
      ],
    );
  }

  Widget _buildNavButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('À propos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            leading: const Icon(Icons.design_services),
            title: const Text('Services'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/services');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Connexion'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/auth');
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}