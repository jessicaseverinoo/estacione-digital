import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/model/vehicle_model.dart';
import 'package:estacione_digital/src/view/Vehicles/helpers/list_icons_vehicles.dart';
import 'package:flutter/material.dart';

class VehicleItemWidget extends StatefulWidget {

  final VehicleModel vehicleModel;


  VehicleItemWidget({Key? key, required this.vehicleModel}) : super(key: key);

  @override
  State<VehicleItemWidget> createState() => _VehicleItemWidgetState();
}

class _VehicleItemWidgetState extends State<VehicleItemWidget> {
  @override
  Widget build(BuildContext context) {
    bool _lightIsOn = widget.vehicleModel.favorito;

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
                  _lightIsOn = !widget.vehicleModel.favorito;
                });
              },
              icon: Icon(Icons.star,
                  color: widget.vehicleModel.favorito == true ? kAlert : kDark),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: kDark,
              ),
            ),
            IconButton(
              onPressed: () {
                _showMyDialog(context);
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

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
