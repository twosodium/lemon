import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('NAVBAR_COMP_businessLogo_ON_TAP');
              if (loggedIn) {
                if (FFAppState().accountType == 'Producer') {
                  logFirebaseEvent('businessLogo_navigate_to');

                  context.pushNamed('farmer_mainpage');
                } else if (FFAppState().accountType == 'Business Customer') {
                  logFirebaseEvent('businessLogo_navigate_to');

                  context.pushNamed('business_mainpage');
                } else if (FFAppState().accountType == 'Individual') {
                  logFirebaseEvent('businessLogo_navigate_to');

                  context.pushNamed('public');
                }
              } else {
                logFirebaseEvent('businessLogo_navigate_to');

                context.pushNamed('public');
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Juce--Streamline-Simple-Icons.svg.png',
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 200.0,
            child: TextFormField(
              controller: _model.searchBarTextController,
              focusNode: _model.searchBarFocusNode,
              onFieldSubmitted: (_) async {
                logFirebaseEvent('NAVBAR_searchBar_ON_TEXTFIELD_SUBMIT');
                logFirebaseEvent('searchBar_navigate_to');

                context.pushNamed(
                  'searchResults',
                  queryParameters: {
                    'nameFilter': serializeParam(
                      _model.searchBarTextController.text,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Roboto Mono',
                      letterSpacing: 0.0,
                    ),
                hintText: 'Search ...',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Roboto Mono',
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto Mono',
                    color: Color(0xFF999999),
                    letterSpacing: 0.0,
                  ),
              cursorColor: FlutterFlowTheme.of(context).primaryText,
              validator:
                  _model.searchBarTextControllerValidator.asValidator(context),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 5.0, 0.0),
          child: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: Color(0xFFDFCC3A),
            icon: Icon(
              Icons.person,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('NAVBAR_COMP_person_ICN_ON_TAP');
              if (loggedIn) {
                if (FFAppState().accountType == 'Producer') {
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('UpdateProfile_farmer');
                } else if (FFAppState().accountType == 'Business Customer') {
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('UpdateProfile_business');
                } else if (FFAppState().accountType == 'Individual') {
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('UpdateProfile_customer');
                }
              } else {
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('SignUp');
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
          child: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: Color(0xFFDFCC3A),
            icon: Icon(
              Icons.shopping_cart,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('NAVBAR_COMP_shopping_cart_ICN_ON_TAP');
              if (loggedIn) {
                logFirebaseEvent('IconButton_backend_call');
                _model.userCartItems = await CartsTable().queryRows(
                  queryFn: (q) => q.eqOrNull(
                    'user_id',
                    currentUserUid,
                  ),
                );
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('cart');
              } else {
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('SignUp');
              }

              safeSetState(() {});
            },
          ),
        ),
      ],
    );
  }
}
