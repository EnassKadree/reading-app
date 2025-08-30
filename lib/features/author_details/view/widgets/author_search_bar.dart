import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/author_details/service/author_books_cubit.dart';

class AuthorSearchBar extends StatefulWidget {
  const AuthorSearchBar({
    super.key,
    required this.authorId,
  });
  final int authorId;
  @override
  State<AuthorSearchBar> createState() => _AuthorSearchBarState();
}

class _AuthorSearchBarState extends State<AuthorSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    context.read<AuthorBooksCubit>().getAuthorBooks(widget.authorId,search: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            hintText: JsonConsts.searchAuthorBooks.t(context),
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Container(
              margin: EdgeInsets.all(12.w),
              child: Icon(
                Iconsax.search_normal,
                color: Colors.grey[600],
                size: 22,
              ),
            ),
            filled: true,
            fillColor: context.colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:  BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: context.colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 14.h,
            ),
          ),
        ),
      ),
    );
  }
}
