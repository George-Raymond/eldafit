// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get startWorkout => 'Start Workout';

  @override
  String get voiceGuidance => 'Voice Guidance';

  @override
  String get yourProgressSnapshot => 'Your Progress Snapshot';

  @override
  String daysLabel(Object days) {
    return '$days days';
  }

  @override
  String get viewFullProgress => 'View Full Progress';
}
