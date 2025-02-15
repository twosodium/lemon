import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_preferences_model.dart';
export 'edit_preferences_model.dart';

class EditPreferencesWidget extends StatefulWidget {
  const EditPreferencesWidget({
    super.key,
    required this.page,
  });

  final int? page;

  @override
  State<EditPreferencesWidget> createState() => _EditPreferencesWidgetState();
}

class _EditPreferencesWidgetState extends State<EditPreferencesWidget> {
  late EditPreferencesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPreferencesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EditPreferences'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
