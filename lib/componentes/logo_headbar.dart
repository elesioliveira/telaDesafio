import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tela_desafio/componentes/paleta_cores.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.sizeOf(context).width * 1,
      height: MediaQuery.sizeOf(context).height * 1,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Stack(
        children: [
          Positioned(
            bottom: 51.55,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width * 1,
              child: Image.asset(
                'lib/assets/hamburguer.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Opacity(
            opacity: 0.65,
            child: Container(
              width: MediaQuery.of(context).size.width * 20,
              height: MediaQuery.of(context).size.width * 20,
              color: PaletaDeCores.vermelho,
            ),
          ),
          Positioned(
            right: MediaQuery.sizeOf(context).width * 0.26,
            left: MediaQuery.sizeOf(context).width * 0.26,
            bottom: MediaQuery.sizeOf(context).height * 0.22,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                'lib/assets/hungry.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}
