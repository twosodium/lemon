import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'createitem_widget.dart' show CreateitemWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateitemModel extends FlutterFlowModel<CreateitemWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for salesPrice widget.
  FocusNode? salesPriceFocusNode;
  TextEditingController? salesPriceTextController;
  String? Function(BuildContext, String?)? salesPriceTextControllerValidator;
  // State field(s) for stock widget.
  FocusNode? stockFocusNode;
  TextEditingController? stockTextController;
  String? Function(BuildContext, String?)? stockTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    salesPriceFocusNode?.dispose();
    salesPriceTextController?.dispose();

    stockFocusNode?.dispose();
    stockTextController?.dispose();
  }
}
