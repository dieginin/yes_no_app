import 'package:flutter/material.dart';

import '/domain/entities/message.dart';

class _ImageBubble extends StatelessWidget {
  const _ImageBubble(this.imageUrl);

  final String imageUrl;

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
        imageUrl,
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
  const ReceivedMessageBubble({
    super.key,
    required this.message,
  });

  final Message message;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        _ImageBubble(message.imageUrl!),
        const SizedBox(height: 10),
      ],
    );
  }
}
