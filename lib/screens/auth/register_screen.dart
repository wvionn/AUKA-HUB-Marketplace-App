import 'package:auka_hub_app/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart'; 
import '../seller/seller_scaffold.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isAgreed = false; // Untuk Checkbox Terms & Policy
  bool _isSignInHover = false; // State untuk Hover Effect
  
  // State untuk Pilihan Role (Default: Pembeli)
  String _selectedRole = 'Pembeli'; 

  // Controller Text (Agar bisa diambil datanya)
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // ================= BAGIAN KIRI (BACKGROUND UNGU GELAP) =================
          Expanded(
            flex: 1, 
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // Pastikan file asset ini ada
                  image: AssetImage('lib/widgets/assets/images/bg_register.jpg'), 
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2), 
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "To keep connected with us please\nlogin with your personal info",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
                    ),
                    const SizedBox(height: 40),
                    
                    // Tombol SIGN IN
                    SizedBox(
                      width: 200,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          backgroundColor: Colors.white.withOpacity(0.1),
                        ),
                        child: const Text("SIGN IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // ================= BAGIAN KANAN (FORM REGISTER) =================
          Expanded(
            flex: 1, 
            child: Container(
              color: const Color(0xFFE0E0E0), 
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Baris 1: Nama
                      Row(
                        children: [
                          Expanded(child: _buildTextField("First Name", "Enter your first name", controller: _firstNameController)),
                          const SizedBox(width: 20),
                          Expanded(child: _buildTextField("Last Name", "Enter your last name", controller: _lastNameController)),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Baris 2: Email
                      _buildTextField("Email", "Enter your email", controller: _emailController),
                      const SizedBox(height: 20),

                      // Baris 3: Password
                      _buildTextField("Password", "Create password", isPassword: true, controller: _passwordController),
                      const SizedBox(height: 20),

                      // === BARU: PILIHAN ROLE (PENJUAL / PEMBELI) ===
                      const Text("Daftar Sebagai", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Samakan warna dengan input field lain
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedRole,
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                            isExpanded: true,
                            style: const TextStyle(color: Colors.black87, fontSize: 16),
                            dropdownColor: Colors.grey[200],
                            items: <String>['Pembeli', 'Penjual'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedRole = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Checkbox Terms
                      Row(
                        children: [
                          Checkbox(
                            value: _isAgreed,
                            activeColor: const Color(0xFFAB47BC),
                            onChanged: (val) => setState(() => _isAgreed = val!),
                          ),
                          const Text("I agree with ", style: TextStyle(color: Colors.grey)),
                          GestureDetector(
                            onTap: (){},
                            child: const Text("Terms", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                          ),
                          const Text(" and ", style: TextStyle(color: Colors.grey)),
                          GestureDetector(
                            onTap: (){},
                            child: const Text("Privacy Policy", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),

                      // === TOMBOL CREATE ACCOUNT (NAVIGASI) ===
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!_isAgreed) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please agree to Terms & Policy")));
                              return;
                            }

                            // LOGIKA NAVIGASI BERDASARKAN ROLE
                            if (_selectedRole == 'Penjual') {
                              // Navigasi ke DASHBOARD PENJUAL
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => const SellerScaffold())
                              );
                            } else {
                              // Navigasi ke HALAMAN PEMBELI (Main)
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => const MainScaffold())
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFAB47BC),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                          ),
                          child: const Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Tombol Google
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[400],
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('lib/widgets/assets/images/google.jpg', height: 24, width: 24), // Pastikan ekstensi file benar (.png/.jpg)
                              const SizedBox(width: 15),
                              const Text("Continue with Google", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Footer Link (Sign In)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? ", style: TextStyle(color: Colors.grey)),
                          MouseRegion(
                            onEnter: (_) => setState(() => _isSignInHover = true),
                            onExit: (_) => setState(() => _isSignInHover = false),
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: _isSignInHover ? const Color(0xFF4A148C) : const Color(0xFFAB47BC), 
                                    fontWeight: FontWeight.bold,
                                    decoration: _isSignInHover ? TextDecoration.underline : TextDecoration.none,
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

  // Helper TextField (Updated with Controller support)
  Widget _buildTextField(String label, String placeholder, {bool isPassword = false, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            suffixIcon: isPassword ? const Icon(Icons.visibility_outlined, color: Colors.grey) : null,
          ),
        ),
      ],
    );
  }
}
