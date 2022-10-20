class Product{
  String? key;
  ProductData? productData;

  Product({this.key, this.productData});
}

class ProductData{
  String? descripcion;
  String imagen= "";
  int? precio;

  ProductData({this.descripcion, required this.imagen, this.precio});

  ProductData.fromJson(Map<dynamic, dynamic> json){
    descripcion = json['descripcion'];
    imagen = json['imagen'];
    precio = json['precio'];
  }
}