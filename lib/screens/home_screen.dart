import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_formatiom/config.dart';
import 'package:get/get.dart';
import '../controllers/hotel_controller.dart';
import '../m/hotel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final HotelController _hotelController = Get.put(HotelController());

  _hotelCar(Hotel hotel) {
    return Card(
      semanticContainer: true,
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Column(
            children: [
              Image.network(
                hotel.imageUrl,
                width: fullWidth(context) * 0.5,
              ),
              Text(hotel.name),
              Text(hotel.price.toString()),
            ],
          ),
          Icon(Icons.favorite)
        ],
      ),
    );
  }

  Future<void> getHotelsFromFirebase() async {
    _hotelController.setIsLoadingHotels(true);

    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collection("hotel").get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
          in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data();

        // Convert document data to Hotel object
        Hotel hotel = Hotel(
          name: data['name'] ?? '',
          price: (data['price'] ?? 0.0).toDouble(),
          imageUrl: data['image'] ?? '',
        );
        // Add the Hotel object to the list
        _hotelController.addHotel(hotel);
      }
      print("----------------------");
      print(_hotelController.hotels);
      print("----------------------");
      _hotelController.setIsLoadingHotels(false);
    } catch (error) {
      print('Error fetching hotels: $error');
      _hotelController.setIsLoadingHotels(false);
    }
  }

  @override
  void initState() {
    getHotelsFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _hotelController.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : GridView.builder(
            itemCount: _hotelController.hotels.length,
            itemBuilder: (BuildContext context, int index) {
              return _hotelCar(_hotelController.hotels[index]);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 5.0,
            ),
          );
  }
}
