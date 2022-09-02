import 'package:estacione_digital/src/shared/widgets/error_widget.dart';
import 'package:estacione_digital/src/view/Vehicles/widget/add_vehicle_bottom_sheet.dart';
import 'package:estacione_digital/src/view/Vehicles/vehicle_model.dart';
import 'package:estacione_digital/src/view/Vehicles/vehicle_provider.dart';
import 'package:estacione_digital/src/view/Vehicles/widget/card_item_widget.dart';
import 'package:flutter/material.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({Key? key}) : super(key: key);

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
              future: vehiclesProvider.getVehicles(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<VehicleItem>> snapshot) {
                if (snapshot.hasData) {
                  List<VehicleItem> vehicles = snapshot.data!;
                  return ListView(
                    children: vehicles
                        .map(
                          (VehicleItem vehicle) => CardItemWidget(
                              vehicleType: vehicle.tipoVeiculo,
                              licensePlate: vehicle.placa,
                              favorite: vehicle.favorito),
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
