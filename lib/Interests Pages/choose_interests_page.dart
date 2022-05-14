import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:uny_app/API/uny_app_api.dart';
import 'package:uny_app/Constants/constants.dart';
import 'package:uny_app/Interests%20Database/Database/database_object.dart';
import 'package:uny_app/Interests%20Database/interests_database.dart';
import 'package:uny_app/Interests%20Model/career_interests_db_model.dart';
import 'package:uny_app/Interests%20Model/family_interests_db_model.dart';
import 'package:uny_app/Interests%20Model/general_interests_db_model.dart';
import 'package:uny_app/Interests%20Model/sport_interests_db_model.dart';
import 'package:uny_app/Interests%20Model/travelling_interests_db_model.dart';
import 'package:uny_app/Token%20Data/token_data.dart';
import 'package:uny_app/User%20Profile%20Page/user_profile_page.dart';

class InterestsPage extends StatefulWidget {
  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {

  late InterestsDatabase? db;

  ScrollController? _allInterestsScrollController;
  ScrollController? _careerInterestsScrollController;
  ScrollController? _travelingInterestsScrollController;
  ScrollController? _generalInterestsScrollController;

  int familyInterestsStart = 0;
  int careerInterestsStart = 0;
  int sportInterestsStart = 0;
  int travelingInterestsStart = 0;
  int generalInterestsStart = 0;
  int end = 150;

  int _familyInterestsCounter = 0;
  int _careerInterestsCounter = 0;
  int _sportInterestsCounter = 0;
  int _travelingInterestsCounter = 0;
  int _generalInterestsCounter = 0;

  late double height;
  late double width;

  Future<List<FamilyInterestsModel>>? familyInterestsFuture;
  Future<List<CareerInterestsModel>>? careerInterestsFuture;
  Future<List<SportInterestsModel>>? sportInterestsFuture;
  Future<List<TravellingInterestsModel>>? travellingInterestsFuture;
  Future<List<GeneralInterestsModel>>? generalInterestsFuture;

  List<FamilyInterestsModel>? _familyInterestsList = [];
  List<CareerInterestsModel>? _careerInterestsList = [];
  List<SportInterestsModel>? _sportInterestsList = [];
  List<TravellingInterestsModel>? _travelingInterestsList = [];
  List<GeneralInterestsModel>? _generalInterestsList = [];

  List<FamilyInterestsModel>? _familyFilteredList = [];
  List<CareerInterestsModel>? _careerFilteredList = [];
  List<SportInterestsModel>? _sportFilteredList = [];
  List<TravellingInterestsModel>? _travelingFilteredList = [];
  List<GeneralInterestsModel>? _generalFilteredList = [];

  List<FamilyInterestsModel>? _selectedFamilyInterests = [];
  List<CareerInterestsModel>? _selectedCareerInterests = [];
  List<SportInterestsModel>? _selectedSportInterests = [];
  List<TravellingInterestsModel>? _selectedTravelingInterests = [];
  List<GeneralInterestsModel>? _selectedGeneralInterests = [];

  double _selectedFamilyInterestsValue = 0.0;
  double _selectedCareerInterestsValue = 0.0;
  double _selectedSportInterestsValue = 0.0;
  double _selectedTravelingInterestsValue = 0.0;
  double _selectedGeneralInterestsValue = 0.0;

  bool _isSearching = false;

  bool _isFamilyEnabled = true;
  bool _isCareerEnabled = false;
  bool _isSportEnabled = false;
  bool _isTravelingEnabled = false;
  bool _isGeneralEnabled = false;

  bool _isCareerIconEnabled = false;
  bool _isSportIconEnabled = false;
  bool _isTravelingIconEnabled = false;
  bool _isGeneralIconEnabled = false;

  bool _showLoading = false;

  FocusNode? addNewInterestFieldFocusNode;
  TextEditingController? newInterestFieldTextController;


  @override
  void initState() {

    db = DatabaseObject.getDb;

    addNewInterestFieldFocusNode = FocusNode();
    newInterestFieldTextController = TextEditingController();

    _allInterestsScrollController = ScrollController();
    _careerInterestsScrollController = ScrollController();
    _travelingInterestsScrollController = ScrollController();
    _generalInterestsScrollController = ScrollController();

    familyInterestsFuture = db!.familyInterestsDao.getFamilyInterestsByLimit(familyInterestsStart.toString(), end.toString()).then((value) => _familyFilteredList = value);
    careerInterestsFuture = db!.careerInterestsDao.getCareerInterestsByLimit(careerInterestsStart.toString(), end.toString()).then((value) => _careerFilteredList = value);
    sportInterestsFuture = db!.sportInterestsDao.getSportInterestsByLimit(sportInterestsStart.toString(), end.toString()).then((value) => _sportFilteredList = value);
    travellingInterestsFuture = db!.travelingInterestsDao.getTravelingInterestsByLimit(travelingInterestsStart.toString(), end.toString()).then((value) => _travelingFilteredList = value);
    generalInterestsFuture = db!.generalInterestsDao.getGeneralInterestsByLimit(generalInterestsStart.toString(), end.toString()).then((value) => _generalFilteredList = value);

    _careerInterestsScrollController!.addListener(() async {
      if(_careerInterestsScrollController!.position.atEdge) {
        if(_careerFilteredList!.length < 1619){
          careerInterestsStart += 150;
          List<CareerInterestsModel> allInterests = await db!.careerInterestsDao.getCareerInterestsByLimit(careerInterestsStart.toString(), end.toString());
          setState(() {
            _careerFilteredList!.addAll(allInterests);
          });
        }else if(_careerFilteredList!.length == 1619){
          return;
        }else{
          return;
        }
      }
    });

    _travelingInterestsScrollController!.addListener(() async {
      if(_travelingInterestsScrollController!.position.atEdge) {
        if(_travelingFilteredList!.length < 1415){
          travelingInterestsStart += 150;
          List<TravellingInterestsModel> allInterests = await db!.travelingInterestsDao.getTravelingInterestsByLimit(travelingInterestsStart.toString(), end.toString());
          setState(() {
            _travelingFilteredList!.addAll(allInterests);
          });
        }else if(_travelingFilteredList!.length == 1415){
          return;
        }else{
          return;
        }
      }
    });

    _generalInterestsScrollController!.addListener(() async {
      if(_generalInterestsScrollController!.position.atEdge) {
        if(_generalFilteredList!.length < 3446){
          generalInterestsStart += 80;
          List<GeneralInterestsModel> allInterests = await db!.generalInterestsDao.getGeneralInterestsByLimit(generalInterestsStart.toString(), end.toString());
          setState(() {
            _generalFilteredList!.addAll(allInterests);
          });
        }else if(_generalFilteredList!.length == 3446){
          return;
        }else{
          return;
        }
      }
    });

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (UniversalPlatform.isIOS) {
        await showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return popup18PlusAttentionWidget();
            });
      } else if (UniversalPlatform.isAndroid) {
        await showModalBottomSheet(
            context: context,
            builder: (context) {
              return popup18PlusAttentionWidget();
            });
      }
    });

    super.initState();
  }

  @override
  void dispose() {

    addNewInterestFieldFocusNode = null;
    newInterestFieldTextController = null;

    _allInterestsScrollController!.dispose();
    _careerInterestsScrollController!.dispose();
    _travelingInterestsScrollController!.dispose();
    _generalInterestsScrollController!.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return ResponsiveWrapper.builder(
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.grey),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Container(
                  height: height / 20,
                  padding: EdgeInsets.only(right: width / 20),
                  child: TextFormField(
                    cursorColor: Color.fromRGBO(145, 10, 251, 5),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: height / 50),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      prefixIcon: _isSearching != true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(CupertinoIcons.search, color: Colors.grey),
                                Text('Поиск интересов',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey))
                              ],
                            )
                          : null,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.1))),
                    ),
                    onTap: () {
                      setState(() {
                        _isSearching = true;
                      });
                    },
                    onChanged: (value) {
                      if(_isFamilyEnabled){
                        _familyFilteredList = _familyInterestsList!.where((interest) => interest.name!.toLowerCase().startsWith(value.toLowerCase())).toList();
                      }else if(_isCareerEnabled){
                        _careerFilteredList = _careerInterestsList!.where((interest) => interest.name!.toLowerCase().startsWith(value.toLowerCase())).toList();
                      }else if(_isSportEnabled){
                        _sportFilteredList = _sportInterestsList!.where((interest) => interest.name!.toLowerCase().startsWith(value.toLowerCase())).toList();
                      }else if(_isTravelingEnabled){
                        _travelingFilteredList = _travelingInterestsList!.where((interest) => interest.name!.toLowerCase().startsWith(value.toLowerCase())).toList();
                      }else{
                        _generalFilteredList = _generalInterestsList!.where((interest) => interest.name!.toLowerCase().startsWith(value.toLowerCase())).toList();
                      }

                      setState(() {});

                      if (value.isEmpty) {
                        setState(() {
                          _isSearching = false;
                        });
                      } else {
                        setState(() {
                          _isSearching = true;
                        });
                      }
                    },
                  ),
                ),
                centerTitle: true,
              ),
              body: mainBody(),
            ),
          maxWidth: 800,
          minWidth: 450,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: MOBILE),
          ],
        );
      },
    );
  }

  Widget mainBody() {
    return Wrap(
      children: [
        Container(
            padding: EdgeInsets.only(
                top: height / 7, left: width / 20, bottom: height / 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => _openFamilyInterests(),
                        child: Row(
                          children: [Container(
                            height: 35,
                            width: 35,
                            child: Icon(Icons.lock_open, color: Colors.white),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                            SizedBox(width: 5),
                            Text('Семья',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),],
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: width / 8,
                        height: 2,
                        color: _isCareerIconEnabled
                            ? Colors.green
                            : Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(width: 5)
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => _isCareerIconEnabled ?
                        _openCareerInterests() : null,
                        child: Row(
                          children: [
                            _isCareerIconEnabled
                                ? Container(
                              height: 35,
                              width: 35,
                              child: Icon(Icons.lock_open, color: Colors.white),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.lightBlue,
                              ),
                            )
                                : Icon(CupertinoIcons.lock_circle_fill,
                                color: Colors.grey, size: 40),
                            SizedBox(width: 5),
                            Text('Карьера',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),],
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: width / 8,
                        height: 2,
                        color: _isSportIconEnabled
                            ? Colors.lightBlue
                            : Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => _isSportIconEnabled ?
                        _openSportInterests() : null,
                        child: Row(
                          children: [
                            _isSportIconEnabled
                                ? Container(
                              height: 35,
                              width: 35,
                              child: Icon(Icons.lock_open, color: Colors.white),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueAccent,
                              ),
                            )
                                : Icon(CupertinoIcons.lock_circle_fill,
                                color: Colors.grey, size: 40),
                            SizedBox(width: 5),
                            Text('Спорт',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: width / 8,
                        height: 2,
                        color: _isTravelingIconEnabled
                            ? Colors.blueAccent
                            : Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => _isTravelingIconEnabled ?
                        _openTravelingInterests() : null,
                        child: Row(
                          children: [
                            _isTravelingIconEnabled
                                ? Container(
                              height: 35,
                              width: 35,
                              child: Icon(Icons.lock_open, color: Colors.white),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange,
                              ),
                            )
                                : Icon(CupertinoIcons.lock_circle_fill,
                                color: Colors.grey, size: 40),
                            SizedBox(width: 5),
                            Text('Путешествия',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: width / 8,
                        height: 2,
                        color: _isGeneralIconEnabled
                            ? Colors.orange
                            : Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => _isGeneralIconEnabled
                            ? _openGeneralInterests() : null,
                        child: Row(
                          children: [
                            _isGeneralIconEnabled
                                ? Container(
                              height: 35,
                              width: 35,
                              child: Icon(Icons.lock_open, color: Colors.white),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurpleAccent,
                              ),
                            )
                                : Icon(CupertinoIcons.lock_circle_fill,
                                color: Colors.grey, size: 40),
                            SizedBox(width: 5),
                            Text('Общее',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            )),
        Container(
          child: _isCareerEnabled
              ? careerInterestsGridView()
              : _isSportEnabled
              ? sportInterestsGridView()
              : _isTravelingEnabled
              ? travelingInterestsGridView()
              : _isGeneralEnabled
              ? generalInterestsGridView()
              : _isFamilyEnabled
              ? familyInterestsGridView()
              : null
        ),
      ],
    );
  }


  FutureBuilder<List<FamilyInterestsModel>> familyInterestsFutureBuilder(){
    return FutureBuilder<List<FamilyInterestsModel>>(
      future: familyInterestsFuture,
      builder: (context, snapshot) {
        while(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(color: Colors.green)
          );
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          _familyInterestsList = List.from(snapshot.data!.toList());

          return familyInterestsGridView();
        }else{
          return Center(
            child: Text('Error'),
          );
        }
      },
    );
  }

  FutureBuilder<List<CareerInterestsModel>> careerInterestsFutureBuilder(){
    return FutureBuilder<List<CareerInterestsModel>>(
      future: careerInterestsFuture,
      builder: (context, snapshot) {

        while(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
              child: CircularProgressIndicator(color: Colors.lightBlueAccent)
          );
        }
        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          _careerInterestsList = List.from(snapshot.data!.toList());

          return careerInterestsGridView();
        }else{
          return Center(
            child: Text('Error'),
          );
        }
      },
    );
  }

  FutureBuilder<List<SportInterestsModel>> sportInterestsFutureBuilder(){
    return FutureBuilder<List<SportInterestsModel>>(
      future: sportInterestsFuture,
      builder: (context, snapshot) {
        while(snapshot.connectionState == ConnectionState.waiting){
          return Center(
              child: CircularProgressIndicator(color: Colors.blue[800])
          );
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          _sportInterestsList = List.from(snapshot.data!.toList());

          return sportInterestsGridView();
        }else{
          return Center(
            child: Text('Error'),
          );
        }
      },
    );
  }

  FutureBuilder<List<TravellingInterestsModel>> travellingInterestsFutureBuilder(){
    return FutureBuilder<List<TravellingInterestsModel>>(
      future: travellingInterestsFuture,
      builder: (context, snapshot) {
        while(snapshot.connectionState == ConnectionState.waiting){
          return Center(
              child: CircularProgressIndicator(color: Colors.deepOrange)
          );
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          _travelingInterestsList = List.from(snapshot.data!.toList());

          return travelingInterestsGridView();
        }else{
          return Center(
            child: Text('Error'),
          );
        }
      },
    );
  }

  FutureBuilder<List<GeneralInterestsModel>> generalInterestsFutureBuilder(){
    return FutureBuilder<List<GeneralInterestsModel>>(
      future: generalInterestsFuture,
      builder: (context, snapshot) {
        while(snapshot.connectionState == ConnectionState.waiting){
          return Center(
              child: CircularProgressIndicator(color: Colors.purpleAccent)
          );
        }
        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          _generalInterestsList = List.from(snapshot.data!.toList());

          return generalInterestsGridView();
        }else{
          return Center(
            child: Text('Error'),
          );
        }
      },
    );
  }


  Widget familyInterestsGridView() {
    if(_familyInterestsList!.isNotEmpty){
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: width * 0.78,
                  height: 26,
                  padding: EdgeInsets.only(left: width / 20),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: height,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.green[100],
                              color: Colors.green,
                              value: _selectedFamilyInterestsValue,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              '$_familyInterestsCounter',
                              style: const TextStyle(fontSize: 15, color: Colors.green),
                            ),
                          )
                        ],
                      ))),
              InkWell(
                onTap: _selectedFamilyInterests!.isNotEmpty ? () {
                  setState(() {
                    _isCareerEnabled = true;
                    _isCareerIconEnabled = true;

                    _isFamilyEnabled = false;
                  });
                } : null,
                child: Container(
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text('Далее',
                        style: TextStyle(
                            fontSize: 15, color:
                        Colors.white)),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            _selectedFamilyInterests!.isNotEmpty ?
                            Colors.deepPurpleAccent : Colors.grey,
                            _selectedFamilyInterests!.isNotEmpty ?
                            Colors.blueAccent : Colors.grey
                          ])),
                ),
              )
            ],
          ),
          SizedBox(height: height / 100),
          _selectedFamilyInterests!.isEmpty
              ? Center(
            child: Text(
              'Выберите минимум один интерес для продолжения',
              style: TextStyle(
                  fontSize: 15, color: Colors.grey.withOpacity(0.7)),
            ),
          ) : Container(
            width: width * 2,
            height: height / 18,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: List.generate(_selectedFamilyInterests!.length, (index) {
                  return Material(
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: IntrinsicWidth(
                          child: Row(
                            children: [
                              Text(
                                _selectedFamilyInterests![index].name!,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: height / 300),
                                child: IconButton(
                                  icon: const Icon(CupertinoIcons.clear_circled, color: Colors.white),
                                  onPressed: () {

                                    int indx = _familyInterestsList!.indexOf(_selectedFamilyInterests![index]);
                                    _familyFilteredList!.insert(indx, _selectedFamilyInterests![index]);

                                    _selectedFamilyInterests!.removeAt(index);

                                    _selectedFamilyInterestsValue -= 0.01;
                                    --_familyInterestsCounter;

                                    setState((){});
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            color: Color(int.parse('0x' + _selectedFamilyInterests![index].color!)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green[800]!,
                                  offset: const Offset(3, 3),
                                  blurRadius: 0,
                                  spreadRadius: 0
                              )
                            ]
                        ),
                      ),
                    ),
                  );
                }).reversed.toList(),
              ),
            ),
          ),
          SizedBox(height: height / 100),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          _familyFilteredList!.isNotEmpty ? SizedBox(
              height: height / 1.35,
              child: SafeArea (
                top: false,
                child: SingleChildScrollView (
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView (
                      scrollDirection: Axis.horizontal,
                      child: Container (
                        padding: const EdgeInsets.only(left: 10),
                        width: width / 0.5,
                        child: Wrap(
                            spacing: 8.0,
                            runSpacing: 10.0,
                            children: List.generate(_familyFilteredList!.length, (index) {
                              return Material(
                                child: InkWell(
                                  onTap: () {
                                    _selectedFamilyInterests!.add(_familyFilteredList![index]);

                                    _familyFilteredList!.removeAt(index);

                                    _selectedFamilyInterestsValue += 0.01;
                                    ++_familyInterestsCounter;

                                    setState(() {});
                                  },
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Center(
                                      widthFactor: 1,
                                      child: Text(
                                        _familyFilteredList![index].name!,
                                        style: const TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                                      color: Color(int.parse('0x' + _familyFilteredList![index].color!)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.green[800]!,
                                            offset: const Offset(3, 3),
                                            blurRadius: 0,
                                            spreadRadius: 0
                                        )
                                      ]
                                    ),
                                  )
                                ),
                              );
                            })
                        ),
                      )),
                ),
              )) : AnimatedPadding(
              duration: const Duration(milliseconds: 150),
              padding: EdgeInsets.symmetric(
                  vertical:  height / 5,
                  horizontal: width / 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'По вашему запросу не найдено подходящего интереса. Вы можете добавить новый вручную',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  addInterestsWidget()
                ],
              )
          )
        ],
      );
    }else{
      return familyInterestsFutureBuilder();
    }
  }

  Widget careerInterestsGridView(){
    if(_careerInterestsList!.isNotEmpty){
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: width * 0.78,
                  height: 26,
                  padding: EdgeInsets.only(left: width / 20),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                           SizedBox(
                            height: height,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.blue[100],
                              color: Color.fromRGBO(1, 188, 248, 5),
                              value: _selectedCareerInterestsValue,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              '$_careerInterestsCounter',
                              style: const TextStyle(fontSize: 15, color: Color.fromRGBO(1, 188, 248, 5)),
                            ),
                          )
                        ],
                      ))),
              InkWell(
                onTap: _selectedCareerInterests!.isNotEmpty ? (){
                  setState(() {
                    _isSportEnabled = true;
                    _isSportIconEnabled = true;

                    _isCareerEnabled = false;
                  });
                } : null,
                child: Container(
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text('Далее',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            _selectedCareerInterests!.isNotEmpty ? Colors.deepPurpleAccent : Colors.grey,
                            _selectedCareerInterests!.isNotEmpty ? Colors.blueAccent : Colors.grey])),
                ),
              )
            ],
          ),
          SizedBox(height: height / 100),
          _selectedCareerInterests!.isEmpty
              ? Center(
            child: Text(
              'Выберите минимум один интерес для продолжения',
              style: TextStyle(
                  fontSize: 15, color: Colors.grey.withOpacity(0.7)),
            ),
          ) : Container(
            width: width * 2,
            height: height / 18,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: List.generate(_selectedCareerInterests!.length, (index) {
                  return Material(
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedCareerInterests![index].name!,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: IconButton(
                                  icon: const Icon(CupertinoIcons.clear_circled, color: Colors.white),
                                  onPressed: (){

                                    int indx = _careerInterestsList!.indexOf(_selectedCareerInterests![index]);
                                    _careerFilteredList!.insert(indx, _selectedCareerInterests![index]);

                                    _selectedCareerInterests!.removeAt(index);
                                    _selectedCareerInterestsValue -= 0.01;
                                    --_careerInterestsCounter;

                                    setState((){});
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            color: Color(int.parse('0x' + _selectedCareerInterests![index].color!)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue[600]!,
                                  offset: const Offset(3, 3),
                                  blurRadius: 0,
                                  spreadRadius: 0
                              )
                            ]
                        ),
                      ),
                    ),
                  );
                }).reversed.toList(),
              ),
            ),
          ),
          SizedBox(height: height / 100),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          _careerFilteredList!.isNotEmpty ? SizedBox(
              height: height / 1.35,
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _careerInterestsScrollController,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: width / 0.5,
                        child: Wrap(
                            spacing: 8.0,
                            runSpacing: 10.0,
                            children: List.generate(_careerFilteredList!.length,
                                    (index) {
                                  return Material(
                                    child: InkWell(
                                      onTap: () {
                                        _selectedCareerInterests!.add(_careerFilteredList![index]);
                                        _careerFilteredList!.removeAt(index);

                                        _selectedCareerInterestsValue += 0.01;
                                        ++_careerInterestsCounter;

                                        setState((){});
                                      },
                                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                        height: 40,
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Center(
                                          widthFactor: 1,
                                          child: Text(
                                            _careerFilteredList![index].name!,
                                            style: const TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                                            color: Color(int.parse('0x' + _careerFilteredList![index].color!)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.blue[600]!,
                                                  offset: const Offset(3, 3),
                                                  blurRadius: 0,
                                                  spreadRadius: 0
                                              )
                                            ]
                                        ),
                                      )
                                    ),
                                  );
                                })
                        ),
                      )),
                ),
              )) : AnimatedPadding(
              duration: const Duration(milliseconds: 150),
              padding: EdgeInsets.symmetric(
                  vertical:  height / 5,
                  horizontal: width / 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'По вашему запросу не найдено подходящего интереса. Вы можете добавить новый вручную',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  addInterestsWidget()
                ],
              )
          )
        ],
      );
    }else{
      return careerInterestsFutureBuilder();
    }
  }

  Widget sportInterestsGridView() {
    if(_sportInterestsList!.isNotEmpty){
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: width * 0.78,
                  height: 26,
                  padding: EdgeInsets.only(left: width / 20),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: height,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.blueAccent.withOpacity(0.3),
                              color: Colors.blueAccent,
                              value: _selectedSportInterestsValue,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              '$_sportInterestsCounter',
                              style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                            ),
                          )
                        ],
                      ))),
              InkWell(
                onTap: _selectedSportInterests!.isNotEmpty ? (){
                  setState(() {
                    _isSportEnabled = false;

                    _isTravelingEnabled = true;
                    _isTravelingIconEnabled = true;
                  });
                } : null,
                child: Container(
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text('Далее',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            _selectedSportInterests!.isNotEmpty ? Colors.deepPurpleAccent : Colors.grey,
                            _selectedSportInterests!.isNotEmpty ? Colors.blueAccent : Colors.grey
                          ])),
                ),
              )
            ],
          ),
          SizedBox(height: height / 100),
          _selectedSportInterests!.isEmpty
              ? Center(
            child: Text(
              'Выберите минимум один интерес для продолжения',
              style: TextStyle(
                  fontSize: 15, color: Colors.grey.withOpacity(0.7)),
            ),
          ) : Container(
            width: width * 2,
              height: height / 18,
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: List.generate(_selectedSportInterests!.length, (index) {
                  return Material(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10),
                      child: IntrinsicWidth(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedSportInterests![index].name!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: IconButton(
                                icon: const Icon(CupertinoIcons.clear_circled, color: Colors.white),
                                onPressed: (){

                                  int indx = _sportInterestsList!.indexOf(_selectedSportInterests![index]);
                                  _sportFilteredList!.insert(indx, _selectedSportInterests![index]);

                                  _selectedSportInterests!.removeAt(index);
                                  _selectedSportInterestsValue -= 0.01;
                                  --_sportInterestsCounter;

                                  setState((){});
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: Color(int.parse('0x' + _selectedSportInterests![index].color!)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue[600]!,
                                offset: const Offset(3, 3),
                                blurRadius: 0,
                                spreadRadius: 0
                            )
                          ]
                      ),
                    ),
                  );
                }).reversed.toList(),
              ),
            )
          ),
          SizedBox(height: height / 100),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          _sportFilteredList!.isNotEmpty ? SizedBox(
              height: height / 1.35,
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: width / 0.5,
                        child: Wrap(
                            spacing: 8.0,
                            runSpacing: 10.0,
                            children: List.generate(_sportFilteredList!.length,
                                    (index) {
                                  return Material(
                                    child: InkWell(
                                      onTap: () {
                                        _selectedSportInterests!.add(_sportFilteredList![index]);
                                        _sportFilteredList!.removeAt(index);

                                        _selectedSportInterestsValue += 0.01;
                                        ++_sportInterestsCounter;

                                        setState((){});
                                      },
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                        height: 40,
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Center(
                                          widthFactor: 1,
                                          child: Text(
                                            _sportFilteredList![index].name!,
                                            style: const TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                                            color: Color(int.parse('0x' + _sportFilteredList![index].color!)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.blue[300]!,
                                                  offset: const Offset(3, 3),
                                                  blurRadius: 0,
                                                  spreadRadius: 0
                                              )
                                            ]
                                        ),
                                      )
                                    ),
                                  );
                                })
                        ),
                      )),
                ),
              )) : AnimatedPadding(
              duration: Duration(milliseconds: 150),
              padding: EdgeInsets.symmetric(
                  vertical:  height / 5,
                  horizontal: width / 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'По вашему запросу не найдено подходящего интереса. Вы можете добавить новый вручную',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  addInterestsWidget()
                ],
              )
          )
        ],
      );
    }else{
      return sportInterestsFutureBuilder();
    }
  }

  Widget travelingInterestsGridView() {
    if(_travelingInterestsList!.length != 0){
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: width * 0.78,
                  height: 26,
                  padding: EdgeInsets.only(left: width / 20),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            height: height,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.orange.withOpacity(0.3),
                              color: Colors.orange,
                              value: _selectedTravelingInterestsValue,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              '${_travelingInterestsCounter}',
                              style: TextStyle(fontSize: 15, color: Colors.orange),
                            ),
                          )
                        ],
                      ))),
              InkWell(
                onTap: _selectedTravelingInterests!.length != 0 ? (){
                  setState(() {
                    _isTravelingEnabled = false;

                    _isGeneralEnabled = true;
                    _isGeneralIconEnabled= true;
                  });
                } : null,
                child: Container(
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text('Далее',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            _selectedTravelingInterests!.isNotEmpty ? Colors.deepPurpleAccent : Colors.grey,
                            _selectedTravelingInterests!.isNotEmpty ? Colors.blueAccent : Colors.grey
                          ])),
                ),
              )
            ],
          ),
          SizedBox(height: height / 100),
          _selectedTravelingInterests!.isEmpty
              ? Center(
            child: Text(
              'Выберите минимум один интерес для продолжения',
              style: TextStyle(
                  fontSize: 15, color: Colors.grey.withOpacity(0.7)),
            ),
          ) : Container(
              width: width * 2,
              height: height / 18,
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: List.generate(_selectedTravelingInterests!.length, (index) {
                    return Material(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedTravelingInterests![index].name!,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: IconButton(
                                  icon: const Icon(CupertinoIcons.clear_circled, color: Colors.white),
                                  onPressed: (){

                                    int indx = _travelingInterestsList!.indexOf(_selectedTravelingInterests![index]);
                                    _travelingFilteredList!.insert(indx, _selectedTravelingInterests![index]);


                                    _selectedTravelingInterests!.removeAt(index);
                                    _selectedTravelingInterestsValue -= 0.01;
                                    --_travelingInterestsCounter;

                                    setState((){});
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            color: Color(int.parse('0x' + _selectedTravelingInterests![index].color!)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.orange[800]!,
                                  offset: const Offset(3, 3),
                                  blurRadius: 0,
                                  spreadRadius: 0
                              )
                            ]
                        ),
                      ),
                    );
                  }).reversed.toList(),
                ),
              )
          ),
          SizedBox(height: height / 100),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          _travelingFilteredList!.isNotEmpty ? SizedBox(
              height: height / 1.35,
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _travelingInterestsScrollController,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: width / 0.5,
                        child: Wrap(
                            spacing: 8.0,
                            runSpacing: 10.0,
                            children: List.generate(_travelingFilteredList!.length,
                                    (index) {
                                  return Material(
                                    child: InkWell(
                                      onTap: () {
                                        _selectedTravelingInterests!.add(_travelingFilteredList![index]);
                                        _travelingFilteredList!.removeAt(index);


                                        _selectedTravelingInterestsValue += 0.01;
                                        ++_travelingInterestsCounter;

                                        setState((){});
                                      },
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                        height: 40,
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Center(
                                          widthFactor: 1,
                                          child: Text(
                                            _travelingFilteredList![index].name!,
                                            style: const TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                                            color: Color(int.parse('0x' + _travelingFilteredList![index].color!)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.orange[800]!,
                                                  offset: const Offset(3, 3),
                                                  blurRadius: 0,
                                                  spreadRadius: 0
                                              )
                                            ]
                                        ),
                                      )
                                    ),
                                  );
                                })
                        ),
                      )
                  ),
                ),
              )) : AnimatedPadding(
              duration: Duration(milliseconds: 150),
              padding: EdgeInsets.symmetric(
                  vertical:  height / 5,
                  horizontal: width / 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'По вашему запросу не найдено подходящего интереса. Вы можете добавить новый вручную',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  addInterestsWidget()
                ],
              )
          )
        ],
      );
    }else{
      return travellingInterestsFutureBuilder();
    }
  }

  Widget generalInterestsGridView() {
    if(_generalInterestsList!.isNotEmpty){
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: width * 0.78,
                  height: 26,
                  padding: EdgeInsets.only(left: width / 20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            height: height,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
                              color: Colors.deepPurpleAccent,
                              value: _selectedGeneralInterestsValue,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              '${_generalInterestsCounter}',
                              style: TextStyle(fontSize: 15, color: Colors.deepPurpleAccent),
                            ),
                          )
                        ],
                      ))),
              InkWell(
                onTap: _selectedGeneralInterests!.length != 0 ? (){
                  setState(() {
                    _showLoading = true;
                  });
                  addInterestsToServer();
                } : null,
                child: Container(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: !_showLoading
                    ? Text('Готово',
                        style: TextStyle(fontSize: 15, color: Colors.white))
                    : Container(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            _selectedGeneralInterests!.length != 0 ? Colors.deepPurpleAccent : Colors.grey,
                            _selectedGeneralInterests!.length != 0 ? Colors.blueAccent : Colors.grey
                          ])),
                ),
              )
            ],
          ),
          SizedBox(height: height / 100),
          _selectedGeneralInterests!.length == 0
              ? Center(
            child: Text(
              'Выберите минимум один интерес для продолжения',
              style: TextStyle(
                  fontSize: 15, color: Colors.grey.withOpacity(0.7)),
            ),
          ): Container(
              width: width * 2,
              height: height / 18,
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: List.generate(_selectedGeneralInterests!.length, (index) {
                    return Material(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 10),
                        child: IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedGeneralInterests![index].name!,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: IconButton(
                                  icon: const Icon(CupertinoIcons.clear_circled, color: Colors.white),
                                  onPressed: (){
                                    int indx = _generalInterestsList!.indexOf(_selectedGeneralInterests![index]);
                                    _generalFilteredList!.insert(indx, _selectedGeneralInterests![index]);

                                    _selectedGeneralInterests!.removeAt(index);
                                    _selectedGeneralInterestsValue -= 0.01;
                                    --_generalInterestsCounter;

                                    setState((){});
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            color: Color(int.parse('0x' + _selectedGeneralInterests![index].color!)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.deepPurple,
                                  offset: const Offset(3, 3),
                                  blurRadius: 0,
                                  spreadRadius: 0
                              )
                            ]
                        ),
                      ),
                    );
                  }).reversed.toList(),
                ),
              )
          ),
          SizedBox(height: height / 100),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          _generalFilteredList!.length != 0 ? SizedBox(
              height: height / 1.35,
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _generalInterestsScrollController,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        width: width / 0.5,
                        child: Wrap(
                            spacing: 8.0,
                            runSpacing: 10.0,
                            children: List.generate(_generalFilteredList!.length,
                                    (index) {
                                  return Material(
                                    child: InkWell(
                                      onTap: () {
                                        _selectedGeneralInterests!.add(_generalFilteredList![index]);
                                        _generalFilteredList!.removeAt(index);

                                        _selectedGeneralInterestsValue += 0.01;
                                        ++_generalInterestsCounter;

                                        setState((){});
                                      },
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                        height: 40,
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Center(
                                          widthFactor: 1,
                                          child:  Text(
                                            _generalFilteredList![index].name!,
                                            style: const TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                                            color: Color(int.parse('0x' + _generalFilteredList![index].color!)),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.deepPurple,
                                                  offset: const Offset(3, 3),
                                                  blurRadius: 0,
                                                  spreadRadius: 0
                                              )
                                            ]
                                        ),
                                      )
                                    ),
                                  );
                                })
                        ),
                      )),
                ),
              )) : AnimatedPadding(
              duration: Duration(milliseconds: 150),
              padding: EdgeInsets.symmetric(
                  vertical:  height / 5,
                  horizontal: width / 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'По вашему запросу не найдено подходящего интереса. Вы можете добавить новый вручную',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  addInterestsWidget()
                ],
              )
          )
        ],
      );
    }else{
      return generalInterestsFutureBuilder();
    }
  }



  Widget popup18PlusAttentionWidget() {
    return Material(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      child: Container(
        padding: EdgeInsets.only(top: height / 80),
        height: height * 0.34,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: width / 8),
                  Text('Раздел 18+',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(CupertinoIcons.clear_thick_circled),
                    color: Colors.grey.withOpacity(0.5),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 15, right: 20),
              child: Text(
                'Этот раздел содержит материалы, которые могут носить деликатный характер. Желаете продолжить?',
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              padding: EdgeInsets.only(top: height / 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 48,
                    child: Material(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: height * 0.10,
                          child: Center(
                              child: Text('Отмена',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17))),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: Colors.grey, width: 0.5)),
                  ),
                  SizedBox(width: 12),
                  Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 48,
                      child: Material(
                        borderRadius: BorderRadius.circular(11),
                        color: Color.fromRGBO(145, 10, 251, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: height * 0.10,
                            child: Center(
                                child: Text('Продолжить',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17))),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addInterestsWidget() {
    return Container(
      padding: EdgeInsets.only(top: height / 50, left: width / 10, right: width / 10),
      child: Material(
        borderRadius: BorderRadius.circular(11),
        color: Color.fromRGBO(145, 10, 251, 5),
        child: InkWell(
          onTap: () => showAddInterestSheet(),
          child: SizedBox(
            height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.add_circled, color: Colors.white),
                  SizedBox(width: 5),
                  Text('Добавить новый интерес', style: TextStyle(fontSize: 17, color: Colors.white))
                ],
              )
          ),
        ),
      ),

    );
  }

  Widget newInterestsWidget(BuildContext sheetContext){
    return Material(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        padding: EdgeInsets.only(top: 15),
        height: addNewInterestFieldFocusNode!.hasFocus ? height / 1.3 : height / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: width / 8),
                  Text('Новый интерес',
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(CupertinoIcons.clear_thick_circled),
                    color: Colors.grey.withOpacity(0.5),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
            SizedBox(height: height / 50),
            Container(
              padding: EdgeInsets.only(left: 15, right: 20),
              child: Text(
                'Новый интерес появится в вашем профиле после проверки модератором Uny',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
            SizedBox(height: height / 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Название интереса', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: newInterestFieldTextController,
                    focusNode: addNewInterestFieldFocusNode,
                    cursorColor: Color.fromRGBO(145, 10, 251, 5),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onTap: () {
                      Focus.of(sheetContext).requestFocus(addNewInterestFieldFocusNode);
                    },
                    onEditingComplete: () {
                      addNewInterestFieldFocusNode!.unfocus();
                    }
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: height / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: width / 3,
                    height: height / 20,
                    child: Material(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Center(
                              child: Text('Отмена',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17))),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: Colors.grey, width: 0.5)),
                  ),
                  SizedBox(width: 12),
                  Container(
                      alignment: Alignment.center,
                      width: width / 3,
                      height: height / 20,
                      child: Material(
                        borderRadius: BorderRadius.circular(11),
                        color: Color.fromRGBO(145, 10, 251, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            addNewInterest(newInterestFieldTextController!.text);
                          },
                          child: Container(
                            child: Center(
                                child: Text('Отправить',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17))),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: height / 100, horizontal: 20),
              child: Text.rich(
                TextSpan(
                  text: 'Нажимая "Отправить", вы подтверждаете согласие с ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: 'условиями использования UnyApp',
                        style: TextStyle(color: Colors.blue)
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }



  void addNewInterest(String value){
    if(_isFamilyEnabled){
      setState(() {
        _selectedFamilyInterests!.add(FamilyInterestsModel(null, value, Colors.green.value.toRadixString(16)));
        _selectedFamilyInterestsValue += 0.01;

        ++_familyInterestsCounter;
      });
    }else if(_isCareerEnabled){
      setState(() {
        _selectedCareerInterests!.add(CareerInterestsModel(null, value, Colors.lightBlueAccent.value.toRadixString(16)));
        _selectedCareerInterestsValue += 0.01;

        ++_careerInterestsCounter;
      });
    }else if(_isSportEnabled){
      setState(() {
        _selectedSportInterests!.add(SportInterestsModel(null, value, Colors.blueAccent[800]!.value.toRadixString(16)));
        _selectedSportInterestsValue += 0.01;

        ++_sportInterestsCounter;
      });
    }else if(_isTravelingEnabled){
      setState(() {
        _selectedTravelingInterests!.add(TravellingInterestsModel(null, value, Colors.deepOrangeAccent.value.toRadixString(16)));
        _selectedTravelingInterestsValue += 0.01;

        ++_travelingInterestsCounter;
      });
    }else if(_isGeneralEnabled){
      setState(() {
        _selectedGeneralInterests!.add(GeneralInterestsModel(null, value, Colors.purpleAccent.value.toRadixString(16)));
        _selectedGeneralInterestsValue += 0.01;

        ++_generalInterestsCounter;
      });
    }
  }

  void showAddInterestSheet(){
    if(UniversalPlatform.isIOS){
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return newInterestsWidget(context);
        }
      );
    }else if(UniversalPlatform.isAndroid){
      showModalBottomSheet(
        context: context,
        builder: (context){
          return newInterestsWidget(context);
        }
      );
    }
  }

  void _openFamilyInterests(){
    setState(() {
      _isFamilyEnabled = true;

      _isCareerEnabled = false;
      _isSportEnabled = false;
      _isTravelingEnabled = false;
      _isGeneralEnabled = false;
    });
  }

  void _openCareerInterests(){
    setState(() {
      _isCareerEnabled = true;

      _isFamilyEnabled = false;
      _isSportEnabled = false;
      _isTravelingEnabled = false;
      _isGeneralEnabled = false;
    });
  }

  void _openSportInterests(){
    setState(() {
      _isSportEnabled = true;

      _isCareerEnabled = false;
      _isFamilyEnabled = false;
      _isTravelingEnabled = false;
      _isGeneralEnabled = false;
    });
  }

  void _openTravelingInterests(){
    setState(() {
      _isTravelingEnabled = true;

      _isSportEnabled = false;
      _isCareerEnabled = false;
      _isFamilyEnabled = false;
      _isGeneralEnabled = false;
    });
  }

  void _openGeneralInterests(){
    setState(() {
      _isGeneralEnabled = true;

      _isTravelingEnabled = false;
      _isSportEnabled = false;
      _isCareerEnabled = false;
      _isFamilyEnabled = false;
    });
  }



  void addInterestsToServer() async {

    final API = await UnyAPI.create(Constants.SIMPLE_RESPONSE_CONVERTER);

    String token = 'Bearer ' + TokenData.getUserToken();

    List<String?> _familyInterests = [];
    List<String?> _careerInterests = [];
    List<String?> _sportInterests = [];
    List<String?> _travelingInterests = [];
    List<String?> _generalInterests = [];

    for(var i in _selectedFamilyInterests!){
      _familyInterests.add(i.name);
    }

    for(var i in _selectedCareerInterests!){
      _careerInterests.add(i.name);
    }

    for(var i in _selectedSportInterests!){
      _sportInterests.add(i.name);
    }

    for(var i in _selectedTravelingInterests!){
      _travelingInterests.add(i.name);
    }

    for(var i in _selectedGeneralInterests!){
      _generalInterests.add(i.name);
    }


    var data = {
      'interests' : jsonEncode(_familyInterests),
      'type' : 'family'
    };

   API.addInterests(token, data).whenComplete(() async {
      data = {
        'interests' : jsonEncode(_careerInterests),
        'type' : 'career'
      };

      API.addInterests(token, data).whenComplete(() async {

        data = {
          'interests' : jsonEncode(_sportInterests),
          'type' : 'sport'
        };

        API.addInterests(token, data).whenComplete(() async {

          data = {
            'interests' : jsonEncode(_sportInterests),
            'type' : 'sport'
          };

          API.addInterests(token, data).whenComplete(() async {

            data = {
              'interests' : jsonEncode(_travelingInterests),
              'type' : 'traveling'
            };

            API.addInterests(token, data).then((value){
              print(value.body);

              data = {
                'interests' : jsonEncode(_generalInterests),
                'type' : 'general'
              };

              API.addInterests(token, data).whenComplete((){
                setState(() {
                  _showLoading = false;
                });

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()),
                      (Route<dynamic> route) => false,
                );
              });
            });
          });
        });
      });
    });
  }
}
