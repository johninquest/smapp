import 'package:flutter/material.dart';
import '../styles/style.dart';

class AppData {
  List<DropdownMenuItem<String>> userRoleList = [
    const DropdownMenuItem(
        value: '', child: Text('', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'counselor', child: Text('Counselor', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'principal', child: Text('Principal', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'teacher', child: Text('Teacher', style: DropdownListStyle)),
  ];

  List<DropdownMenuItem<String>> genderList = [
    const DropdownMenuItem(value: '', child: Text('')),
    const DropdownMenuItem(
        value: 'female', child: Text('Female', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'male', child: Text('Male', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'other', child: Text('Other', style: DropdownListStyle)),
  ];

  List<DropdownMenuItem<String>> salutationsList = [
    const DropdownMenuItem(
        value: '', child: Text('', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'dr.', child: Text('Dr.', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'madame', child: Text('Madame', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'monsieur', child: Text('Monsieur', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'mr.', child: Text('Mr.', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'mrs.', child: Text('Mrs.', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'ms.', child: Text('Ms.', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: '', child: Text('None', style: DropdownListStyle)),
  ];

  List<DropdownMenuItem<String>> classNumberList = [
    const DropdownMenuItem(
        value: '1', child: Text('1', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: '2', child: Text('2', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: '3', child: Text('3', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: '4', child: Text('4', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: '5', child: Text('5', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'l6', child: Text('Lower 6', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'u6', child: Text('Upper 6', style: DropdownListStyle)),
  ];

  List<DropdownMenuItem<String>> classLetterList = [
    const DropdownMenuItem(
        value: 'a', child: Text('A', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'b', child: Text('B', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'c', child: Text('C', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'd', child: Text('D', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'e', child: Text('E', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'f', child: Text('F', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'g', child: Text('G', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'h', child: Text('H', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'i', child: Text('I', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'j', child: Text('J', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'k', child: Text('K', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'l', child: Text('L', style: DropdownListStyle)),
    const DropdownMenuItem(
        value: 'm', child: Text('M', style: DropdownListStyle)),
  ];
}
