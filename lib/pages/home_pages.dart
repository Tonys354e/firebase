import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

CollectionReference tasksReference = FirebaseFirestore.instance.collection('tasks');


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("Firebase danii"),
),

body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center ,
    children: [
      ElevatedButton(
        
        onPressed: (){
          tasksReference.get().then((QuerySnapshot value){
            
            QuerySnapshot collection = value;
            collection.docs.forEach((QueryDocumentSnapshot element){
              Map <String, dynamic> myMap=element.data() as Map<String, dynamic>;
              print(myMap["title"]);
            }
            );
          });
        }, 

        child: Text("Obtener la data")
      ),
    
      ElevatedButton(onPressed: (){

        tasksReference .add(
          {
            "title":"Ir a comprar libros 2",
            "description": "comprar libros de matematica"  

          },
          ).then(( DocumentReference value){
            print(value.id);
          }).catchError((error){
            print("Ocurrio un error en el registro");
          }).whenComplete((){
            print("El registro ah terminado ");
          });

      },
       child: Text("Agregar documento",
       
       ),
       ),
    
      ElevatedButton(onPressed: (){ 
        tasksReference
        .doc("lCQAop38sOVqV8Dlg83v")
        .update(
          {
            "title": "Ir de paseo a el mirador ",
            "description":"Tenemos que salir en la tarde",
          },
          )
        .catchError(
          (error){
            print(error);
          }
          ).whenComplete((){
              print("Actualizacion terminada");
          },
          ) ;
      },       
      child: Text("Actualizar documento",
      ),
      ),
      
      ElevatedButton(onPressed: (){
        tasksReference.doc("lCQAop38sOVqV8Dlg83v").delete().catchError(
          (error){
            print(error);
          },
        ).whenComplete(
          (){
            print("La eliminacion esta completada");
            },
          );
      }, 
      child: Text(
        "Eliminar Documento",
        ),
      ),
      ElevatedButton(onPressed: (){
          tasksReference.doc("A00001").set(
            {
              "title": "Ir al consierto",
              "description": "Este fin de semana debemos ir a tomar ",
            },
          ).catchError((error){
              print(error);
          }).whenComplete((){
            print("Creacion completada");
          });
      },
       child: Text("Agregar documento perzonalizado",
       ),
      ),

    ],
  ),
),

);
}
}