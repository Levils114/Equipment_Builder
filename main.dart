import 'dart:io';
import './Equipment.dart';

void main(List<String> arguments) {
  print('+--------------------------------------------+');
  print('|                                            |');
  print('|    Choose some option:                     |');
  print('|                                            |');
  print('|    1 - Create a new equipment              |');
  print('|    2 - List created equipments             |');
  print('|                                            |');
  print('+--------------------------------------------+\n');


  print('Option: ');
  String opcao = stdin.readLineSync();

  if(opcao == "1"){

  	var equipment = Equipment();

  	equipment.create();
    
    equipment.imprimir();

    equipment.restart();

  	} else if(opcao == "2"){
      var equipment = Equipment();

      equipment.listEquipments();

      equipment.restart();
  	} else {
  		print('\nPlease, type a valid option');
  	}
}