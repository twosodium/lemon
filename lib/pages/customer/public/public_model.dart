import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/components/category_widget.dart';
import '/components/navbar_widget.dart';
import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'public_widget.dart' show PublicWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PublicModel extends FlutterFlowModel<PublicWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in public widget.
  List<FactsRow>? facts;
  // Stores action output result for [Backend Call - Query Rows] action in public widget.
  List<UsersRow>? businessAround;
  // Model for navbar component.
  late NavbarModel navbarModel;
  // Stores action output result for [Backend Call - Query Rows] action in product widget.
  List<UsersRow>? farmerInfo;
  // Stores action output result for [Backend Call - Query Rows] action in product widget.
  List<UsersRow>? farmerInfo2;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
