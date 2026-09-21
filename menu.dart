import 'dart:io';

void main() {
  List<String> datos = [];
  int opcion;

  do {
    print('MENÚ');
    print('1. Insertar');
    print('2. Cambiar');
    print('3. Eliminar');
    print('4. Leer');
    print('5. Salir');
    stdout.write('Elige una opción: ');

    opcion = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    switch (opcion) {
      case 1:
        stdout.write('Ingresa el valor a insertar: ');
        String nuevo = stdin.readLineSync() ?? '';
        datos.add(nuevo);
        print('Valor "$nuevo" insertado.');
        break;

      case 2:
        if (datos.isEmpty) {
          print('No hay datos para cambiar.');
          break;
        }
        leerDatos(datos);
        stdout.write('Índice a cambiar (0 - ${datos.length - 1}): ');
        int idx = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        if (idx >= 0 && idx < datos.length) {
          stdout.write('Nuevo valor: ');
          String valor = stdin.readLineSync() ?? '';
          datos[idx] = valor;
          print('Cambiado correctamente.');
        } else {
          print('Índice inválido.');
        }
        break;

      case 3:
        if (datos.isEmpty) {
          print('No hay datos para eliminar.');
          break;
        }
        leerDatos(datos);
        stdout.write('Índice a eliminar (0 - ${datos.length - 1}): ');
        int idx = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        if (idx >= 0 && idx < datos.length) {
          String eliminado = datos.removeAt(idx);
          print('Eliminado: "$eliminado"');
        } else {
          print('Índice inválido.');
        }
        break;

      case 4:
        if (datos.isEmpty) {
          print('La lista está vacía.');
        } else {
          leerDatos(datos);
        }
        break;

      case 5:
        print('Saliendo del programa...');
        break;

      default:
        print('Opción no válida.');
    }
  } while (opcion != 5);
}

void leerDatos(List<String> datos) {
  print('\nDatos actuales:');
  for (int i = 0; i < datos.length; i++) {
    print('  [$i] ${datos[i]}');
  }
}
