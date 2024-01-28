//menu
import './metodos.dart';
import 'class.dart';

void main(){

    //implementar metodos

    Map davidson = {
      "documento" :  1001014992,
      "cuenta":12345,
      "nombre": "Davinson",
      "apellido" : "vanegas",
      "edad" : 21,
      "saldo" : 49000.toDouble(),
      "ubicacion" : "medellin"
    };

    Cuenta? david = crearCuenta(davidson);

    if(david != null){
      print("Se ha creado la cuenta de ${david.getNombre}");
      verDatos(david);
    }

}