import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'about_us_model.dart';
export 'about_us_model.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({super.key});

  @override
  State<AboutUsWidget> createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  late AboutUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AboutUs'});
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.customAppbarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CustomAppbarWidget(
                            backButton: true,
                            actionButton: false,
                            actionButtonAction: () async {},
                            optionsButtonAction: () async {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 24.0),
                          child: Text(
                            'Welcome to Lemon!',
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Roboto Mono',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Text(
                          'Food waste is responsible for approximately 10% of all greenhouse gas emissions. Reducing food waste has been recognized to be one of the most effective way to fight climate change. \n\nAt Lemon, we are targeting waste that happens in farms. Farmers discard up to 30% of their produce because it isn’t aesthetically pleasing enough for customers, even though it is completely healthy and safe for consumption.\n\nWe believe that there are customers who would want to embrace what nature gifts us, even if they don\'t look \"pretty\" enough.\n\nIf that sounds like you, then you can connect with farmers who want to fight waste by selling their surplus produce with discounts and contributing to our efforts in sustainability.\n\nThank you for being here! \n\nShare Lemon with your friends.',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Roboto Mono',
                                    letterSpacing: 0.0,
                                    lineHeight: 1.4,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        buttonSize: 50.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.share,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent('ABOUT_US_PAGE_share_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_share');
                          await Share.share(
                            'https://lemon.flutterflow.app/',
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
