class Vouncher {
  final List<VouncherItem> items;

  const Vouncher({
    required this.items,
  });
}

class VouncherItem {
  final int quantity;
  final String description;
  final String date;
  final double unitPrice;

  const VouncherItem({
    required this.description,
    required this.date,
    required this.quantity,
    required this.unitPrice,
  });
}
