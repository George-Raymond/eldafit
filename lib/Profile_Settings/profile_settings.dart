import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _onNavItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/dashboard');
        break;
      case 1:
        Navigator.pushNamed(context, '/library');
        break;
      case 2:
        Navigator.pushNamed(context, '/progress');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.teal,
        onTap: _onNavItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile and Settings'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : const AssetImage('assets/user_profile.png') as ImageProvider,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Personal Information'),
            _buildPersonalInfoCard(),
            const SizedBox(height: 20),
            _buildSectionTitle('Fitness Goals'),
            _buildFitnessGoalCard(),
            const SizedBox(height: 20),
            _buildSectionTitle('App Language'),
            _buildLanguageToggle(),
            const SizedBox(height: 20),
            _buildSectionTitle('More Options'),
            _buildMoreOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildPersonalInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Name'),
              Text('Email'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Loading name...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Loading email...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date of Birth'),
              Text('Height'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Loading DOB...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Loading height...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Weight'),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Loading weight...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '// TODO: Fetch user data dynamically based on login or user session and populate the above fields.',
            style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildFitnessGoalCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            value: 'Strength Gain',
            items: const [
              DropdownMenuItem(value: 'Strength Gain', child: Text('Strength Gain')),
              DropdownMenuItem(value: 'Weight Loss', child: Text('Weight Loss')),
              DropdownMenuItem(value: 'Endurance', child: Text('Endurance')),
            ],
            onChanged: (value) {
              // TODO: handle fitness goal update
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                // TODO: Update goal logic
              },
              child: const Text('Update Goal'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageToggle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('English / Kiswahili'),
          Switch(
            value: false,
            onChanged: (value) {
              // TODO: handle language toggle
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMoreOptions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: const [
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Subscription Management'),
            onTap: null, // TODO: handle navigation
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Educational Content'),
            onTap: null, // TODO: handle navigation
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shield),
            title: Text('Emergency & Help'),
            onTap: null, // TODO: handle navigation
          ),
        ],
      ),
    );
  }
}