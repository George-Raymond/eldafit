import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Photo Section
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!)
                    : const AssetImage('assets/default_avatar.png')
                        as ImageProvider,
                child: _imageFile == null
                    ? const Icon(Icons.camera_alt, size: 32, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 16),

            // User Info
            const Text(
              'George Raymond',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'george@example.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Edit Button
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.edit),
              label: const Text('Change Photo'),
            ),

            const Spacer(),

            // Save button or other options
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile saved successfully')),
                );
              },
              child: const Text('Save Changes'),
            )
          ],
        ),
      ),
    );
  }
}
