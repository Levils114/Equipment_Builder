import 'dart:io';
import './Equipment.dart';

void main(List<String> arguments) {
  print('+--------------------------------------------+');
  print('|                                            |');
  print('|    Choose an option:                       |');
  print('|                                            |');
  print('|    1 - Create a new equipment              |');
  print('|    2 - List created equipments             |');
  print('|    3 - Edit an equipment                   |');
  print('|    4 - Delete an equipment                 |');
  print('|                                            |');
  print('+--------------------------------------------+\n');


  print('Option: ');
  String opcao = stdin.readLineSync();

  if(opcao == "1"){

  	var equipment = Equipment();

  	equipment.create();
    
    equipment.imprimir();

  	} else if(opcao == "2"){
      var equipment = Equipment();

      equipment.listEquipments();

  	 } else if(opcao == "3"){
      var equipment = Equipment();

      equipment.edit();

     } else if(opcao == "4"){

      var equipment = Equipment();

      equipment.remove();

     } else {
      print('\nPlease, type a valid option');
    }
}