class MainModel {
  int required;
  int inoculated;

  int vaccinationId;

  String diseaseName;

  String vaccineName;

  String icon;
  int score;

  MainModel({
    required this.required,
    required this.inoculated,
    required this.vaccinationId,
    required this.diseaseName,
    required this.vaccineName,
    required this.icon,
    required this.score,
  });
}
