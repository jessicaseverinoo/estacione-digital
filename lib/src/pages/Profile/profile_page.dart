import 'package:estacione_digital/design_system/colors.dart';
import 'package:estacione_digital/src/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final UserModel userModel;

  const ProfilePage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kPrimary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: kWhite,
                      child: Icon(
                        Icons.person_rounded,
                        color: kPrimary,
                      )),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
<<<<<<< HEAD
                    children: [
                      Text(
                        userModel.nome,
                        style: const TextStyle(
=======
                    children: const [
                      Text(
                        'Jessica Severino',
                        style: TextStyle(
>>>>>>> 0b3f937 (add controller navigation)
                            color: kWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
<<<<<<< HEAD
                      const SizedBox(height: 4),
                      Text(
                        'Status: ${userModel.status}',
                        style: const TextStyle(color: kWhite),
=======
                      SizedBox(height: 4),
                      Text(
                        'Status: Ativo',
                        style: TextStyle(color: kWhite),
>>>>>>> 0b3f937 (add controller navigation)
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: kCoolGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
<<<<<<< HEAD
              children: [
                const Text(
=======
              children: const [
                Text(
>>>>>>> 0b3f937 (add controller navigation)
                  'CPF',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
<<<<<<< HEAD
                  userModel.cpfCnpj,
                  style: const TextStyle(
=======
                  '407.813.158-16',
                  style: TextStyle(
>>>>>>> 0b3f937 (add controller navigation)
                    color: kWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
<<<<<<< HEAD
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                const Text(
=======
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                Text(
>>>>>>> 0b3f937 (add controller navigation)
                  'Email',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
<<<<<<< HEAD
                  userModel.email,
                  style: const TextStyle(
=======
                  'jessicaa.severinoo@gmail.com',
                  style: TextStyle(
>>>>>>> 0b3f937 (add controller navigation)
                    color: kWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
