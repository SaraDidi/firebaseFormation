import 'package:get/get.dart';
import '../m/hotel.dart';

class HotelController extends GetxController {
  List<Hotel> hotels = [];
  var isLoading = true.obs;

  setIsLoadingHotels(bool newValue) {
    isLoading.value = newValue;
  }

  addHotel(Hotel hotel) {
    hotels.add(hotel);
  }
}
