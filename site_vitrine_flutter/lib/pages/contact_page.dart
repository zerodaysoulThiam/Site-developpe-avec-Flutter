import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nom = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _entreprise = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _message = TextEditingController();
  bool _isSending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONTACT SÉCURISÉ'),
        backgroundColor: const Color(0xFF0A192F),
        foregroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // En-tête avec animation
              Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/images/security_network.png',
                      height: 200,
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.lock_outline,
                        size: 60,
                        color: Color(0xFF00B4DB),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "CONTACT SÉCURISÉ",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Toutes les communications sont chiffrées de bout en bout",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.verified_user, size: 20, color: Colors.green),
                          SizedBox(width: 5),
                          Text(
                            "AES-256 | TLS 1.3",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              
              // Formulaire sécurisé
              Card(
                elevation: 16,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: const Color(0xFF00B4DB).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                color: const Color(0xFF172A45).withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          "FORMULAIRE SÉCURISÉ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 25),
                        
                        // Nom
                        TextFormField(
                          controller: _nom,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Nom complet',
                            labelStyle: const TextStyle(color: Colors.blueGrey),
                            prefixIcon: const Icon(Icons.person, color: Colors.blueGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blueAccent.withOpacity(0.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ce champ est requis pour la vérification';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        
                        // Email
                        TextFormField(
                          controller: _email,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Adresse email professionnelle',
                            labelStyle: const TextStyle(color: Colors.blueGrey),
                            prefixIcon: const Icon(Icons.email, color: Colors.blueGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blueAccent.withOpacity(0.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre email';
                            }
                            if (!value.contains('@')) {
                              return 'Email invalide';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        
                        // Entreprise
                        TextFormField(
                          controller: _entreprise,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Entreprise / Organisation',
                            labelStyle: const TextStyle(color: Colors.blueGrey),
                            prefixIcon: const Icon(Icons.business, color: Colors.blueGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blueAccent.withOpacity(0.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Téléphone
                        TextFormField(
                          controller: _telephone,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Téléphone (optionnel)',
                            labelStyle: const TextStyle(color: Colors.blueGrey),
                            prefixIcon: const Icon(Icons.phone, color: Colors.blueGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blueAccent.withOpacity(0.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 20),
                        
                        // Message
                        TextFormField(
                          controller: _message,
                          style: const TextStyle(color: Colors.white),
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'Votre message confidentiel',
                            labelStyle: const TextStyle(color: Colors.blueGrey),
                            alignLabelWithHint: true,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(bottom: 80),
                              child: Icon(Icons.message, color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blueAccent.withOpacity(0.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre message';
                            }
                            if (value.length < 20) {
                              return 'Veuillez fournir plus de détails';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        
                        // Bouton d'envoi sécurisé
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF00B4DB),
                                Color(0xFF0083B0),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // Informations de contact
              Card(
                elevation: 16,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: const Color(0xFF00B4DB).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                color: const Color(0xFF172A45).withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "NOS COORDONNÉES SÉCURISÉES",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 25),
                      
                      _buildSecureContactInfo(
                        Icons.location_on, 
                        "ADRESSE PHYSIQUE", 
                        "Tour Sécurité Numérique\nPlateau, Dakar\nSÉNÉGAL",
                      ),
                      const SizedBox(height: 25),
                      
                      _buildSecureContactInfo(
                        Icons.phone_android, 
                        "TÉLÉPHONE CHIFFRÉ", 
                        "+221 77 123 45 67 (Standard)\n+221 76 987 65 43 (Urgences)",
                      ),
                      const SizedBox(height: 25),
                      
                      _buildSecureContactInfo(
                        Icons.mail_lock, 
                        "EMAIL SÉCURISÉ", 
                        "contact@securite-sn.sn\nsupport@securite-sn.sn",
                      ),
                      const SizedBox(height: 25),
                      
                      _buildSecureContactInfo(
                        Icons.access_time, 
                        "HORAIRES CERTIFIÉS", 
                        "Lundi-Vendredi: 8h-18h\nSamedi: 9h-13h\nUrgences: 24/7",
                      ),
                      const SizedBox(height: 40),
                      
                      const Text(
                        "SUIVEZ NOS ACTUALITÉS SÉCURISÉES",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton('assets/images/linkedin.jpg', 'LinkedIn'),
                          _buildSocialButton('assets/images/x.jpg', 'Twitter'),
                          _buildSocialButton('assets/images/facebook.jpg', 'Facebook'),
                          _buildSocialButton('assets/images/shield.jpg', 'Blog'),
                        ],
                      ),
                      const SizedBox(height: 30),
                      
                      const Text(
                        "LOCALISATION SÉCURISÉE",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: const Color(0xFF00B4DB).withOpacity(0.5)),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/auth1.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Localisation exacte communiquée après vérification",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // Sécurité des données
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A192F),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF00B4DB).withOpacity(0.3)),
                ),
                child: const Text(
                  "CONFIDENTIALITÉ GARANTIE: Vos données sont chiffrées avec AES-256 et protégées conformément au RGPD. "
                  "Nous ne partageons aucune information avec des tiers sans votre consentement explicite.",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecureContactInfo(IconData icon, String title, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF00B4DB).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 30, color: const Color(0xFF00B4DB)),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00B4DB),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String imagePath, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF0A192F),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF00B4DB).withOpacity(0.3)),
        ),
        child: Image.asset(
          imagePath,
          width: 24,
          color: const Color(0xFF00B4DB),
        ),
      ),
    );
  }

  void _sendSecureMessage() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });
      
      // Simulation du chiffrement
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isSending = false;
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Message sécurisé envoyé avec succès !',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.green[800],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            duration: const Duration(seconds: 3),
          ),
        );
        
        // Réinitialisation du formulaire
        _nom.clear();
        _email.clear();
        _entreprise.clear();
        _telephone.clear();
        _message.clear();
      });
    }
  }
}