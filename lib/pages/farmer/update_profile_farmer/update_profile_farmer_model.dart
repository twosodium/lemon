import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/custom_appbar_widget.dart';
import '/componentsdefault/title_with_subtitle/title_with_subtitle_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
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

  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for emailentry widget.
  FocusNode? emailentryFocusNode;
  TextEditingController? emailentryTextController;
  String? Function(BuildContext, String?)? emailentryTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for intro widget.
  FocusNode? introFocusNode;
  TextEditingController? introTextController;
  String? Function(BuildContext, String?)? introTextControllerValidator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Model for titleWithSubtitle component.
  late TitleWithSubtitleModel titleWithSubtitleModel1;
  // Model for titleWithSubtitle component.
  late TitleWithSubtitleModel titleWithSubtitleModel2;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    titleWithSubtitleModel1 =
        createModel(context, () => TitleWithSubtitleModel());
    titleWithSubtitleModel2 =
        createModel(context, () => TitleWithSubtitleModel());
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    emailentryFocusNode?.dispose();
    emailentryTextController?.dispose();

    introFocusNode?.dispose();
    introTextController?.dispose();

    titleWithSubtitleModel1.dispose();
    titleWithSubtitleModel2.dispose();
  }
}
