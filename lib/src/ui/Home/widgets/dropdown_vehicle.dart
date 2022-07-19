import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class DropdownVehicle extends StatefulWidget {
  const DropdownVehicle({Key? key}) : super(key: key);

  @override
  State<DropdownVehicle> createState() => _DropdownVehicleState();
}

class _DropdownVehicleState extends State<DropdownVehicle> {
  final List<String> items = <String>['XYZ2J3', 'ABC2J3', 'JKL2J3'];
  String selectedItem = 'XYZ2J3';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: kLight,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          alignment: Alignment.centerLeft,
          isDense: true,
          isExpanded: true,
          dropdownColor: kWhite,
          icon: const Icon(Icons.keyboard_arrow_down),
          value: selectedItem,
          onChanged: (String? string) => setState(() => selectedItem = string!),
          selectedItemBuilder: (BuildContext context) {
            return items.map<Widget>((String item) {
              return Text(item);
            }).toList();
          },
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }
}
