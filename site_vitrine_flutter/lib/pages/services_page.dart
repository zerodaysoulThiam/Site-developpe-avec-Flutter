import 'package:flutter/material.dart';
import 'navbar.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nos Services'),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade800, Colors.blue.shade600],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade500],
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Nos Offres de Services",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Des solutions digitales sur mesure pour transformer votre vision en réalité",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade700,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Démarrer un projet",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // Pourquoi nous choisir
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade50, Colors.white],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade100,
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pourquoi choisir Digital Solutions ?",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Nous combinons expertise technique, créativité et approche centrée utilisateur pour créer des solutions qui répondent parfaitement à vos besoins. Chaque projet est unique et bénéficie de notre approche personnalisée.",
                    style: TextStyle(fontSize: 18, height: 1.6),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      _buildReasonCard(Icons.rocket_launch, "Innovation continue", "Nous restons à la pointe des technologies"),
                      _buildReasonCard(Icons.people, "Équipe experte", "Des professionnels passionnés par leur métier"),
                      _buildReasonCard(Icons.verified_user, "Qualité garantie", "Process rigoureux de contrôle qualité"),
                      _buildReasonCard(Icons.support_agent, "Support premium", "Accompagnement continu après livraison"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            
            // Services
            const Center(
              child: Text(
                "Nos Services",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Des solutions complètes pour votre transformation digitale",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 40),
            
            // Service Cards
            _buildAnimatedServiceCard(
              context,
              "Développement Web",
              Icons.web,
              Colors.blue,
              "Des sites vitrines élégants aux applications web complexes. Nous créons des solutions web performantes, sécurisées et évolutives.",
              ["Sites vitrines", "E-commerce", "Applications métier", "Portails web"],
            ),
            _buildAnimatedServiceCard(
              context,
              "Applications Mobiles",
              Icons.phone_iphone,
              Colors.green,
              "Applications natives et cross-platform pour iOS et Android. Des solutions mobiles intuitives et performantes pour vos utilisateurs.",
              ["Applications natives", "Solutions cross-platform", "Applications métier", "Jeux mobiles"],
            ),
            _buildAnimatedServiceCard(
              context,
              "UI/UX Design",
              Icons.design_services,
              Colors.orange,
              "Design d'interfaces utilisateur modernes et expériences utilisateur optimisées. Nous créons des produits qui plaisent et qui fonctionnent.",
              ["Design d'interface", "UX Research", "Prototypage", "Design System"],
            ),
            _buildAnimatedServiceCard(
              context,
              "Conseil Digital",
              Icons.lightbulb_outline,
              Colors.purple,
              "Stratégie digitale, audit et accompagnement. Nous vous aidons à définir et mettre en œuvre votre transformation numérique.",
              ["Stratégie digitale", "Audit technique", "Formation", "Accompagnement"],
            ),
            
            // Client Logos
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "Ils nous font confiance",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildClientLogo(Icons.ac_unit, "Arctic"),
                  _buildClientLogo(Icons.business, "Corpo"),
                  _buildClientLogo(Icons.shopping_cart, "MarketPro"),
                  _buildClientLogo(Icons.school, "EduTech"),
                  _buildClientLogo(Icons.health_and_safety, "HealthPlus"),
                ],
              ),
            ),
            
            // Testimonials
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Icon(Icons.format_quote, size: 50, color: Colors.blue),
                  const SizedBox(height: 20),
                  const Text(
                    "Digital Solutions a complètement transformé notre présence digitale. Leur équipe a su comprendre nos besoins spécifiques et livrer une solution qui dépasse nos attentes.",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Marie Dubois, Directrice Marketing",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) => 
                      const Icon(Icons.star, color: Colors.amber, size: 20)
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.blue,
                      elevation: 0,
                    ),
                    child: const Text("Voir plus de témoignages"),
                  ),
                ],
              ),
            ),
            
            // Contact Banner
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade800, Colors.blue.shade600],
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Prêt à concrétiser votre projet ?",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Contactez-nous pour une consultation gratuite et sans engagement",
                    style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade800,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Nous contacter",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     
    );
  }

  Widget _buildReasonCard(IconData icon, String title, String text) {
    return SizedBox(
      width: 280,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 30, color: Colors.blue.shade700),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(text, style: TextStyle(color: Colors.grey.shade700)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedServiceCard(BuildContext context, String title, IconData icon, Color color, String description, List<String> features) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: _buildServiceCard(title, icon, color, description, features),
    );
  }

  Widget _buildServiceCard(String title, IconData icon, Color color, String description, List<String> features) {
    return Card(
      margin: const EdgeInsets.only(bottom: 30),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 40, color: color),
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              description,
              style: const TextStyle(fontSize: 18, height: 1.6),
            ),
            const SizedBox(height: 20),
            const Text(
              "Ce que nous offrons :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: features.map((feature) => Chip(
                label: Text(feature),
                backgroundColor: color.withOpacity(0.1),
                labelStyle: TextStyle(color: color),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              )).toList(),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("En savoir plus"),
                ),
                const SizedBox(width: 15),
                TextButton(
                  onPressed: () {},
                  child: Text("Voir des exemples", style: TextStyle(color: color)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClientLogo(IconData icon, String name) {
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30, color: Colors.blue.shade700),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}