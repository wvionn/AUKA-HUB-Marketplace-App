import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Simulasi Data Chat
  final List<Map<String, dynamic>> _messages = [
    {"text": "Hello kaa, ini barang ready ya ?", "isSender": false, "time": "7.10 pm"},
    {"text": "Iyaa kaa, ready. Mau warna apa?", "isSender": true, "time": "10:11 am"},
    {"text": "Yang biruu kaa.", "isSender": false, "time": "10:12 am"},
    {"text": "Siap, bisa langsung checkout ya kak :)", "isSender": true, "time": "10:13 am"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          // ================= BAGIAN KIRI: DAFTAR KONTAK =================
          Expanded(
            flex: 4, // Lebar 40%
            child: Container(
              decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey, width: 0.5)),
              ),
              child: Column(
                children: [
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  
                  // List Kontak
                  Expanded(
                    child: ListView(
                      children: [
                        _buildContactItem("Putri Anjani", "Siap, bisa langsung checkout...", "7.10 pm", true),
                        _buildContactItem("Putri Anjani", "kaa barang ready?", "7.10 pm", false),
                        _buildContactItem("Putri Anjani", "makasiih yaa kaa udah dikirim", "", false),
                        _buildContactItem("Putri Anjani", "sama - sama kak ^^", "", false),
                        _buildContactItem("Putri Anjani", "Sore ini kaa.. Ada kurir yg pick up", "", false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ================= BAGIAN KANAN: ISI PESAN =================
          Expanded(
            flex: 6, // Lebar 60%
            child: Column(
              children: [
                // Header Chat (Nama User & Icon Video/Call)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage("https://via.placeholder.com/150"), // Placeholder foto user
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Putri Anjani", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text("Active now", style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.videocam_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.phone_outlined)),
                        ],
                      )
                    ],
                  ),
                ),

                // Area Bubble Chat
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final msg = _messages[index];
                        return _buildChatBubble(msg['text'], msg['isSender']);
                      },
                    ),
                  ),
                ),

                // Input Bar (Ketik Pesan)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.attach_file, color: Colors.grey),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Type a message...",
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.mic_none, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      CircleAvatar(
                        backgroundColor: const Color(0xFF333333), // Tombol kirim hitam
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white, size: 18),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Item Kontak di Sidebar Kiri
  Widget _buildContactItem(String name, String lastMsg, String time, bool isSelected) {
    return Container(
      color: isSelected ? Colors.grey[100] : Colors.white,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage("https://via.placeholder.com/150"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        subtitle: Row(
          children: [
            if (isSelected) const Icon(Icons.done_all, size: 14, color: Colors.green),
            if (isSelected) const SizedBox(width: 5),
            Expanded(child: Text(lastMsg, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12))),
          ],
        ),
      ),
    );
  }

  // Widget: Bubble Chat (Kanan/Kiri)
  Widget _buildChatBubble(String message, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSender) ...[
            const CircleAvatar(radius: 12, backgroundImage: NetworkImage("https://via.placeholder.com/150")),
            const SizedBox(width: 10),
          ],
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            constraints: const BoxConstraints(maxWidth: 300), // Maksimal lebar bubble
            decoration: BoxDecoration(
              color: isSender ? const Color(0xFF007AFF) : Colors.grey[100], // Biru jika sender, Abu jika receiver
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: isSender ? const Radius.circular(20) : Radius.zero,
                bottomRight: isSender ? Radius.zero : const Radius.circular(20),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: isSender ? Colors.white : Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}