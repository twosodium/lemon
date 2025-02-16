import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/navbar_widget.dart';
import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'farmer_mainpage_model.dart';
export 'farmer_mainpage_model.dart';

class FarmerMainpageWidget extends StatefulWidget {
  const FarmerMainpageWidget({super.key});

  @override
  State<FarmerMainpageWidget> createState() => _FarmerMainpageWidgetState();
}

class _FarmerMainpageWidgetState extends State<FarmerMainpageWidget> {
  late FarmerMainpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FarmerMainpageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'farmer_mainpage'});
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
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 70.0, 24.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: 342.0,
                          height: 105.84,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 10.0, 15.0, 0.0),
                            child: Text(
                              'Thank you for being a part of Lemon! With every produce you add and sell, we are getting one step closer to our goal of tacklng food waste by embracing healthy, sustainable, and affordable food.',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Roboto Mono',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'FARMER_MAINADD_NEW_ITEM_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('createitem');
                        },
                        text: 'Add New Item',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          padding: EdgeInsets.all(8.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Roboto Mono',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Text(
                                'My Produce',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: FutureBuilder<List<ProductsRow>>(
                                future: ProductsTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'seller_id',
                                    currentUserUid,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 25.0,
                                        height: 25.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ProductsRow> gridViewProductsRowList =
                                      snapshot.data!;

                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16.0,
                                      mainAxisSpacing: 16.0,
                                      childAspectRatio: 0.6,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: gridViewProductsRowList.length,
                                    itemBuilder: (context, gridViewIndex) {
                                      final gridViewProductsRow =
                                          gridViewProductsRowList[
                                              gridViewIndex];
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 30.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'FARMER_MAINContainer_rv6b6x7j_ON_TAP');
                                              logFirebaseEvent(
                                                  'product_backend_call');
                                              _model.farmerInfo =
                                                  await UsersTable().queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'id',
                                                  gridViewProductsRow.sellerId,
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'product_navigate_to');

                                              context.pushNamed(
                                                'productDetails',
                                                queryParameters: {
                                                  'productName': serializeParam(
                                                    gridViewProductsRow.name,
                                                    ParamType.String,
                                                  ),
                                                  'farmerIntro': serializeParam(
                                                    _model.farmerInfo
                                                        ?.firstOrNull?.intro,
                                                    ParamType.String,
                                                  ),
                                                  'productImage':
                                                      serializeParam(
                                                    gridViewProductsRow.image,
                                                    ParamType.String,
                                                  ),
                                                  'productPrice':
                                                      serializeParam(
                                                    gridViewProductsRow.price,
                                                    ParamType.double,
                                                  ),
                                                  'farmerId': serializeParam(
                                                    gridViewProductsRow
                                                        .sellerId,
                                                    ParamType.String,
                                                  ),
                                                  'productId': serializeParam(
                                                    gridViewProductsRow.id,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              safeSetState(() {});
                                            },
                                            child: ProductWidget(
                                              key: Key(
                                                  'Keyrv6_${gridViewIndex}_of_${gridViewProductsRowList.length}'),
                                              productName:
                                                  gridViewProductsRow.name,
                                              productPrice:
                                                  gridViewProductsRow.price!,
                                              productImage:
                                                  gridViewProductsRow.image,
                                              productId: gridViewProductsRow.id,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
