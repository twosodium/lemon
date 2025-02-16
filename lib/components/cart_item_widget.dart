import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_item_model.dart';
export 'cart_item_model.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.productName,
    required this.producer,
    required this.price,
    required this.quantity,
    this.productId,
  });

  final String? productName;
  final String? producer;
  final double? price;
  final int? quantity;
  final int? productId;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late CartItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 16.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x34000000),
              offset: Offset(
                -2.0,
                5.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 4.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget!.productName,
                          'Product Name',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto Mono',
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.producer,
                            'Producer',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Roboto Mono',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 70.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.rectangle,
                ),
                child: FlutterFlowCountController(
                  decrementIconBuilder: (enabled) => Icon(
                    Icons.remove_rounded,
                    color: enabled
                        ? FlutterFlowTheme.of(context).secondaryText
                        : FlutterFlowTheme.of(context).alternate,
                    size: 24.0,
                  ),
                  incrementIconBuilder: (enabled) => Icon(
                    Icons.add_rounded,
                    color: enabled
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).alternate,
                    size: 24.0,
                  ),
                  countBuilder: (count) => Text(
                    count.toString(),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Roboto Mono',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  count: _model.countControllerValue ??= widget!.quantity!,
                  updateCount: (count) async {
                    safeSetState(() => _model.countControllerValue = count);
                    logFirebaseEvent(
                        'CART_ITEM_CountController_e57xf7em_ON_FO');
                    logFirebaseEvent('CountController_backend_call');
                    await CartsTable().update(
                      data: {
                        'quantity': _model.countControllerValue,
                      },
                      matchingRows: (rows) => rows
                          .eqOrNull(
                            'user_id',
                            currentUserUid,
                          )
                          .eqOrNull(
                            'product_id',
                            widget!.productId,
                          ),
                    );
                    if (widget!.quantity == 0) {
                      logFirebaseEvent('CountController_backend_call');
                      await CartsTable().delete(
                        matchingRows: (rows) => rows
                            .eqOrNull(
                              'user_id',
                              currentUserUid,
                            )
                            .eqOrNull(
                              'product_id',
                              widget!.productId,
                            ),
                      );
                    }
                  },
                  stepSize: 1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'for',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto Mono',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 4.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  ((widget!.quantity!) * (widget!.price!)),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                  currency: '\$',
                                ),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Roboto Mono',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
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
