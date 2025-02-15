// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.width,
    this.height,
    this.title,
    this.imageurl,
    this.price,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? title;
  final String? imageurl;
  final String? price;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 200,
      height: widget.height ?? 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.imageurl != null)
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  widget.imageurl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              widget.title ?? 'No Title',
              style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Text(
              widget.price ?? 'Price not available',
              style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
