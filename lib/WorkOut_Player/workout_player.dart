import 'package:eldafit/Subscription/subscription_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutPlayer extends StatelessWidget {
  const WorkoutPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      appBar: AppBar(
        title: const Text('Workout Session'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/knee_friendly_squat.png'),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '01:30',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Playback speed & camera angle
            _playbackControls(),

            const SizedBox(height: 16),

            // Lottie Animation
            Lottie.asset(
              'assets/animations/offline.json',
              height: 200,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),
            _movementGuide(),
            const SizedBox(height: 20),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Next Exercise"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
              label: const Text("Previous Exercise"),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button at bottom right to go to SubscriptionPage
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SubscriptionPage()),
          );
        },
        backgroundColor: Colors.teal,
        tooltip: "Go to Subscription",
        child: const Icon(Icons.subscriptions),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _playbackControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Playback Speed"),
        const SizedBox(height: 8),
        Row(
          children: [
            _chip("0.75x"),
            _chip("1x", selected: true),
            _chip("1.25x"),
            _chip("1.5x"),
          ],
        ),
        const SizedBox(height: 16),
        const Text("Camera Angle"),
        const SizedBox(height: 8),
        Row(
          children: [
            _chip("Front", selected: true),
            _chip("Side"),
            _chip("3/4"),
          ],
        ),
      ],
    );
  }

  Widget _chip(String label, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {},
        selectedColor: Colors.teal,
        labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _movementGuide() {
    final tips = [
      "Stand tall with feet hip-width apart, shoulders relaxed.",
      "Engage core muscles, keeping your back straight.",
      "Slowly lower your body as if sitting into a chair, bending at the knees and hips.",
      "Keep knees aligned over ankles, do not let them go past your toes.",
      "Ensure your weight is in your heels, not the balls of your feet.",
      "Lower until thighs are parallel to the floor, or as comfortable without strain.",
      "Hold for 1-2 seconds, then slowly push back up to starting position.",
      "Breathe out as you push up, breathe in as you lower.",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Movement Guide: Knee-Friendly Squat",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...List.generate(tips.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index + 1}. ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(tips[index])),
              ],
            ),
          );
        }),
        const SizedBox(height: 10),
        Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.teal),
            SizedBox(width: 8),
            Expanded(child: Text("DO: Keep your chest up and shoulders back.")),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: const [
            Icon(Icons.cancel, color: Colors.red),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                "DON'T: Let your knees cave inward or go past your toes.",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
