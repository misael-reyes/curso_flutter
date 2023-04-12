/// el objetivo de este modelo no es más que tener todas las propiedades
/// del modelo como lo trae nuestra respuesta del servidor

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  // constructor con nombre
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) =>
      YesNoModel(
        answer: json['answer'], 
        forced: json['forced'], 
        image: json['image']
      );
}
