import '../screens/splash/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/car/car_list_screen.dart';
import '../screens/car/car_detail_screen.dart';
import '../screens/booking/booking_form_screen.dart';
import '../screens/booking/booking_confirmation_screen.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const cars = '/cars';
  static const carDetail = '/car-detail';
  static const booking = '/booking';
  static const confirmation = '/confirmation';

  static final map = {
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    cars: (_) => const CarListScreen(),
    carDetail: (_) => const CarDetailScreen(),
    booking: (_) => const BookingFormScreen(),
    confirmation: (_) => const BookingConfirmationScreen(),
  };
}
