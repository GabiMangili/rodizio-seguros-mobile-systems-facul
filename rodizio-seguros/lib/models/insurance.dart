import 'package:untitled/models/vehicle.dart';
import 'diver.dart';

class Insurance{
  final String status;
  final String vehicle;
  final String brand; //marca
  final int year; //ano
  final String plate;

  Insurance({required this.status, required this.vehicle, required this.brand, required this.year, required this.plate}); //placa

  // final String status;
  // final Vehicle vehicle;
  // final Driver driver;
  //
  // Insurance({required this.status, required this.vehicle, required this.driver});

//   Insurance.fromMap(Map map)
//     : status = map[""],
//       vehicle = Vehicle.fromMap(map[""]),
//       driver = Driver.fromMap(map[""]);
}