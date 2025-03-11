import '../../model/ride/locations.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../model/user/user.dart';
import '../../repository/rides_repository.dart';
import '../../service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  // Create mock users
  final User _kannika = User(
    firstName: 'Kannika',
    lastName: 'Sok',
    email: 'kannika@example.com',
    phone: '+855 12 345 678',
    profilePicture: 'assets/images/avatars/kannika.jpg',
    verifiedProfile: true,
  );

  final User _chaylim = User(
    firstName: 'Chaylim',
    lastName: 'Cheng',
    email: 'chaylim@example.com',
    phone: '+855 12 345 679',
    profilePicture: 'assets/images/avatars/chaylim.jpg',
    verifiedProfile: true,
  );

  final User _mengtech = User(
    firstName: 'Mengtech',
    lastName: 'Ly',
    email: 'mengtech@example.com',
    phone: '+855 12 345 680',
    profilePicture: 'assets/images/avatars/mengtech.jpg',
    verifiedProfile: true,
  );

  final User _limhao = User(
    firstName: 'Limhao',
    lastName: 'Chim',
    email: 'limhao@example.com',
    phone: '+855 12 345 681',
    profilePicture: 'assets/images/avatars/limhao.jpg',
    verifiedProfile: true,
  );

  final User _sovanda = User(
    firstName: 'Sovanda',
    lastName: 'Hing',
    email: 'sovanda@example.com',
    phone: '+855 12 345 682',
    profilePicture: 'assets/images/avatars/sovanda.jpg',
    verifiedProfile: true,
  );

  // List of rides
  final List<Ride> _rides = [];

  // Constructor
  MockRidesRepository() {
    _initializeRides();
  }

  void _initializeRides() {
    _rides.addAll([
      Ride(
        departureLocation: Location(name: 'Battambong', country: Country.kh),
        arrivalLocation: Location(name: 'Siem Reap', country: Country.kh),
        departureDate: _getTodayAt(5, 30), // 5:30 AM
        duration: const Duration(hours: 2),
        driver: _kannika,
        acceptsPets: false,
        availableSeats: 2,
        pricePerSeat: 15.0,
      ),
      Ride(
        departureLocation: Location(name: 'Battambong', country: Country.kh),
        arrivalLocation: Location(name: 'Siem Reap', country: Country.kh),
        departureDate: _getTodayAt(20, 0), // 8:00 PM
        duration: const Duration(hours: 2),
        driver: _chaylim,
        acceptsPets: false,
        availableSeats: 0,
        pricePerSeat: 15.0,
      ),
      Ride(
        departureLocation: Location(name: 'Battambong', country: Country.kh),
        arrivalLocation: Location(name: 'Siem Reap', country: Country.kh),
        departureDate: _getTodayAt(5, 0), // 5:00 AM
        duration: const Duration(hours: 3),
        driver: _mengtech,
        acceptsPets: false,
        availableSeats: 1,
        pricePerSeat: 12.0,
      ),
      Ride(
        departureLocation: Location(name: 'Battambong', country: Country.kh),
        arrivalLocation: Location(name: 'Siem Reap', country: Country.kh),
        departureDate: _getTodayAt(20, 0), // 8:00 PM
        duration: const Duration(hours: 2),
        driver: _limhao,
        acceptsPets: true,
        availableSeats: 2,
        pricePerSeat: 15.0,
      ),
      Ride(
        departureLocation: Location(name: 'Battambong', country: Country.kh),
        arrivalLocation: Location(name: 'Siem Reap', country: Country.kh),
        departureDate: _getTodayAt(5, 0), // 5:00 AM
        duration: const Duration(hours: 3),
        driver: _sovanda,
        acceptsPets: false,
        availableSeats: 1,
        pricePerSeat: 12.0,
      ),
    ]);
  }

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _rides.where((ride) {
      // 1 - Check if locations match
      bool locationMatch =
          ride.departureLocation.name.toLowerCase().replaceAll(' ', '') ==
              preference.departure.name.toLowerCase().replaceAll(' ', '') &&
          ride.arrivalLocation.name.toLowerCase().replaceAll(' ', '') ==
              preference.arrival.name.toLowerCase().replaceAll(' ', '');

      // 2 - Check if ride has available seats
      bool hasSeats = ride.availableSeats > 0;

      print('Checking ride:');
      print('- Departure: ${ride.departureLocation.name}');
      print('- Arrival: ${ride.arrivalLocation.name}');
      print('- Available seats: ${ride.availableSeats}');
      print('- Match: $locationMatch');

      // 3 - If filter is provided, check pets acceptance
      if (filter?.acceptPets != null) {
        return locationMatch &&
            hasSeats &&
            ride.acceptsPets == filter!.acceptPets;
      }

      return locationMatch && hasSeats;
    }).toList();
  }

  // Helper method to get today's date with specific hour and minute
  static DateTime _getTodayAt(int hour, int minute) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}
