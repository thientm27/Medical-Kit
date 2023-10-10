class Medicine{
  final String id;
  final String name;
  final String? uses;
  final String? dosageAndAdministration;
  final String? contraindicationsandPrecautions;
  final String? storageAndExpiry;
  final String notes;

  Medicine({
    required this.id,
    required this.name,
    this.uses,
    this.dosageAndAdministration,
    this.contraindicationsandPrecautions,
    this.storageAndExpiry,
    required this.notes,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    id: json['id'],
    name: json['name'],
    uses: json['uses'],
    dosageAndAdministration: json['dosageAndAdministration'],
    contraindicationsandPrecautions: json['contraindicationsandPrecautions'],
    storageAndExpiry: json['storageAndExpiry'],
    notes: json['notes'],
  );
}