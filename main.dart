//menu
import './metodos.dart';

Map davidson = {
  "documento": 1001014992,
  "cuenta": 12345,
  "nombre": "Davinson",
  "apellido": "vanegas",
  "edad": 21,
  "saldo": 50000.toDouble(),
  "ubicacion": "medellin"
};

Map isabel = {
  "documento": 1002040302,
  "cuenta": 1234567,
  "nombre": "isabel",
  "apellido": "vanegas",
  "edad": 20,
  "saldo": 50000.toDouble(),
  "ubicacion": "bello"
};



void main() {
  
  //implementar metodos

  dynamic persona1 = crearCuenta(davidson);
  dynamic persona2 = crearCuenta(isabel);

  double valor = 23000;
  double valor2 = 25000;

  enviarDinero(persona1 , persona2, valor);
  retirarDinero(persona2, valor2);

  verDatos(persona1);
  verDatos(persona2);
  
}
