import 'package:flutter/material.dart';

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(3),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(3),
        bottomRight: Radius.circular(20),
      ),
      child: Image.network(
        'https://yesno.wtf/assets/no/19-2062f4c91189b1f88a9e809c10a5b0f0.gif',
        width: size.width * .7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, ldProgress) {
          if (ldProgress == null) return child;
          return Container(
            width: size.width * .7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Cargando imagen de Mi amor...'),
          );
        },
      ),
    );
  }
}

class ReceivedMessageBubble extends StatelessWidget {
  const ReceivedMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(3),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        _ImageBubble(),
        const SizedBox(height: 10),
      ],
    );
  }
}
