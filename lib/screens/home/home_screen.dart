import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/user.dart';
import 'package:out_of_bounds/screens/mentors/mentors_screen.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/app_bar/hello_app_bar.dart';

import '../technologies/technologies_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HelloAppBar(
            user: User(
                firstName: "Ionut",
                lastName: "Constantin",
                email: "asdk@asd.csq"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _technologiesCard,
                  const SizedBox(height: 20),
                  _mentorsCard,
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onStart() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return TechnologiesScreen(
        onSubmit: (technologies) {},
      );
    }));
  }

  void _onMentors() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const MentorsScreen();
    }));
  }

  Widget get _technologiesCard {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      // height: MediaQuery.of(context).size.height * 2 / 5,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: AppColors.yellow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 70),
                primary: AppColors.darkBlue,
              ),
              onPressed: _onStart,
              child: Text(
                "start",
                style: AppTextStyles.largeBoldBebasNeue.copyWith(
                  color: AppColors.yellow,
                ),
              ),
            ),
          ),
          Text(
            "learning\nnew\ntechnologies\ntoday",
            style: AppTextStyles.largeBoldBebasNeue.copyWith(
              color: AppColors.darkBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _mentorsCard {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 2 / 5,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: AppColors.darkBlue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Meet\nyour\nfuture",
            style: AppTextStyles.largeBoldBebasNeue
                .copyWith(color: AppColors.yellow),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 70),
                primary: AppColors.yellow,
              ),
              onPressed: _onMentors,
              child: Text(
                "mentors",
                style: AppTextStyles.largeBoldBebasNeue.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
