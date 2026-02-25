// examen dart

import 'dart:io';

void main (){
  List<Map<String, dynamic>> productos = [];
  bool activo = true;

  while (activo) {
    print("\n ******** Menu catalogo de productos ********");
    print("1. Agregar producto");
    print("2. listar producto");
    print("3. Actualizar producto");
    print("4. Eliminar producto");
    print("5. Salir ");

    int? opcion = int.tryParse(stdin.readLineSync()!);

    switch (opcion){ 
      case 1:
      agregarProducto(productos);
      break;

      case 2:
      listarProducto(productos);
      break;

      case 3:
      actualizarProducto(productos);
      break;

      case 4:
     eliminarProducto(productos);
      break;

      case 5:
      print("Saliendo del sistema");
      activo = false;
      break;

      default:
      print("Opcion invalida");

      

    }

  }
  
}

void agregarProducto (List<Map<String, dynamic>> productos){
  print("\n ***** Agregar productos *****");

  print("Ingrese el nombre del producto:");
  String nombre = stdin.readLineSync() ?? "";

  if (nombre.isEmpty){
    print("Ponga un nombre");
    return;
  }

  print("Ingrese el precio del producto:");
  double? precio = double.tryParse(stdin.readLineSync() ?? "");

  if (precio == null || precio < 0) {
    print("Precio inválido");
    return;
  }

  print("Ingrese la cantidad disponible:");
  int? cantidad = int.tryParse(stdin.readLineSync() ?? "");

  if (cantidad == null || cantidad < 0) {
    print("Cantidad inválida");
    return;
  }

  Map<String, dynamic> producto = {
    "nombre": nombre,
    "precio": precio,
    "cantidad": cantidad
  };

  productos.add(producto);

  print("Producto agregado");
  
}

void listarProducto (List<Map<String, dynamic>> productos){
  print("\n ***** Lista de productos *****");

  if (productos.isEmpty){
    print("No hay producto registrado");
    return;

  }

  for (int i = 0; i < productos.length; i++){
    print("$i - nombre: ${productos[i]['nombre']}| precio: ${productos[i]['precio']}| cantidad disponible: ${productos[i]['cantidad']}");
  }
  
}
void actualizarProducto (List<Map<String, dynamic>> productos){
  print("\n ***** Actualiza los productos *****");

  if(productos.isEmpty){
    print("No se puede actualizar el producto");
    return;
  }

  listarProducto(productos);

  print("Ingrese el indice del producto");
  int? indice = int.tryParse(stdin.readLineSync()?? "");

  if (indice == null || indice < 0 || indice >= productos.length){
    print("Seleccione otro indice");
    return;
  }

  print("Nuevo nombre");
  String? nuevoNombre = stdin.readLineSync()?? "";

  print("Nuevo precio");
  String? nuevoPrecio_actualizado = stdin.readLineSync()?? "";

  print("Nueva cantidad disponible");
  String? nuevaCantidad_disponible = stdin.readLineSync()?? "";

  if (nuevoNombre.isNotEmpty) {
    productos[indice]['nombre'] = nuevoNombre;
  }

  if (nuevoPrecio_actualizado.isNotEmpty) {
    double? nuevoPrecio = double.tryParse(nuevoPrecio_actualizado);
    if (nuevoPrecio != null && nuevoPrecio >= 0) {
      productos[indice]['precio'] = nuevoPrecio;
    }
  }

  if (nuevaCantidad_disponible.isNotEmpty) {
    int? nuevaCantidad = int.tryParse(nuevaCantidad_disponible);
    if (nuevaCantidad != null && nuevaCantidad >= 0) {
      productos[indice]['cantidad'] = nuevaCantidad;
    }
  }

  print("Producto actualizado correctamente");
}

void eliminarProducto(List<Map<String, dynamic>> productos) {
  print("\n***** Eliminar producto *****");

  if (productos.isEmpty) {
    print("No hay productos para eliminar");
    return;
  }

  listarProducto(productos);

  print("Ingrese el índice del producto a eliminar:");
  int? indice = int.tryParse(stdin.readLineSync() ?? "");

  if (indice == null || indice < 0 || indice >= productos.length) {
    print("Índice inválido");
    return;
  }

  productos.removeAt(indice);

  print("Producto eliminado correctamente");
}
