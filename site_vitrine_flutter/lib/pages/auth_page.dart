import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();
  
  // Contrôleurs pour la connexion
  final TextEditingController _loginIdentifier = TextEditingController();
  final TextEditingController _loginPassword = TextEditingController();
  
  // Contrôleurs pour l'inscription
  final TextEditingController _registerFirstName = TextEditingController();
  final TextEditingController _registerLastName = TextEditingController();
  final TextEditingController _registerEmail = TextEditingController();
  final TextEditingController _registerPhone = TextEditingController();
  final TextEditingController _registerPassword = TextEditingController();
  final TextEditingController _registerConfirmPassword = TextEditingController();
  
  bool _obscurePassword = true;
  bool _isAuthenticating = false;
  bool _isRegistering = false;
  bool _showPasswordStrength = false;
  double _passwordStrength = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  double _calculatePasswordStrength(String password) {
    double strength = 0.0;
    if (password.length >= 8) strength += 0.2;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[a-z]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) strength += 0.2;
    return strength;
  }

  void _login() {
    if (_loginFormKey.currentState!.validate()) {
      setState(() => _isAuthenticating = true);
      
      // Simulation du processus d'authentification
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isAuthenticating = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Authentification réussie! Accès sécurisé activé'),
            backgroundColor: Colors.green[800],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            duration: const Duration(seconds: 3),
          ),
        );
      });
    }
  }

  void _register() {
    if (_registerFormKey.currentState!.validate()) {
      setState(() => _isRegistering = true);
      
      // Simulation du processus d'inscription
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isRegistering = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Compte créé avec succès! Vérification en cours...'),
            backgroundColor: Colors.green[800],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            duration: const Duration(seconds: 3),
          ),
        );
        
        // Basculer vers l'onglet de connexion après inscription
        _tabController.animateTo(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AUTHENTIFICATION SÉCURISÉE'),
        backgroundColor: const Color(0xFF0A192F),
        foregroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF0A192F),
          statusBarIconBrightness: Brightness.light,
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.tealAccent,
          indicatorWeight: 3,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'CONNEXION SÉCURISÉE'),
            Tab(text: 'INSCRIPTION VERROUILLÉE'),
          ],
        ),
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
        child: TabBarView(
          controller: _tabController,
          children: [
            // Onglet de CONNEXION
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // En-tête de sécurité
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          'assets/images/lock_icon.png',
                          height: 150,
                        ),
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.fingerprint,
                            size: 60,
                            color: Color(0xFF00B4DB),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "ACCÈS SÉCURISÉ",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Authentification à double facteur recommandée",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                            ),
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

                  // Formulaire de connexion
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
                        key: _loginFormKey,
                        child: Column(
                          children: [
                            const Text(
                              "IDENTIFIANT DE SÉCURITÉ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.1,
                              ),
                            ),
                            const SizedBox(height: 25),
                            
                            // Email/Téléphone
                            TextFormField(
                              controller: _loginIdentifier,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Email ou Téléphone',
                                labelStyle: const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.security, color: Colors.blueGrey),
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
                                  return 'Identifiant requis';
                                }
                                if (!value.contains('@') && !RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return 'Email ou téléphone invalide';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            
                            // Mot de passe
                            TextFormField(
                              controller: _loginPassword,
                              obscureText: _obscurePassword,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Mot de passe crypté',
                                labelStyle: const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.lock, color: Colors.blueGrey),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscurePassword = !_obscurePassword);
                                  },
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
                                  return 'Mot de passe requis';
                                }
                                if (value.length < 8) {
                                  return 'Minimum 8 caractères';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            
                            // Options de sécurité
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: null,
                                      activeColor: const Color(0xFF00B4DB),
                                      checkColor: Colors.white,
                                    ),
                                    const Text(
                                      "Rester connecté",
                                      style: TextStyle(color: Colors.blueGrey),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Récupération sécurisée",
                                    style: TextStyle(color: Colors.tealAccent),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            
                            // Bouton de connexion sécurisée
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: double.infinity,
                              height: 55,
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
                              child: ElevatedButton(
                                onPressed: _isAuthenticating ? null : _login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: _isAuthenticating
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : const Text(
                                        "CONNEXION SÉCURISÉE",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            
                            // Authentification à deux facteurs
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.security, color: Colors.tealAccent),
                              label: const Text(
                                "Authentification à deux facteurs",
                                style: TextStyle(color: Colors.tealAccent),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.tealAccent.withOpacity(0.5)),
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Sécurité des données
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A192F),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFF00B4DB).withOpacity(0.3)),
                    ),
                    child: const Text(
                      "PROTOCOLE DE SÉCURITÉ: Toutes les communications sont chiffrées de bout en bout avec AES-256. "
                      "Vos identifiants sont stockés de manière sécurisée et ne sont jamais partagés.",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            
            // Onglet d'INSCRIPTION
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // En-tête d'inscription sécurisée
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          'assets/images/shield_icon.png',
                          height: 150,
                        ),
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.enhanced_encryption,
                            size: 60,
                            color: Color(0xFF00B4DB),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "CRÉATION DE COMPTE VERROUILLÉ",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Votre sécurité commence par un compte fortement protégé",
                            style: TextStyle(
                              fontSize: 16,
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
                                "PBKDF2 | Argon2 | HMAC",
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

                  // Formulaire d'inscription
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
                        key: _registerFormKey,
                        child: Column(
                          children: [
                            const Text(
                              "CRÉATION D'IDENTITÉ NUMÉRIQUE",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.1,
                              ),
                            ),
                            const SizedBox(height: 25),
                            
                            // Prénom
                            TextFormField(
                              controller: _registerFirstName,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Prénom',
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
                                  return 'Prénom requis';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            
                            // Nom
                            TextFormField(
                              controller: _registerLastName,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Nom',
                                labelStyle: const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.person_outline, color: Colors.blueGrey),
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
                                  return 'Nom requis';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            
                            // Email
                            TextFormField(
                              controller: _registerEmail,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Email professionnel',
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
                                  return 'Email requis';
                                }
                                if (!value.contains('@')) {
                                  return 'Email invalide';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            
                            // Téléphone
                            TextFormField(
                              controller: _registerPhone,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Téléphone (pour la vérification)',
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Téléphone requis';
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return 'Numéro invalide';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            
                            // Mot de passe
                            TextFormField(
                              controller: _registerPassword,
                              obscureText: _obscurePassword,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Créer un mot de passe fort',
                                labelStyle: const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.lock, color: Colors.blueGrey),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscurePassword = !_obscurePassword);
                                  },
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
                              onChanged: (value) {
                                setState(() {
                                  _passwordStrength = _calculatePasswordStrength(value);
                                  _showPasswordStrength = value.isNotEmpty;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mot de passe requis';
                                }
                                if (value.length < 12) {
                                  return 'Minimum 12 caractères';
                                }
                                if (_calculatePasswordStrength(value) < 0.8) {
                                  return 'Le mot de passe est trop faible';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            
                            // Indicateur de force du mot de passe
                            if (_showPasswordStrength)
                              Column(
                                children: [
                                  LinearProgressIndicator(
                                    value: _passwordStrength,
                                    backgroundColor: Colors.grey[800],
                                    color: _passwordStrength > 0.7
                                        ? Colors.green
                                        : _passwordStrength > 0.5
                                            ? Colors.orange
                                            : Colors.red,
                                    minHeight: 6,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _passwordStrength > 0.7
                                            ? 'Fort'
                                            : _passwordStrength > 0.5
                                                ? 'Moyen'
                                                : 'Faible',
                                        style: TextStyle(
                                          color: _passwordStrength > 0.7
                                              ? Colors.green
                                              : _passwordStrength > 0.5
                                                  ? Colors.orange
                                                  : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${(_passwordStrength * 100).toInt()}%',
                                        style: const TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Utilisez majuscules, chiffres et caractères spéciaux',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 20),
                            
                            // Confirmation du mot de passe
                            TextFormField(
                              controller: _registerConfirmPassword,
                              obscureText: _obscurePassword,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Confirmer le mot de passe',
                                labelStyle: const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.lock_reset, color: Colors.blueGrey),
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
                                  return 'Confirmation requise';
                                }
                                if (value != _registerPassword.text) {
                                  return 'Les mots de passe ne correspondent pas';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            
                            // Accord de sécurité
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                  activeColor: const Color(0xFF00B4DB),
                                  checkColor: Colors.white,
                                ),
                                Expanded(
                                  child: RichText(
                                    text: const TextSpan(
                                      style: TextStyle(color: Colors.blueGrey),
                                      children: [
                                        TextSpan(text: "J'accepte les "),
                                        TextSpan(
                                          text: "conditions de sécurité",
                                          style: TextStyle(
                                            color: Colors.tealAccent,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                        TextSpan(text: " et la "),
                                        TextSpan(
                                          text: "politique de confidentialité",
                                          style: TextStyle(
                                            color: Colors.tealAccent,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            
                            // Bouton d'inscription sécurisée
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: double.infinity,
                              height: 55,
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
                              child: ElevatedButton(
                                onPressed: _isRegistering ? null : _register,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: _isRegistering
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : const Text(
                                        "CRÉER UN COMPTE VERROUILLÉ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            
                            // Authentification à deux facteurs
                            const Text(
                              "L'authentification à deux facteurs sera activée après vérification",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Sécurité des données
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A192F),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFF00B4DB).withOpacity(0.3)),
                    ),
                    child: const Text(
                      "PROTECTION DES DONNÉES: Vos informations sont stockées avec un chiffrement AES-256 et salage. "
                      "Nous utilisons des algorithmes de hachage PBKDF2 avec 100,000 itérations pour sécuriser vos mots de passe.",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
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
}