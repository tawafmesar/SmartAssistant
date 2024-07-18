// class ModelsModel {
//   final String id;
//   final int created;
//   final String root;
//
//   ModelsModel({
//     required this.id,
//     required this.root,
//     required this.created,
//   });
//
//   factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
//         id: json["id"],
//         root: json["root"],
//         created: json["created"],
//       );
//
//   static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) {
//     return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
//   }
// }


class ModelsModel {
  final String id;
  final String root;
  final int created;

  ModelsModel({
    required this.id,
    required this.root,
    required this.created,
  });

  factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
    id: json['id'] ?? '',
    root: json['root'] ?? '',
    created: json['created'] ?? 0,
  );

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }
}

//
// class ModelsModel {
//   final String id;
//   final int created;
//   final String root;
//
//   ModelsModel({
//     required this.id,
//     required this.root,
//     required this.created,
//   });
//
//   factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
//     id: json["id"] ?? '',
//     root: json["root"] ?? '',
//     created: json["created"] as int? ?? 0, // Provide a default value (0 in this case) if the value is null
//   );
//
//   static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) {
//     return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
//   }
// }
