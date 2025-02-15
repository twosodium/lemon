import '/backend/supabase/supabase.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/meal_card_loading/meal_card_loading_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'public_widget.dart' show PublicWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PublicModel extends FlutterFlowModel<PublicWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbar component.
  late NavbarModel navbarModel;
  Stream<List<ProductsRow>>? gridViewSupabaseStream1;
  Stream<List<ProductsRow>>? gridViewSupabaseStream2;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
