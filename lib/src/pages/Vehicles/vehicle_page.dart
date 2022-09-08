import 'package:estacione_digital/src/models/user_model.dart';
import 'package:estacione_digital/src/models/vehicle_model.dart';
import 'package:estacione_digital/src/provider/vehicle_provider.dart';
import 'package:estacione_digital/src/shared/widgets/error_widget.dart';
import 'package:estacione_digital/src/pages/Vehicles/widgets/add_vehicle_bottom_sheet.dart';
import 'package:estacione_digital/src/pages/Vehicles/widgets/vehicle_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehiclePage extends StatelessWidget {
  final UserModel userModel;

  const VehiclePage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VehicleProvider vehicleProvider = Provider.of(context);
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder(
              future: vehicleProvider.getVehicles(userModel.uuidUsuario),
              builder: (BuildContext context,
                  AsyncSnapshot<List<VehicleModel>> snapshot) {
                if (snapshot.hasData) {
                  List<VehicleModel> vehicles = snapshot.data!;
                  return ListView(
                    children: vehicles
                        .map(
                          (VehicleModel vehicleModel) => VehicleItemWidget(
                            vehicleModel: vehicleModel,
                            userModel: userModel,
                          ),
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
                  return AddVehicleBottomSheet(
                    uuidUser: userModel.uuidUsuario,
                  );
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
