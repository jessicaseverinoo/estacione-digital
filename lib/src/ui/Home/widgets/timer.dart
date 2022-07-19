import 'package:estacione_digital/design_system/colors.dart';
import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  const Timer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: kDark,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Image(
                image: AssetImage('assets/images/hourglass-not-done.png'),
                height: 64,
              ),
              const VerticalDivider(color: kDark),
              Column(
                children: const [
                  Text(
                    '59:00',
                    style: TextStyle(
                      color: kDark,
                      fontSize: 54,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'tempo restante',
                    style: TextStyle(
                      color: kDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
