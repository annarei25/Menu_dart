import 'dart:io';

void main() {
  List<String> tareas = [];
  int opcion;

  do {
    print('MENÚ');
    print('1. Insertar Tarea');
    print('2. Modificar Tarea');
    print('3. Eliminar Tarea');
    print('4. Leer Tarea');
    print('5. Salir');
    stdout.write('Elige una opción: ');

    opcion = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    switch (opcion) {
      case 1:
        stdout.write('Ingresa tu tarea: ');
        String nuevo = stdin.readLineSync() ?? '';
        tareas.add(nuevo);
        print('Tarea agregada: "$nuevo"');
        break;

      case 2:
        if (tareas.isEmpty) {
          print('No hay tareas para cambiar.');
          break;
        }
        leerDatos(tareas);
        stdout.write('Índice a cambiar (0 - ${tareas.length - 1}): ');
        int idx = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        if (idx >= 0 && idx < tareas.length) {
          stdout.write('Nuevo valor: ');
          String valor = stdin.readLineSync() ?? '';
          tareas[idx] = valor;
          print('Cambiado correctamente.');
        } else {
          print('Índice inválido.');
        }
        break;

      case 3:
        if (tareas.isEmpty) {
          print('No hay tareas para eliminar.');
          break;
        }
        leerDatos(tareas);
        stdout.write('Índice a eliminar (0 - ${tareas.length - 1}): ');
        int idx = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        if (idx >= 0 && idx < tareas.length) {
          String eliminado = tareas.removeAt(idx);
          print('Tarea eliminada: "$eliminado"');
        } else {
          print('Índice inválido.');
        }
        break;

      case 4:
        if (tareas.isEmpty) {
          print('La lista está vacía.');
        } else {
          leerDatos(tareas);
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
