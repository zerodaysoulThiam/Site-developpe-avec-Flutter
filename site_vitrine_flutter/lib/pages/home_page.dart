import 'package:flutter/material.dart';
import 'package:site_vitrine_flutter/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;
    final isMobile = screenWidth <= 600;

    return Scaffold(
      appBar: const MyNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bannière principale avec responsivité
            Container(
              height: isDesktop ? 700 : isTablet ? 600 : 500,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0A192F),
                    Color(0xFF0F1C2E),
                    Color(0xFF121212),
                  ],
                ),
                image: DecorationImage(
                  image: const AssetImage('assets/images/circuit_bg.png'),
                  fit: BoxFit.cover,
                  opacity: 0.1,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 100 : isTablet ? 40 : 20,
                    vertical: 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo avec animation
                      AnimatedScale(
                        scale: 1,
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: isDesktop ? 150 : isTablet ? 120 : 100,
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                      // Titre avec responsivité
                      AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 700),
                        child: Text(
                          "SÉCURITÉ NUMÉRIQUE SN",
                          style: TextStyle(
                            fontSize: isDesktop ? 32 : isTablet ? 28 : 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 3,
                            shadows: [
                              Shadow(
                                blurRadius: 10,
                                color: Colors.blueAccent.withOpacity(0.5),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 15),
                      
                      // Slogan principal
                      AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 900),
                        child: Text(
                          "Protégez votre monde numérique",
                          style: TextStyle(
                            fontSize: isDesktop ? 48 : isTablet ? 36 : 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Sous-titre
                      AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 1100),
                        child: Text(
                          "Solutions de cybersécurité sur mesure pour les entreprises et particuliers",
                          style: TextStyle(
                            fontSize: isDesktop ? 22 : 18,
                            color: Colors.blueGrey[200],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 40),
                      
                      // Bouton CTA avec effet de profondeur
                      AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 1300),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/contact'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.tealAccent[400],
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                            textStyle: TextStyle(
                              fontSize: isDesktop ? 18 : 16,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 8,
                            shadowColor: Colors.tealAccent.withOpacity(0.5),
                          ),
                          child: const Text("DÉMARRER UNE ÉVALUATION GRATUITE"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Section services
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isDesktop ? 100 : 60,
                horizontal: isDesktop ? 40 : 20,
              ),
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        Text(
                          "NOS SOLUTIONS EXPERTES",
                          style: TextStyle(
                            fontSize: isDesktop ? 36 : 28,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0A192F),
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Protection complète contre les cybermenaces",
                          style: TextStyle(
                            fontSize: isDesktop ? 20 : 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                 
                  
                  // Grille de services responsive
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isDesktop ? 3 : isTablet ? 2 : 1,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    childAspectRatio: 0.85,
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 40 : 0,
                    ),
                    children: [
                      _buildSecurityService("Audit de Sécurité", Icons.security, Colors.blue, 
                          "Évaluation complète de votre infrastructure pour identifier les vulnérabilités"),
                      _buildSecurityService("Protection des Données", Icons.lock, Colors.green, 
                          "Chiffrement avancé et solutions de prévention des fuites de données"),
                      _buildSecurityService("Surveillance 24/7", Icons.monitor_heart, Colors.amber, 
                          "Détection et réponse aux menaces en temps réel"),
                      _buildSecurityService("Formation", Icons.school, Colors.purple, 
                          "Sensibilisation et formation de vos équipes aux bonnes pratiques"),
                      _buildSecurityService("Récupération", Icons.restore, Colors.red, 
                          "Plan de reprise après incident et récupération de données"),
                      _buildSecurityService("Cloud Sécurisé", Icons.cloud, Colors.teal, 
                          "Solutions cloud avec sécurité renforcée et conformité"),
                    ],
                  ),
                ],
              ),
            ),
            
            // Section à propos avec effet de parallaxe
            Container(
              height: isDesktop ? 700 : 900,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/about.jpeg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.7),
                padding: EdgeInsets.symmetric(
                  vertical: 60,
                  horizontal: isDesktop ? 100 : 20,
                ),
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: _buildAboutContent(),
                            ),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/shield1.jpg',
                                height: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildAboutContent(),
                          const SizedBox(height: 40),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/shield1.jpg',
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            
            // Section statistiques avec animation
            Container(
              padding: EdgeInsets.symmetric(vertical: isDesktop ? 100 : 60),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF0A192F),
                    const Color(0xFF0A192F).withOpacity(0.9),
                    const Color(0xFF121212),
                  ],
                ),
              ),
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        Text(
                          "NOTRE IMPACT",
                          style: TextStyle(
                            fontSize: isDesktop ? 36 : 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Chiffres clés de notre action",
                          style: TextStyle(
                            fontSize: isDesktop ? 20 : 18,
                            color: Colors.blueGrey[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  
                  // Grille de statistiques responsive
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isDesktop ? 4 : isTablet ? 2 : 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildStatistic("98%", "Menaces neutralisées"),
                      _buildStatistic("500+", "Clients protégés"),
                      _buildStatistic("24/7", "Surveillance continue"),
                      _buildStatistic("0", "Incidents majeurs"),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            
            // Témoignages avec effet de carte
            Container(
              padding: EdgeInsets.symmetric(
                vertical: isDesktop ? 100 : 60,
                horizontal: isDesktop ? 40 : 20,
              ),
              color: Colors.grey[100],
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        Text(
                          "ILS NOUS FONT CONFIANCE",
                          style: TextStyle(
                            fontSize: isDesktop ? 36 : 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: const Color(0xFF0A192F),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Ce que disent nos clients",
                          style: TextStyle(
                            fontSize: isDesktop ? 20 : 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  
                  // Grille de témoignages responsive
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isDesktop ? 3 : 1,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    childAspectRatio: isDesktop ? 0.8 : 1.1,
                    children: [
                      _buildSecurityTestimonial("Primature du Sénégal", "assets/images/prima.jpg", 
                          "Leur système de détection d'intrusion a empêché une attaque sophistiquée qui aurait coûté des millions."),
                      _buildSecurityTestimonial("Ministère des Armées", "assets/images/armee.jpg", 
                          "Solution de chiffrement conforme aux normes gouvernementales. Service exceptionnel."),
                      _buildSecurityTestimonial("SOMISEN", "assets/images/somisen.jpg", 
                          "Aucune violation de données depuis la mise en place de leur système de protection."),
                    ],
                  ),
                ],
              ),
            ),
            
            // Appel à l'action avec effet de gradient animé
            Container(
              padding: EdgeInsets.symmetric(
                vertical: isDesktop ? 120 : 80,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF0A192F),
                    const Color(0xFF0A192F).withOpacity(0.8),
                    const Color(0xFF121212),
                  ],
                ),
              ),
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        Text(
                          "PRÊT À SÉCURISER VOTRE NUMÉRIQUE ?",
                          style: TextStyle(
                            fontSize: isDesktop ? 40 : isTablet ? 32 : 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Contactez nos experts pour un audit de sécurité gratuit",
                          style: TextStyle(
                            fontSize: isDesktop ? 22 : 18,
                            color: Colors.blueGrey[200],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  
                  // Bouton avec effet de pulsation
                  TweenAnimationBuilder(
                    tween: Tween(begin: 1.0, end: 1.05),
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/contact'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent[400],
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 60 : 40,
                          vertical: isDesktop ? 25 : 20,
                        ),
                        textStyle: TextStyle(
                          fontSize: isDesktop ? 20 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 12,
                        shadowColor: Colors.tealAccent.withOpacity(0.7),
                      ),
                      child: const Text("DEMANDER UN AUDIT GRATUIT"),
                    ),
                  ),
                ],
              ),
            ),
            
            // Footer responsive
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: isDesktop ? 60 : 20,
              ),
              color: Colors.grey[900],
              child: Column(
                children: [
                  isDesktop
                      ? _buildDesktopFooter()
                      : _buildMobileFooter(),
                  const SizedBox(height: 40),
                  const Divider(color: Colors.blueGrey),
                  const SizedBox(height: 20),
                  Text(
                    "© 2025 Sécurité Numérique SN - Tous droits réservés | ISO 27001 Certified | Politique de confidentialité",
                    style: const TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "CERTIFICATIONS: ISO 27001 • CISSP • CISM • CEH",
                    style: TextStyle(
                      color: Colors.tealAccent[400],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
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

  // ================ Composants réutilisables ================
  
  Widget _buildAboutContent() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "NOTRE MISSION",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Sécurité Numérique SN protège les entreprises et les particuliers contre les cybermenaces croissantes. "
          "Fondée par des experts en cybersécurité, notre mission est de créer un environnement numérique sûr "
          "pour tous grâce à des solutions innovantes et une approche proactive.",
          style: TextStyle(
            fontSize: 18,
            height: 1.6,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 30),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          // children: [
          //   _buildSecurityFeature("Certifié ISO 27001", Icons.verified),
          //   _buildSecurityFeature("Équipe d'experts certifiés", Icons.people),
          //   _buildSecurityFeature("Support 24/7", Icons.support_agent),
          //   _buildSecurityFeature("Technologie de pointe", Icons.rocket_launch),
          // ],
        ),
      ],
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 60,
            ),
            const SizedBox(height: 20),
            const Text(
              "Votre partenaire en cybersécurité",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                IconButton(
                  onPressed: () {}, 
                  icon: Image.asset('assets/images/facebook.jpg', width: 24),
                ),
                IconButton(
                  onPressed: () {}, 
                  icon: Image.asset('assets/images/x.jpg', width: 24),
                ),
                IconButton(
                  onPressed: () {}, 
                  icon: Image.asset('assets/images/linkedin.jpg', width: 24),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "CONTACT",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text("📞 +221 77 123 45 67", style: TextStyle(color: Colors.white70)),
            const Text("📧 contact@securite-sn.sn", style: TextStyle(color: Colors.white70)),
            const Text("📍 Dakar, Sénégal", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text("Formulaire sécurisé", style: TextStyle(color: Colors.tealAccent)),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SOLUTIONS",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text("Audit de sécurité", style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Protection des données", style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Formation", style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Surveillance 24/7", style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 60,
        ),
        const SizedBox(height: 30),
        const Text(
          "Votre partenaire en cybersécurité",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {}, 
              icon: Image.asset('assets/images/facebook.jpg', width: 24),
            ),
            IconButton(
              onPressed: () {}, 
              icon: Image.asset('assets/images/x.jpg', width: 24),
            ),
            IconButton(
              onPressed: () {}, 
              icon: Image.asset('assets/images/linkedin.jpg', width: 24),
            ),
          ],
        ),
        const SizedBox(height: 40),
        const Text(
          "CONTACT",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        const Text("📞 +221 77 123 45 67", style: TextStyle(color: Colors.white70)),
        const Text("📧 contact@securite-sn.sn", style: TextStyle(color: Colors.white70)),
        const Text("📍 Dakar, Sénégal", style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: const Text("Formulaire sécurisé", style: TextStyle(color: Colors.tealAccent)),
        ),
        const SizedBox(height: 40),
        const Text(
          "SOLUTIONS",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("Audit de sécurité", style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Protection des données", style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Formation", style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Surveillance 24/7", style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSecurityService(String title, IconData icon, Color color, String description) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color(0xFF172A45),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  "EN SAVOIR PLUS",
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityFeature(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.tealAccent.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.tealAccent),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic(String value, String label) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0),
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
      builder: (context, number, child) {
        return Column(
          children: [
            Text(
              value.contains('%') 
                ? '${number.toInt()}%' 
                : value.contains('+')
                  ? '${number.toInt()}+'
                  : number.toInt().toString(),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.tealAccent,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.tealAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSecurityTestimonial(String company, String logoPath, String text) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey[100]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 25,
                    child: ClipOval(
                      child: Image.asset(
                        logoPath,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      company,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Icon(Icons.format_quote, size: 40, color: Colors.blueGrey),
              const SizedBox(height: 15),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}