import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'thank_you_widget.dart' show ThankYouWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThankYouModel extends FlutterFlowModel<ThankYouWidget> {
  ///  State fields for stateful widgets in this component.

  final thankYouShortcutsFocusNode = FocusNode();
  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
  }

  @override
  void dispose() {
    thankYouShortcutsFocusNode.dispose();
    customAppbarModel.dispose();
  }
}
