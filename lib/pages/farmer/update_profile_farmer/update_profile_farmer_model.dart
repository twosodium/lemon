import '/backend/supabase/supabase.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:ui';
import 'update_profile_farmer_widget.dart' show UpdateProfileFarmerWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateProfileFarmerModel
    extends FlutterFlowModel<UpdateProfileFarmerWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Full name is required.';
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for intro widget.
  FocusNode? introFocusNode;
  TextEditingController? introTextController;
  String? Function(BuildContext, String?)? introTextControllerValidator;
  String? _introTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    introTextControllerValidator = _introTextControllerValidator;
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    introFocusNode?.dispose();
    introTextController?.dispose();
  }
}
