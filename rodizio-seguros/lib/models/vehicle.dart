class Vehicle{
  final String model; //veículo
  final String brand; //marca
  final int year; //ano
  final String plate; //placa

  Vehicle({
      required this.model,
      required this.brand,
      required this.year,
      required this.plate
  }); //placa

    Vehicle.fromMap(Map map)
        : model = map["vehicleModel"],
          brand = map["vehicleBrand"],
          year = map["modelYear"],
          plate = map["plateNumber"];

    Map<String, dynamic> toMap(){
      return {
        "vehicleModel" : model,
        "vehicleBrand" : brand,
        "modelYear" : year,
        "plateNumber" : plate
      };
    }
}