// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get dashboardTitle => 'Dashibodi';

  @override
  String get startWorkout => 'Anza Mazoezi';

  @override
  String get voiceGuidance => 'Mwongozo wa Sauti';

  @override
  String get yourProgressSnapshot => 'Muhtasari wa Maendeleo Yako';

  @override
  String daysLabel(Object days) {
    return 'Siku $days';
  }

  @override
  String get viewFullProgress => 'Tazama Maendeleo Yote';
}
