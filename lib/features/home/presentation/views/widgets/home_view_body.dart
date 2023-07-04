import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'best_sller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: CustomAppBar(),
                ),
                FeaturedBooksListView(),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Newset Books",
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: BestSellerListView(),
            ),
          ),
        ],
      ),
    );
  }
}
