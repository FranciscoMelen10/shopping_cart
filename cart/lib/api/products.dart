import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchProducts() async {
  try {
    // Api de productos
    final apiUrl = 'https://fakestoreapi.com/products';

    // Transformar el String de la Api a un Objeto URL
    final url = Uri.parse(apiUrl);

    // Solicitud a la Api
    final response = await http.get(url);

    // Control de errores
    if (response.statusCode != 200) {
      throw Exception("Error en fetchProducts");
    }

    // Transformar String a Lista
    final List data = jsonDecode(response.body);
    return data;
  } catch (e) {
    throw Exception('Error en fetchProducts: $e');
  }
}
