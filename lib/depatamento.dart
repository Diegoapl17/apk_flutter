
class Departamento{
  
  String? codigo_departamento;
  String? nombre_departamento;

  Departamento({
    this.codigo_departamento,
    this.nombre_departamento,
  });

  Departamento.fromJSON(Map<String, dynamic> json){
    codigo_departamento=json['codigo_departamento'];
    nombre_departamento=json['nombre_departamento'];
  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
      data['codigo_departamento']=codigo_departamento;
      data['nombre_departamento']=nombre_departamento;
      return data;
  }

}