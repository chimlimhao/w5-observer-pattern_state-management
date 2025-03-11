import '../listener/rides_pref_listener.dart';
import '../model/ride_pref/ride_pref.dart';

class ConsoleLogger implements RidesPrefListener {
  @override
  void onPreferenceSelected(RidePreference preference) {
    print(preference);
  }

  // static void log(String message) {
  //   print(message);
  // }
}
