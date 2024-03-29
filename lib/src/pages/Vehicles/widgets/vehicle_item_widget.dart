import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/models/user_model.dart';
import 'package:estacione_digital/src/models/vehicle_model.dart';
import 'package:estacione_digital/src/pages/Vehicles/widgets/edit_vehicle_bottom_sheet.dart';
import 'package:estacione_digital/src/providers/vehicle_provider.dart';
import 'package:estacione_digital/src/shared/helpers/list_icons_vehicles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleItemWidget extends StatefulWidget {
  final VehicleModel vehicleModel;
  final UserModel userModel;

  const VehicleItemWidget(
      {Key? key, required this.vehicleModel, required this.userModel})
      : super(key: key);

  @override
  State<VehicleItemWidget> createState() => _VehicleItemWidgetState();
}

class _VehicleItemWidgetState extends State<VehicleItemWidget> {
  @override
  Widget build(BuildContext context) {
    final VehicleProvider vehicleProvider = Provider.of(context);
    bool isFavoriteVehicle = widget.vehicleModel.favorito;

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            listIconsVehicles[widget.vehicleModel.tipoVeiculo],
            const SizedBox(
              width: 8,
            ),
            Text(
              widget.vehicleModel.placa,
              style: const TextStyle(
                  fontSize: 16, color: kDark, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavoriteVehicle = !widget.vehicleModel.favorito;
                });
              },
              icon: Icon(Icons.star,
                  color: widget.vehicleModel.favorito == true ? kAlert : kDark),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return EditVehicleBottomSheet(
                      uuidUser: widget.userModel.uuidUsuario,
                      vehicleModel: widget.vehicleModel,
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.edit,
                color: kDark,
              ),
            ),
            IconButton(
              onPressed: () {
                _showMyDialogDelete(context, widget.vehicleModel,
                    widget.userModel, vehicleProvider);
              },
              icon: const Icon(
                Icons.delete,
                color: kDanger,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialogDelete(context, VehicleModel vehicleModel,
      UserModel userModel, VehicleProvider vehicleProvider) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Apagar veículo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Tem certeza que deseja apagar este veículo?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirmar'),
              onPressed: () {
                _deleteVehicles(vehicleModel, userModel, vehicleProvider);
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteVehicles(VehicleModel vehicleModel, UserModel userModel,
      VehicleProvider vehicleProvider) {
    vehicleProvider.deleteVehicles(
        uuidUser: userModel.uuidUsuario, uuidVeiculo: vehicleModel.uuidVeiculo);
    Navigator.of(context).pop();
  }
}
