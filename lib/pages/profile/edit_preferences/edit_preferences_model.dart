import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_preferences_widget.dart' show EditPreferencesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPreferencesModel extends FlutterFlowModel<EditPreferencesWidget> {
  ///  Local state fields for this page.

  List<String> allergenSelection = [];
  void addToAllergenSelection(String item) => allergenSelection.add(item);
  void removeFromAllergenSelection(String item) =>
      allergenSelection.remove(item);
  void removeAtIndexFromAllergenSelection(int index) =>
      allergenSelection.removeAt(index);
  void insertAtIndexInAllergenSelection(int index, String item) =>
      allergenSelection.insert(index, item);
  void updateAllergenSelectionAtIndex(int index, Function(String) updateFn) =>
      allergenSelection[index] = updateFn(allergenSelection[index]);

  String? dietSelection;

  List<String> ingredientSelection = [];
  void addToIngredientSelection(String item) => ingredientSelection.add(item);
  void removeFromIngredientSelection(String item) =>
      ingredientSelection.remove(item);
  void removeAtIndexFromIngredientSelection(int index) =>
      ingredientSelection.removeAt(index);
  void insertAtIndexInIngredientSelection(int index, String item) =>
      ingredientSelection.insert(index, item);
  void updateIngredientSelectionAtIndex(int index, Function(String) updateFn) =>
      ingredientSelection[index] = updateFn(ingredientSelection[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
