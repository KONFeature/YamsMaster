import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'home_presenter.dart';

class HomeController extends Controller {
  HomePresenter _homePresenter;

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void navigate(String page, context) =>
      Navigator.of(context).pushNamed(page);
}
