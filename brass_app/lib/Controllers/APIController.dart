import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'dart:math';


/// Sert à récupérer ou envoyer des données au serveur PHP distant.
///
/// Il faut utiliser les modèles fournis dans le dossier APIModels.
/// Ils s'occupent eux-mêmes de la conversion en JSON->DART ou
/// DART->JSON.
class APIController {
  static final String apiURL = "https://webdev.iut-orsay.fr/prj-s4-2021/API/";

  /// Sert à récupérer des données depuis l'API REST avec la méthode GET.
  ///
  /// String data : le nom de la donnée demandée.
  /// Par exemple "utilisateur" retourne la liste de tous les utilisateurs.
  ///
  /// La méthode retourne un objet de type Map<String, dynamic> qu'il faudra
  /// passer en paramètre de la fonction fromJson() des modèles API pour
  /// la conversion en DART.
  static Future<String> fetchData(String data, [ Map<String, dynamic> body ]) async {
    final response = await http.get(apiURL + data);
    return response.body;
  }

  /// Sert à envoyer des données à l'API REST avec la méthode POST.
  ///
  /// String data : le nom de la donnée à envoyer.
  ///
  /// Map<String, dynamic> json : les données à envoyer, en utilisant
  /// la fonction toJson() du modèle API correspondant à la data pour
  /// la conversion en JSON.
  static void sendData(String data, Map<String, dynamic> json) async {
    print("Sending : " + jsonEncode(json));
    final response = await http.post(apiURL + data, body: jsonEncode(json));
    print(response.body);
  }
}
