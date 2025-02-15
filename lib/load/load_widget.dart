import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'load_model.dart';
export 'load_model.dart';

class LoadWidget extends StatefulWidget {
  const LoadWidget({
    super.key,
    required this.userID,
    required this.userEmail,
    required this.userType,
  });

  final String? userID;
  final String? userEmail;
  final String? userType;

  @override
  State<LoadWidget> createState() => _LoadWidgetState();
}

class _LoadWidgetState extends State<LoadWidget> {
  late LoadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'load'});
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
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('LOAD_PAGE_Column_9e0a19ms_ON_TAP');
              if (widget!.userType == 'Producer') {
                logFirebaseEvent('Column_navigate_to');

                context.pushNamed('EditProfile');
              } else {
                if (widget!.userType == 'Business') {
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed('UpdateProfile_business');
                }
              }

              logFirebaseEvent('Column_navigate_to');

              context.pushNamed('public');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
