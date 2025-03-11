import 'package:school/EXERCISE-1/logger/console_logger.dart';
import 'package:test/test.dart';
import 'package:school/EXERCISE-1/dummy_data/dummy_data.dart';
import 'package:school/EXERCISE-1/service/ride_prefs_service.dart';
import 'package:school/EXERCISE-1/repository/mock/mock_ride_preferences_repository.dart';

void main() {
  late ConsoleLogger consoleLogger;
  late RidePrefService ridePrefService;

  setUp(() {
    // Initialize the service with mock repository
    RidePrefService.initialize(MockRidePreferencesRepository());
    ridePrefService = RidePrefService.instance;
    consoleLogger = ConsoleLogger();

    // Add the console logger as a listener
    ridePrefService.addListener(consoleLogger);
  });

  test('ConsoleLogger should receive preference changes', () {
    // Set a new preference which should trigger the logger
    final fakeRidePref = fakeRidePrefs[0];
    ridePrefService.setCurrentPreference(fakeRidePref);

    // Notify listeners to trigger the console logger
    ridePrefService.notifyListeners();

    // Change to a different preference
    final anotherFakeRidePref = fakeRidePrefs[1];
    ridePrefService.setCurrentPreference(anotherFakeRidePref);
    ridePrefService.notifyListeners();
  });
}
