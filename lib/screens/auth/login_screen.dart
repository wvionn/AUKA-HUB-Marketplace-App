import 'package:auka_hub_app/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart'; 
import '../seller/seller_scaffold.dart'; // Import Halaman Penjual
import 'services/auth_service.dart'; // Import Service API

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Variable State untuk melacak apakah mouse sedang di atas teks "Sign Up"
  bool _isSignUpHover = false; 

  final String _assetPath = 'lib/widgets/assets/images';

  // --- 1. TAMBAHKAN CONTROLLER ---
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // ================= BAGIAN KIRI (BACKGROUND GAMBAR) =================
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('$_assetPath/bg_login.png'), 
                  fit: BoxFit.cover, 
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    right: 40,
                    child: Image.asset('$_assetPath/butterfly.png', width: 80),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset('$_assetPath/lavender.png', width: 200, fit: BoxFit.cover),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('$_assetPath/logo_auka.png', width: 240),
                        const SizedBox(height: 10),

                        const SizedBox(height: 5),
                        const Text(
                          "Join Us and give information to people",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ================= BAGIAN KANAN (FORM LOGIN) =================
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xFFE0E0E0),
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 40),

                      const Text("Email", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _emailController, // <--- 2. PASANG CONTROLLER
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFB39DDB),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text("Password", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordController, // <--- 2. PASANG CONTROLLER
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFB39DDB),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                          suffixIcon: const Icon(Icons.visibility_outlined, color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                      ),
                      
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Forgot password ?", style: TextStyle(color: Colors.black, decoration: TextDecoration.underline)),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ================= TOMBOL LOG IN (UPDATED LOGIC) =================
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async { // <--- 3. Ubah jadi ASYNC
                             // --- LOGIKA LOGIN API START ---
                             try {
                               final email = _emailController.text;
                               final password = _passwordController.text;

                               if (email.isEmpty || password.isEmpty) {
                                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email dan Password tidak boleh kosong")));
                                 return;
                               }

                               // Panggil Service Login
                               final result = await AuthService().login(email, password);

                               if (result['success']) {
                                  // Login Sukses
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Berhasil!")));
                                  
                                  // Cek Role (Peran) dari Database
                                  String peran = result['data']['peran']; 

                                  // Navigasi Berdasarkan Role
                                  if (peran == 'penjual') {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SellerScaffold()));
                                  } else {
                                    // Default ke Pembeli
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScaffold()));
                                  }

                               } else {
                                  // Login Gagal (Password salah / User tidak ada)
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result['message'])));
                               }
                             } catch (e) {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
                             }
                             // --- LOGIKA LOGIN API END ---
                          },
                          // Menggunakan ButtonStyle untuk logika Hover (UI ASLI)
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return const Color(0xFF7B1FA2); // Warna Ungu lebih GELAP saat kursor di atasnya
                              }
                              return const Color(0xFFAB47BC); // Warna Ungu DEFAULT
                            }),
                            mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
                            shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
                          ),
                          child: const Text(
                            "Log in",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),

                      _buildSocialButton("Log in with Google", '$_assetPath/google.png'),
                      const SizedBox(height: 15),
                      _buildSocialButton("Log in with Facebook", '$_assetPath/facebook.png'),

                      const SizedBox(height: 30),
                      
                      // ================= TEKS SIGN UP (HOVER EFFECT) =================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? ", style: TextStyle(color: Colors.grey)),
                          
                          MouseRegion(
                            onEnter: (_) => setState(() => _isSignUpHover = true), 
                            onExit: (_) => setState(() => _isSignUpHover = false), 
                            cursor: SystemMouseCursors.click, 
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const RegisterScreen())
                                );
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200), 
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: _isSignUpHover ? const Color(0xFF4A148C) : const Color(0xFFAB47BC), 
                                    fontWeight: FontWeight.bold,
                                    fontSize: _isSignUpHover ? 15 : 14, 
                                    decoration: _isSignUpHover ? TextDecoration.underline : TextDecoration.none, 
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String text, String iconPath) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
             if (states.contains(WidgetState.hovered)) return const Color(0xFF8E24AA); 
             return const Color(0xFFAB47BC); 
          }),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.asset(
                iconPath,
                height: 24,
                width: 24,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.white),
              ),
            ),
            const SizedBox(width: 15),
            Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}