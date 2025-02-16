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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'public_model.dart';
export 'public_model.dart';

class PublicWidget extends StatefulWidget {
  const PublicWidget({super.key});

  @override
  State<PublicWidget> createState() => _PublicWidgetState();
}

class _PublicWidgetState extends State<PublicWidget> {
  late PublicModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'public'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PUBLIC_PAGE_public_ON_INIT_STATE');
      logFirebaseEvent('public_backend_call');
      _model.facts = await FactsTable().queryRows(
        queryFn: (q) => q,
      );
      if (loggedIn) {
        if (FFAppState().userLoc != null && FFAppState().userLoc != '') {
          logFirebaseEvent('public_backend_call');
          _model.businessAround = await UsersTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'account-type',
                  'Business',
                )
                .eqOrNull(
                  'location',
                  FFAppState().userLoc,
                ),
          );
          logFirebaseEvent('public_update_app_state');
          FFAppState().highlightBusiness =
              _model.businessAround!.firstOrNull!.fullname!;
          safeSetState(() {});
          logFirebaseEvent('public_update_app_state');
          FFAppState().higlightText =
              'Did you know that${FFAppState().highlightBusiness}helps fight food waste with lemon by collaborating with farmers on Lemon?';
          safeSetState(() {});
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PUBLIC_PAGE_Container_d1eplarm_ON_TAP');
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed('AboutUs');
                },
                child: Container(
                  width: double.infinity,
                  height: 53.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1554050857-c84a8abdb5e2?q=80&w=3027&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              width: 397.23,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1463123081488-789f998ac9c4?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                width: double.infinity,
                                height: 184.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: FutureBuilder<List<FactsRow>>(
                              future: FactsTable().queryRows(
                                queryFn: (q) => q,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<FactsRow> textFactsRowList =
                                    snapshot.data!;

                                return Text(
                                  valueOrDefault<String>(
                                    _model.facts
                                        ?.elementAtOrNull(
                                            random_data.randomInteger(
                                                0, _model.facts!.length))
                                        ?.fact,
                                    '1.2 billion tonnes of fruit and veg are lost in farms.',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Roboto Mono',
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                      ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Best Deals',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Roboto Mono',
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        'Buy before they\'re gone!',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Roboto Mono',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: FutureBuilder<List<ProductsRow>>(
                        future: ProductsTable().queryRows(
                          queryFn: (q) => q.ltOrNull(
                            'price',
                            5.0,
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
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
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.78,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewProductsRowList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewProductsRow =
                                  gridViewProductsRowList[gridViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PUBLIC_PAGE_Container_v23eefaq_ON_TAP');
                                  logFirebaseEvent('product_backend_call');
                                  _model.farmerInfo =
                                      await UsersTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'id',
                                      gridViewProductsRow.sellerId,
                                    ),
                                  );
                                  logFirebaseEvent('product_navigate_to');

                                  context.pushNamed(
                                    'productDetails',
                                    queryParameters: {
                                      'productName': serializeParam(
                                        gridViewProductsRow.name,
                                        ParamType.String,
                                      ),
                                      'farmerIntro': serializeParam(
                                        _model.farmerInfo?.firstOrNull?.intro,
                                        ParamType.String,
                                      ),
                                      'productImage': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'productPrice': serializeParam(
                                        gridViewProductsRow.price,
                                        ParamType.double,
                                      ),
                                      'farmerId': serializeParam(
                                        gridViewProductsRow.sellerId,
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
                                      'Keyv23_${gridViewIndex}_of_${gridViewProductsRowList.length}'),
                                  productName: gridViewProductsRow.name,
                                  productPrice: gridViewProductsRow.price!,
                                  productImage: gridViewProductsRow.image,
                                  productId: gridViewProductsRow.id,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seasonal Picks',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Roboto Mono',
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        'Fresh seasonal produce for healthy and sustainable eating',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Roboto Mono',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: FutureBuilder<List<ProductsRow>>(
                        future: ProductsTable().queryRows(
                          queryFn: (q) => q.ltOrNull(
                            'price',
                            5.0,
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
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
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.78,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewProductsRowList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewProductsRow =
                                  gridViewProductsRowList[gridViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PUBLIC_PAGE_Container_jk9v6u59_ON_TAP');
                                  logFirebaseEvent('product_backend_call');
                                  _model.farmerInfo2 =
                                      await UsersTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'id',
                                      gridViewProductsRow.sellerId,
                                    ),
                                  );
                                  logFirebaseEvent('product_navigate_to');

                                  context.pushNamed(
                                    'productDetails',
                                    queryParameters: {
                                      'productName': serializeParam(
                                        gridViewProductsRow.name,
                                        ParamType.String,
                                      ),
                                      'farmerIntro': serializeParam(
                                        _model.farmerInfo2?.firstOrNull?.intro,
                                        ParamType.String,
                                      ),
                                      'productImage': serializeParam(
                                        '',
                                        ParamType.String,
                                      ),
                                      'productPrice': serializeParam(
                                        gridViewProductsRow.price,
                                        ParamType.double,
                                      ),
                                      'farmerId': serializeParam(
                                        gridViewProductsRow.sellerId,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  safeSetState(() {});
                                },
                                child: ProductWidget(
                                  key: Key(
                                      'Keyjk9_${gridViewIndex}_of_${gridViewProductsRowList.length}'),
                                  productName: gridViewProductsRow.name,
                                  productPrice: gridViewProductsRow.price!,
                                  productImage: gridViewProductsRow.image,
                                  productId: gridViewProductsRow.id,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 331.43,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
                    child: Text(
                      FFAppState().higlightText,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Mono',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Roboto Mono',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: FutureBuilder<List<CategoryListRow>>(
                        future: CategoryListTable().queryRows(
                          queryFn: (q) => q,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<CategoryListRow> gridViewCategoryListRowList =
                              snapshot.data!;

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.78,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewCategoryListRowList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewCategoryListRow =
                                  gridViewCategoryListRowList[gridViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PUBLIC_PAGE_Container_wszjh7fn_ON_TAP');
                                  logFirebaseEvent('category_navigate_to');

                                  context.pushNamed('searchResults');
                                },
                                child: CategoryWidget(
                                  key: Key(
                                      'Keywsz_${gridViewIndex}_of_${gridViewCategoryListRowList.length}'),
                                  categoryName:
                                      gridViewCategoryListRow.category,
                                  categoryImage: gridViewCategoryListRow.images
                                      ?.toString(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
