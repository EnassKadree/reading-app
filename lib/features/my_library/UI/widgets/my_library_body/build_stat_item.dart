import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

Widget buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
      
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 25,
              ),
            ),
            8.spaceH,
            Text(
              value,
              style: StylesConsts.f16W600Black.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        // ),
        8.spaceH,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            label,
            style: StylesConsts.f15W400Grey.copyWith(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }