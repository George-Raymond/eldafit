import 'package:eldafit/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.dashboardTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Start Workout Button
            ElevatedButton(
              onPressed: () {
                // Add navigation to workout screen
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(l10n.startWorkout),
            ),
            const SizedBox(height: 16.0),
            // Voice Guidance Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.voiceGuidance),
                Switch(
                  value: false, // Replace with state management
                  onChanged: (value) {
                    // Add voice guidance toggle logic
                  },
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            // Your Progress Snapshot Section
            Text(
              l10n.yourProgressSnapshot,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/progress_icon1.png', height: 50),
                Image.asset('assets/progress_icon2.png', height: 50),
                Text(
                  l10n.daysLabel(12),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            // View Full Progress Button
            OutlinedButton(
              onPressed: () {
                // Add navigation to full progress screen
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(l10n.viewFullProgress),
            ),
          ],
        ),
      ),
    );
  }
}
