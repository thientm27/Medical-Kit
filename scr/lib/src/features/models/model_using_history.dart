class UsingHistory{
  final String id;
  final String userName;
  final String? medicineId;
  final String  startDate;
  final String  endDate;
  final int quantity;
  final int status;
  final String? medicineName;

  UsingHistory({
    required this.id,
    required this.userName,
    this.medicineId,
    required this.startDate,
    required this.endDate,
    required this.quantity,
    required this.status,
    this.medicineName
  });

  factory UsingHistory.fromJson(Map<String, dynamic> json) => UsingHistory(
    id: json['id'],
    userName: json['userName'],
    medicineId: json['medicineId'],
    startDate: json['startDate'],
    endDate: json['endDate'],
    quantity: json['quantity'],
    status: json['status'],
    medicineName: json['medicineName'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id, 
      'userName': userName,
      'medicineId': medicineId,
      'startDate': startDate,
      'endDate': endDate,
      'quantity': quantity,
      'status': status,
    };
  }
}