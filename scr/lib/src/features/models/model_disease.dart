import 'package:scr/src/features/models/model_medicine.dart';
class Disease{
  final String id;
  final String name;
  final String description;
  final String symptoms;
  final String prevalence;
  final String riskFactors;
  final String treatment;
  final String prognosis;
  final List<Medicine>? medicines;

  Disease({
    required this.id,
    required this.name,
    required this.description,
    required this.symptoms,
    required this.prevalence,
    required this.riskFactors,
    required this.treatment,
    required this.prognosis,
    this.medicines,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
  List<dynamic> medicinesJson = json['originalMedicines'] ?? [];
  List<Medicine> medicines = medicinesJson.map((medicineJson) {
    return Medicine.fromJson(medicineJson);
  }).toList();

  return Disease(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    symptoms: json['symptoms'],
    prevalence: json['prevalence'],
    riskFactors: json['riskFactors'],
    treatment: json['treatment'],
    prognosis: json['prognosis'],
    medicines: medicines,
  );
}
}
