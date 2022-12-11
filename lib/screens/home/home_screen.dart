import 'package:flutter/material.dart';
import 'package:out_of_bounds/model/technology.dart';
import 'package:out_of_bounds/model/user.dart';
import 'package:out_of_bounds/screens/base_request_screen.dart';
import 'package:out_of_bounds/screens/home/home_view_model.dart';
import 'package:out_of_bounds/screens/mentors/mentors_screen.dart';
import 'package:out_of_bounds/themes/app_colors.dart';
import 'package:out_of_bounds/themes/app_text_styles.dart';
import 'package:out_of_bounds/widgets/app_bar/hello_app_bar.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/ui_model.dart';
import '../technologies/technologies_screen.dart';

class HomeScreen extends StatefulWidget {
  final User? user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseRequestScreen<HomeScreen> {
  late HomeViewModel homeViewModel;
  User? user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    homeViewModel = HomeViewModel(
      input: Input(
        PublishSubject(),
      ),
    );
    disposeLater(homeViewModel.output.onSubmit.listen((userModel) {
      setState(() {
        switch (userModel.state) {
          case OperationState.loading:
            break;
          case OperationState.error:
            break;
          case OperationState.ok:
            user = userModel.data;
            break;
        }
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.lightGray,
        child: Column(
          children: [
            HelloAppBar(
              user: user,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    if ((user?.technologies?.isEmpty ?? true) &&
                        (user?.mentor == null))
                      _technologiesCard,
                    if (((user?.technologies?.isNotEmpty ?? true) &&
                        (user?.mentor == null)))
                      _waitingCard,
                    const SizedBox(height: 20),
                    if (user?.mentor == null) _mentorsCard,
                    if (((user?.technologies?.isNotEmpty ?? true) &&
                        (user?.mentor != null)))
                      ..._materialCards,
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onStart() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return TechnologiesScreen(
        onSubmit: (technologies) {
          homeViewModel.input.onSubmit.add(technologies);
        },
      );
    }));
  }

  void _onMentors() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const MentorsScreen();
    }));
  }

  void _onCancel() {
    homeViewModel.input.onSubmit.add([]);
  }

  void _openArticle() {}

  Widget get _waitingCard {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: AppColors.green,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "we received your request.\nA mentor will contact you soon.",
            style: AppTextStyles.largeBoldBebasNeue.copyWith(
              color: AppColors.darkBlue,
            ),
          ),
          // ClipRRect(
          //   borderRadius: const BorderRadius.all(
          //     Radius.circular(16),
          //   ),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       minimumSize: const Size(100, 70),
          //       primary: AppColors.darkBlue,
          //     ),
          //     onPressed: _onCancel,
          //     child: Text(
          //       "cancel",
          //       style: AppTextStyles.largeBoldBebasNeue.copyWith(
          //         color: AppColors.green,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
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

  List<Widget> get _materialCards {
    return user?.technologies
            ?.map(
              (e) => _technologyCard(e),
            )
            .toList() ??
        [];
    // [
    //   _waitingCard,
    //   const SizedBox(height: 20),
    //   _waitingCard,
    //   const SizedBox(height: 20),
    //   _waitingCard,
    //   const SizedBox(height: 20),
    //   _waitingCard,
    // ];
  }

  Widget _technologyCard(Technology technology) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            technology.name,
            style: AppTextStyles.largeBoldBebasNeue
                .copyWith(color: AppColors.yellow),
          ),
          Text(
            technology.description,
            style: AppTextStyles.mediumBoldPoppins
                .copyWith(color: AppColors.yellow, fontSize: 20),
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
              onPressed: _openArticle,
              child: Text(
                "Read More",
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
