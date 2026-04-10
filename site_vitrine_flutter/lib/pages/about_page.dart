import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;
    final isMobile = screenWidth <= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('À PROPOS DE NOUS'),
        backgroundColor: const Color(0xFF0A192F),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A192F),
              Color(0xFF121212),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isMobile ? 20 : 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bannière de mission (responsive)
              Container(
                padding: EdgeInsets.all(isMobile ? 20 : 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF172A45),
                      Color(0xFF121C33),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00B4DB).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.security,
                            size: 40,
                            color: Color(0xFF00B4DB),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: Text(
                            "NOTRE MISSION",
                            style: TextStyle(
                              fontSize: isMobile ? 24 : 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Protéger l'écosystème numérique sénégalais contre les cybermenaces grâce à des solutions innovantes et une expertise certifiée.",
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        height: 1.6,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Sécurité Numérique SN est née de la volonté de créer un bouclier numérique pour les entreprises et institutions africaines. Nos solutions combinent intelligence artificielle et expertise humaine pour anticiper et neutraliser les menaces cybernétiques.",
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        height: 1.6,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildMissionBadge("ISO 27001 Certified", Icons.verified),
                        _buildMissionBadge("Experts CISSP", Icons.people),
                        _buildMissionBadge("24/7 Threat Monitoring", Icons.monitor_heart),
                        _buildMissionBadge("Zero Trust Architecture", Icons.lock),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // Notre histoire
              Text(
                "NOTRE HISTOIRE",
                style: TextStyle(
                  fontSize: isMobile ? 24 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              _buildSecurityTimeline(isMobile),
              const SizedBox(height: 40),
              
              // Notre équipe
              Text(
                "L'ÉQUIPE D'ÉLITE",
                style: TextStyle(
                  fontSize: isMobile ? 24 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Des experts certifiés en cybersécurité dédiés à votre protection",
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 30),
              
              // Grille responsive pour l'équipe
              GridView.count(
                crossAxisCount: isDesktop ? 4 : (isTablet ? 2 : 1),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: isMobile ? 0.9 : 0.85,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildSecurityExpert("Binetou Barry", "CEO & Fondatrice", "CISSP, CISM", "assets/images/fatou.jpg"),
                  _buildSecurityExpert("Mouhamed Thiam", "CTO", "CEH, OSCP", "assets/images/mouha.jpg"),
                  _buildSecurityExpert("Olivia Diallo", "Responsable Pentest & IOT", "OSCP, eCPPT", "assets/images/olivia.jpg"),
                  _buildSecurityExpert("Khadidiatou Thiam", "DevSecOps", "AWS Security, CISSP", "assets/images/khady.jpg"),
                ],
              ),
              const SizedBox(height: 40),
              
              // Nos valeurs
              Text(
                "NOS VALEURS FONDAMENTALES",
                style: TextStyle(
                  fontSize: isMobile ? 24 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              // Grille responsive pour les valeurs
              GridView.count(
                crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: isMobile ? 1.1 : 1.2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildSecurityValue(Icons.lightbulb_outline, "INNOVATION", "Nous développons des solutions avant-gardistes pour contrer les menaces émergentes"),
                  _buildSecurityValue(Icons.gpp_good, "INTÉGRITÉ", "Transparence absolue dans nos processus et recommandations"),
                  _buildSecurityValue(Icons.rocket_launch, "EXCELLENCE", "Qualité militaire dans chaque service rendu"),
                  _buildSecurityValue(Icons.handshake, "PARTENARIAT", "Votre sécurité est notre responsabilité partagée"),
                  _buildSecurityValue(Icons.visibility, "VIGILANCE", "Surveillance permanente des écosystèmes numériques"),
                ],
              ),
              const SizedBox(height: 40),
              
              // Certifications
              Container(
                padding: EdgeInsets.all(isMobile ? 15 : 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF172A45),
                      Color(0xFF121C33),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CERTIFICATIONS ET PARTENARIATS",
                      style: TextStyle(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Grille responsive pour les certifications
                    GridView.count(
                      crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 2.5,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: [
                        _buildCertificationBadge("ISO 27001", "Systèmes de gestion de la sécurité de l'information"),
                        _buildCertificationBadge("CISSP", "Professionnels certifiés en sécurité des systèmes"),
                        _buildCertificationBadge("CEH", "Ethical Hacking certifié"),
                        _buildCertificationBadge("OSCP", "Pentesting offensif"),
                        _buildCertificationBadge("AWS Security", "Sécurité cloud"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // CTA
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/contact'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: const Color(0xFF00B4DB),
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 30 : 50,
                      vertical: isMobile ? 15 : 20,
                    ),
                    textStyle: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Color(0xFF00B4DB), width: 2),
                    ),
                  ),
                  child: const Text("CONSULTER NOS EXPERTS"),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMissionBadge(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF00B4DB).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00B4DB).withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF00B4DB)),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF00B4DB),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityTimeline(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 15 : 25),
      decoration: BoxDecoration(
        color: const Color(0xFF172A45).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00B4DB).withOpacity(0.2)),
      ),
      child: Column(
        children: [
          _buildSecurityTimelineItem(2020, "Fondation par Binetou Barry", isMobile),
          _buildSecurityTimelineItem(2021, "Premier contrat gouvernemental", isMobile),
          _buildSecurityTimelineItem(2022, "Lancement du SOC (Security Operations Center)", isMobile),
          _buildSecurityTimelineItem(2023, "Certification ISO 27001", isMobile),
          _buildSecurityTimelineItem(2024, "Protection de +500 entreprises", isMobile),
          _buildSecurityTimelineItem(2025, "Centre d'excellence en cybersécurité", isMobile),
        ],
      ),
    );
  }

  Widget _buildSecurityTimelineItem(int year, String text, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: isMobile ? 70 : 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF00B4DB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  year.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                const Icon(Icons.timeline, color: Colors.white, size: 24),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityExpert(String name, String role, String certifications, String photoPath) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color(0xFF172A45),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Photo de l'expert
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF00B4DB), width: 2),
                  image: DecorationImage(
                    image: AssetImage(photoPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF00B4DB),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                certifications,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/linkedin.jpg', width: 20),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/facebook.jpg', width: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityValue(IconData icon, String title, String description) {
    return Card(
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
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF00B4DB),
                    Color(0xFF0A192F),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00B4DB).withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Icon(icon, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificationBadge(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0A192F),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF00B4DB).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF00B4DB).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  size: 20,
                  color: Color(0xFF00B4DB),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}