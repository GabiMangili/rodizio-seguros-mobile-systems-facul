import 'package:dio/dio.dart';

import '../models/vehicle.dart';

class VehicleController{

  final dio = Dio();

  Future<Vehicle> postVehicle({required Vehicle vehicle}) async {
    String endpoint = "https://virtserver.swaggerhub.com/Open-Insurance-io/Open_Insurance_API/1.0.0/vehicle";

    Map data = {
      "vehicleModel" : vehicle.model,
      "vehicleBrand" : vehicle.brand,
      "modelYear" : vehicle.year,
      "plateNumber" : vehicle.plate
    };

    try{
      Response response = await dio.post(endpoint, data: data);
      return Vehicle.fromMap(response.data);
    } catch (e){
      print(e is DioError ? e.error : "erro");
      rethrow;
    }
  }
}