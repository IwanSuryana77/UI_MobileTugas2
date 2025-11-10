import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  final List<Map<String, dynamic>> menus = const [
    {'icon': FontAwesomeIcons.infoCircle, 'label': 'm-Info'},
    {'icon': FontAwesomeIcons.exchangeAlt, 'label': 'm-Transfer'},
    {'icon': FontAwesomeIcons.wallet, 'label': 'm-Payment'},
    {'icon': FontAwesomeIcons.shoppingCart, 'label': 'm-Commerce'},
    {'icon': FontAwesomeIcons.mobileAlt, 'label': 'Cardless'},
    {'icon': FontAwesomeIcons.cog, 'label': 'm-Admin'},
    {'icon': FontAwesomeIcons.gift, 'label': 'Lifestyle'},
    {'icon': FontAwesomeIcons.creditCard, 'label': 'Flazz'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: menus.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),

    //   itemBuilder: (context, index) {
    //   final item = menus[index];
    //   return Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Container(
    //         width: 60, 
    //         height: 60, 
    //         decoration: BoxDecoration(
    //           color: Colors.blue[50],
    //           borderRadius: BorderRadius.circular(9), 
    //           border: Border.all(color: Colors.blue[100]!),
    //         ),
    //         child: Icon(
    //           item['icon'],
    //           color: Colors.blue[700],
    //           size: 26,
    //         ),
    //       ),
    //       const SizedBox(height: 6),
    //       Text(
    //         item['label'],
    //         textAlign: TextAlign.center,
    //         style: const TextStyle(fontSize: 12, color: Colors.black87),
    //       ),
    //     ],
    //   );
    // }

      itemBuilder: (context, index) {
        final item = menus[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(item['icon'], color: Colors.blue[700], size: 22),
            ),
            const SizedBox(height: 6),
            Text(
              item['label'],
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        );
      },
    );
  }
}

