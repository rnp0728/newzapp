import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../utils/colors.dart';
import '../utils/text.dart';
import 'homepage.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  final int index = 0;

  Widget _buildCard(
      String text, double height, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NewsPage(
                      screenType: 'business',
                    )),
          );
        }
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewsPage(screenType: 'entertainment'),
            ),
          );
        }
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NewsPage(
                      screenType: 'general',
                    )),
          );
        }
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NewsPage(
                      screenType: 'health',
                    )),
          );
        }
        if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NewsPage(
                      screenType: 'science',
                    )),
          );
        }
        if (index == 5) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NewsPage(
                      screenType: 'technology',
                    )),
          );
        }
      },
      child: Card(
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [Colors.purple, Colors.indigo],
              )),
          height: height * 0.14,
          child: Center(
            child: ModifiedText(text: text, size: 18, color: AppColors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: const appBar(
          title1: 'News ',
          title2: 'Categories',
        ),
        backgroundColor: AppColors.bgColor,
        body: ListView(
          children: [
            _buildCard('Bussiness', h, 0, context),
            _buildCard('Entertainment', h, 1, context),
            _buildCard('General', h, 2, context),
            _buildCard('Health', h, 3, context),
            _buildCard('Science', h, 4, context),
            _buildCard('Technology', h, 5, context),
          ],
        ));
  }
}
