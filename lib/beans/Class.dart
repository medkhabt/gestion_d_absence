import 'package:flutter/material.dart';



class Class {
  String id;
  String filiere;
  int annee;

  Class({ this.filiere, this.annee}){
   this.id =  '${this.filiere} ${this.annee}';
  }


}