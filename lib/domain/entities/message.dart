enum FromWho { mine, received }

class Message {
  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });

  final FromWho fromWho;
  final String? imageUrl;
  final String text;
}
