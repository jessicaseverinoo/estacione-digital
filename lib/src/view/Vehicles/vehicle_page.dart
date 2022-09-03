import 'package:estacione_digital/src/model/user_model.dart';
import 'package:estacione_digital/src/view/Vehicles/vehicle_model.dart';
import 'package:estacione_digital/src/view/Vehicles/vehicle_provider.dart';
import 'package:estacione_digital/src/shared/widgets/error_widget.dart';
import 'package:estacione_digital/src/view/Vehicles/widgets/add_vehicle/add_vehicle_bottom_sheet.dart';
import 'package:estacione_digital/src/view/Vehicles/widgets/vehicle_item_widget.dart';
import 'package:flutter/material.dart';

class VehiclePage extends StatefulWidget {
  final UserModel userModel;

  const VehiclePage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  @override
  Widget build(BuildContext context) {
    final VehiclesProvider vehiclesProvider = VehiclesProvider();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search_rounded),
              hintText: 'Pesquisar veículo',
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: FutureBuilder(
              future: vehiclesProvider.getVehicles(widget.userModel),
              builder: (BuildContext context,
                  AsyncSnapshot<List<VehicleModel>> snapshot) {
                if (snapshot.hasData) {
                  List<VehicleModel> vehicles = snapshot.data!;
                  return ListView(
                    children: vehicles
                        .map(
                          (VehicleModel vehicleModel) =>
                              VehicleItemWidget(vehicleModel: vehicleModel),
                        )
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return CustomErrorWidget(
                      message: snapshot.hasError.toString());
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return const AddVehicleBottomSheet();
                },
              );
            },
            child: const Text('Adicionar Veículo'),
          ),
        ],
      ),
    ));
  }
}
