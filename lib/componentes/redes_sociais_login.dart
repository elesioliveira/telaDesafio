import 'package:flutter/material.dart';

class IconsLogin extends StatelessWidget {
  const IconsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 0.05),
            ),
            width: MediaQuery.sizeOf(context).width * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset('lib/assets/icons/facebook.png'),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 0.05),
            ),
            width: MediaQuery.sizeOf(context).width * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset('lib/assets/icons/twitter.png'),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 0.05),
            ),
            width: MediaQuery.sizeOf(context).width * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset('lib/assets/icons/google.png'),
            ),
          ),
        ],
      ),
    );
  }
}
