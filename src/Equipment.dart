import 'dart:io';
import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:uuid/uuid.dart';

class Equipment{

	var file = new File('equipments.txt');

	List<String> equipmentList = [];

	String id;
	String name;
	String model;
	String company;
	double price;
	var created_at;

	create(){
		var uuid = new Uuid();

		print('\nName: ');
	    String name = stdin.readLineSync();

	    print('\nModel: ');
	    String model = stdin.readLineSync();

	    print('\nCompany: ');
	    String company = stdin.readLineSync();

	    print('\nPrice: ');
	    double price = double.tryParse(stdin.readLineSync()) ?? 0;

	    this.id = uuid.v4();
	  	this.name = name;
	  	this.model = model;
	  	this.company = company;
	  	this.price = price;
	  	this.created_at = DateTime.now();

	  	file.readAsString().then((String contents) {
			equipmentList.add('$contents');
		});

	  	equipmentList.add('\nEquipament: {\nID: $id,\nName: $name, \nModel: $model, \nCompany: $company, \nPrice: $price, \nCreated At: $created_at\n}\n' );

	  	file.readAsString().then((String contents) {
			file.writeAsString('$equipmentList');
		});
	  	
	}
		
	imprimir(){
		return print("\nYou create the following equipment: \n Name: $name \n Model: $model \n Company: $company \n Price: $price \n Created At: $created_at");
		
	}

	listEquipments(){
		return file.readAsString().then((String contents){
			print(contents);
			});
	}

	/*edit(String id){
		equipmentList.
	}*/


	/*restart(){
		print('\nDo you want go to menu? y/N');
	    String opcao = stdin.readLineSync();

	    if(opcao == "y"){
	      print('+--------------------------------------------+');
		  print('|                                            |');
		  print('|    Choose some option:                     |');
		  print('|                                            |');
		  print('|    1 - Create a new equipment              |');
		  print('|    2 - List created equipments             |');
		  print('|                                            |');
		  print('+--------------------------------------------+\n');


		  print('Opção: ');
		  String opcao = stdin.readLineSync();

		  if(opcao == "1"){

		  	create();
		    
		    imprimir();

		    restart();

		  	} else if(opcao == "2"){
		  		listEquipments();

		  		restart();
		  	} else {
		  		print('Please, type a valid option');
		  	}

	    } else if(opcao == "N"){
	    	return;
	    } else{
	    	print('Please, type a valid option');
	    }
	}	*/


}
