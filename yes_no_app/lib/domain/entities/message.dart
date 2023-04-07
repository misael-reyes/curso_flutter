enum FromWho { mine, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  // constructor
  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho
  });
}
