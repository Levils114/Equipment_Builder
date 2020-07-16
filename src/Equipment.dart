import 'dart:io';
import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class Equipment{

	var file = new File('equipments.txt');

	List<String> equipmentList = [];

	/*String id;*/
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
	    
	    /*this.id = uuid.v4();*/
		this.name = name;
		this.model = model;
		this.company = company;
		this.price = price;

		/*this.created_at = DateTime.now();*/
		final DateTime now = DateTime.now();
		final DateFormat formatter = DateFormat('dd/MM/yyyy');
		final String created_at = formatter.format(now);
	    
	    
	  	file.readAsString().then((String contents) {
			equipmentList.add('$contents');
		});

	  	equipmentList.add('\nEquipment: \nName: $name\nModel: $model \nCompany: $company \nPrice: $price \nCreated At: $created_at\n');

	  	file.readAsString().then((String contents) {
			file.writeAsString('$equipmentList');
		});
	  	
	}
		
	imprimir(){
		return print("\nYou create the following equipment: \n Name: $name \n Model: $model \n Company: $company \n Price: $price");
		
	}

	listEquipments(){
		return file.readAsString().then((String contents){
			print(contents);
			});
	}

	edit(){

		file.readAsString().then((String contents) {

			print('\nWhat value of your equipment you want change([n]name, [m]model, [c]company, [p]price)?: ');
			String option = stdin.readLineSync();

			if (option == 'n'){
				print('\nPut the name of equipment you want edit: ');
		    	String name = stdin.readLineSync();

		    	print('\nPut the new name: ');
		    	String newName = stdin.readLineSync();

		    	final changedName = contents.replaceAll(name, newName);
		    	final newContent = contents.replaceAll(contents, changedName);

		    	file.writeAsString('$newContent');

		    	print('\nNow, you change your equipment, this is it with the new values:');
				return print('\nEquipment edited: \n Name: $newName');

			} else if(option == 'm'){
				print('\nPut the model of equipment you want edit: ');
		    	String model = stdin.readLineSync();

		    	print('\nPut the new model: ');
		    	String newModel = stdin.readLineSync();

		    	final changedModel = contents.replaceAll(model, newModel);
		    	final newContent = contents.replaceAll(contents, changedModel);

		    	file.writeAsString('$newContent');

		    	print('\nNow, you change your equipment, this is it with the new values:');
				return print('\nEquipment edited: \n Model: $newModel');
			} else if(option == 'c'){

				print('\nPut the company of equipment you want edit: ');
		    	String company = stdin.readLineSync();

		    	print('\nPut the new company: ');
		    	String newCompany= stdin.readLineSync();

		    	final changedCompany = contents.replaceAll(company, newCompany);
		    	final newContent = contents.replaceAll(contents, changedCompany);

		    	file.writeAsString('$newContent');

		    	print('\nNow, you change your equipment, this is it with the new values:');
				return print('\nEquipment edited: \n Company: $newCompany');

			} else if(option == 'p'){
				print('\nPut the price of equipment you want edit: ');
		    	String price = stdin.readLineSync();

		    	print('\nPut the new price: ');
		    	String newPrice= stdin.readLineSync();

		    	final changedPrice = contents.replaceAll(price, newPrice);
		    	final newContent = contents.replaceAll(contents, changedPrice);

		    	file.writeAsString('$newContent');

		    	print('\nNow, you change your equipment, this is it with the new values:');
				return print('\nEquipment edited: \n Price: $newPrice');
			} else{
				print('Please, put a valid option');
			}
		});
	}

	remove(){
		file.readAsString().then((String contents) {
			/*equipmentList.add('$contents');*/

			print('\nWhat value of your equipment you want remove([n]name, [m]model, [c]company, [p]price, [ca]created_at)?: ');
			String option = stdin.readLineSync();

			if (option == 'n'){
				print('\nPut the name of equipment you want remove: ');
		    	String name = stdin.readLineSync();

		    	final changedName = contents.replaceAll('Name: $name', '');
		    	final newContent = contents.replaceAll(contents, changedName);

		    	file.writeAsString('$newContent');

		    	print('\nThe name $name, was removed.');

			} else if(option == 'm'){
				print('\nPut the model of equipment you want remove: ');
		    	String model = stdin.readLineSync();

		    	final changedModel = contents.replaceAll('Model: $model', '');
		    	final newContent = contents.replaceAll(contents, changedModel);

		    	file.writeAsString('$newContent');

		    	print('\nThe model $model, was removed.');
			} else if(option == 'c'){

				print('\nPut the company of equipment you want remove: ');
		    	String company = stdin.readLineSync();

		    	final changedCompany = contents.replaceAll('Company: $company', '');
		    	final newContent = contents.replaceAll(contents, changedCompany);

		    	file.writeAsString('$newContent');

		    	print('\nThe company $company, was removed.');

			} else if(option == 'p'){
				print('\nPut the price of equipment you want remove: ');
		    	String price = stdin.readLineSync();

		    	final changedPrice = contents.replaceAll('Price: $price.0', '');
		    	final newContent = contents.replaceAll(contents, changedPrice);

		    	file.writeAsString('$newContent');

		    	print('\nThe price $price, was removed.');
			} else if(option == 'ca'){
				print('\nPut the created at of equipment you want remove(dd/MM/yyy): ');
		    	String created_at = stdin.readLineSync();

		    	final changedCreatedAt = contents.replaceAll('Created At: $created_at', '');
		    	final newContent = contents.replaceAll(contents, changedCreatedAt);

		    	file.writeAsString('$newContent');

		    	print('\nThe Created at $created_at, was removed.');
			} else{
				print('Please, put a valid option');
			}
		});
	}
}
