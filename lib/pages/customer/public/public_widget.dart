import '/backend/supabase/supabase.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/meal_card_loading/meal_card_loading_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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
      logFirebaseEvent('public_haptic_feedback');
      HapticFeedback.mediumImpact();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Best Deals',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Text(
                          'Buy before they\'re gone!',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: StreamBuilder<List<ProductsRow>>(
                            stream: _model.gridViewSupabaseStream1 ??= SupaFlow
                                .client
                                .from("products")
                                .stream(primaryKey: ['id']).map((list) => list
                                    .map((item) => ProductsRow(item))
                                    .toList()),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return MealCardLoadingWidget();
                              }
                              List<ProductsRow> gridViewProductsRowList =
                                  snapshot.data!;

                              if (gridViewProductsRowList.isEmpty) {
                                return Container(
                                  width: double.infinity,
                                  child: EmptyStateWidget(
                                    icon: Icon(
                                      Icons.no_food_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 64.0,
                                    ),
                                    title: 'No Meals',
                                    description:
                                        'No meals have been created or match your dietary preferences.',
                                  ),
                                );
                              }

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
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 30.0,
                                    child: custom_widgets.ProductCard(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height: 30.0,
                                      title: gridViewProductsRow.name,
                                      price:
                                          gridViewProductsRow.price.toString(),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seasonal Picks',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Text(
                          'Fresh in-season produce for healthy and sustainable eating',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: StreamBuilder<List<ProductsRow>>(
                            stream: _model.gridViewSupabaseStream2 ??= SupaFlow
                                .client
                                .from("products")
                                .stream(primaryKey: ['id']).map((list) => list
                                    .map((item) => ProductsRow(item))
                                    .toList()),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return MealCardLoadingWidget();
                              }
                              List<ProductsRow> gridViewProductsRowList =
                                  snapshot.data!;

                              if (gridViewProductsRowList.isEmpty) {
                                return Container(
                                  width: double.infinity,
                                  child: EmptyStateWidget(
                                    icon: Icon(
                                      Icons.no_food_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 64.0,
                                    ),
                                    title: 'No Meals',
                                    description:
                                        'No meals have been created or match your dietary preferences.',
                                  ),
                                );
                              }

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
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 30.0,
                                    child: custom_widgets.ProductCard(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height: 30.0,
                                      title: gridViewProductsRow.name,
                                      price:
                                          gridViewProductsRow.price.toString(),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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
