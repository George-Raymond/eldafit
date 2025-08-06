import 'package:eldafit/Progress_Tracker/progress_tracker.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Management'),
        leading: const Icon(Icons.arrow_back),
        actions: const [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/knee_friendly_squat.png'),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Current Plan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Premium Monthly',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Active until October 24, 2024'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text('Manage'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Enjoy a Free Trial!',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text(
                      'Explore all premium features for 7 days, absolutely free.'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement free trial logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    child: const Text('Start Your Free Trial'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Choose Your Plan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            buildPlanCard(
              title: '\$9.99/month',
              subtitle: 'Monthly Access',
              features: [
                'Full exercise library',
                'Progress tracking',
                'Guided workouts',
                'Access to educational content',
              ],
              buttonText: 'Current Plan',
              isHighlighted: true,
              onPressed: null,
            ),
            const SizedBox(height: 16),
            buildPlanCard(
              title: '\$99.99/year',
              subtitle: 'Annual Savings',
              features: [
                'Save 20% annually',
                'All Monthly Access features',
                'Priority customer support',
                'Exclusive content updates',
              ],
              badge: 'Recommended',
              onPressed: () {
                // TODO: Handle annual plan selection
              },
            ),
            const SizedBox(height: 16),
            buildPlanCard(
              title: '\$19.99/month',
              subtitle: 'Family Plan',
              features: [
                'Up to 4 users',
                'All Annual Savings features',
                'Personalized family profiles',
                'Shared progress tracking',
              ],
              onPressed: () {
                // TODO: Handle family plan selection
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Payment Methods',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            buildPaymentTile('M-Pesa', connected: true),
            buildPaymentTile('Yas Mix'),
            buildPaymentTile('Halopesa'),
            buildPaymentTile('Airtel Money'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Confirm Plan Change
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Confirm Plan Change'),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {
                  // TODO: Handle cancel subscription
                },
                child: const Text(
                  'Cancel Subscription',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// ✅ Bottom Button: Navigate to Progress tracker (demo)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProgressTrackerPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Go to Progress Tracker Page'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget buildPlanCard({
    required String title,
    required String subtitle,
    required List<String> features,
    String? badge,
    String? buttonText,
    bool isHighlighted = false,
    void Function()? onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.brown.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                badge,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 8),
          ...features
              .map((f) => Row(
                    children: [
                      const Icon(Icons.check, size: 16, color: Colors.teal),
                      const SizedBox(width: 6),
                      Expanded(child: Text(f)),
                    ],
                  ))
              .toList(),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isHighlighted ? Colors.teal : Colors.grey.shade200,
              foregroundColor: isHighlighted ? Colors.white : Colors.black,
              minimumSize: const Size(double.infinity, 40),
            ),
            child: Text(buttonText ?? 'Choose Plan'),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentTile(String method, {bool connected = false}) {
    return ListTile(
      leading: const Icon(Icons.account_balance_wallet_outlined),
      title: Text(method),
      trailing: connected
          ? const Text('Connected', style: TextStyle(color: Colors.green))
          : null,
      onTap: () {
        // TODO: Handle payment selection
      },
    );
  }
}
