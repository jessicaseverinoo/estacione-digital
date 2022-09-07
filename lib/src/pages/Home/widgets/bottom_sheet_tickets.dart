import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/pages/Home/widgets/dropdown_vehicle.dart';
import 'package:flutter/material.dart';

class BottomSheetTickets extends StatelessWidget {
  const BottomSheetTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        bottom: 16,
        top: 48,
      ),
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 360,
              mainAxisExtent: 40,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, _) {
                return const Text('Selecione a hora para utilizar');
              },
              childCount: 1,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 3 / 3,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [kGradientDark, kGradientLight])),
                  child: Text.rich(
                      textScaleFactor: 1,
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: '${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: kWhite,
                            ),
                          ),
                          const WidgetSpan(
                              child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              'horas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: kWhite,
                              ),
                            ),
                          )),
                        ],
                      )),
                );
              },
              childCount: 12,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width,
              mainAxisExtent: 100,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, _) {
                return Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text('Selecione um veículo'),
                      ),
                      DropdownVehicle(),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width,
              mainAxisExtent: 70,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, _) {
                return Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: ElevatedButton(
                    child: const Text('Confirmar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
