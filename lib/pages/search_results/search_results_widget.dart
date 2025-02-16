import '/backend/supabase/supabase.dart';
import '/components/navbar_widget.dart';
import '/components/product_widget.dart';
import '/components/search_filter_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_results_model.dart';
export 'search_results_model.dart';

class SearchResultsWidget extends StatefulWidget {
  const SearchResultsWidget({
    super.key,
    double? priceFilter,
    this.categoryFilter,
    this.nameFilter,
  }) : this.priceFilter = priceFilter ?? 100000.0;

  final double priceFilter;
  final List<String>? categoryFilter;
  final String? nameFilter;

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  late SearchResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'searchResults'});
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.navbarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarWidget(),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 30.0, 0.0),
                                child: Text(
                                  'Search filters',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto Mono',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => FlutterFlowIconButton(
                                borderRadius: 24.0,
                                buttonSize: 48.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.tune,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SEARCH_RESULTS_PAGE_tune_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: SearchFilterPopupWidget(),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        FutureBuilder<List<ProductsRow>>(
                          future: ProductsTable().queryRows(
                            queryFn: (q) => q
                                .inFilterOrNull(
                                  'category',
                                  widget!.categoryFilter,
                                )
                                .lteOrNull(
                                  'price',
                                  widget!.priceFilter,
                                )
                                .eqOrNull(
                                  'name',
                                  widget!.nameFilter,
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
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: 0.7,
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
                                        'SEARCH_RESULTS_Container_7678jeay_ON_TAP');
                                    logFirebaseEvent('product_backend_call');
                                    _model.userInfoSellerInfo =
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
                                          _model.userInfoSellerInfo?.firstOrNull
                                              ?.intro,
                                          ParamType.String,
                                        ),
                                        'productPrice': serializeParam(
                                          gridViewProductsRow.price,
                                          ParamType.double,
                                        ),
                                        'farmerId': serializeParam(
                                          _model.userInfoSellerInfo?.firstOrNull
                                              ?.id,
                                          ParamType.String,
                                        ),
                                        'productImage': serializeParam(
                                          gridViewProductsRow.image,
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
                                        'Key767_${gridViewIndex}_of_${gridViewProductsRowList.length}'),
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
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
