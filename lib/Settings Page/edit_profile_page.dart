import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:uny_app/API/uny_app_api.dart';
import 'package:uny_app/Authorization%20Pages/authorization_page.dart';
import 'package:uny_app/Constants/constants.dart';
import 'package:uny_app/Data%20Models/Auth%20Data%20Models/auth_model.dart';
import 'package:uny_app/Settings%20Page/change_phone_number_page.dart';
import 'package:uny_app/Token%20Data/token_data.dart';

class EditProfilePage extends StatefulWidget{
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  FToast? _fToast;

  final String _deleteAccountAsset = 'assets/delete_account_icon.svg';
  final String _warningIconAsset = 'assets/warning_icon.svg';

  late double height;
  late double width;

  TextEditingController? _nameTextController;
  TextEditingController? _secondNameTextController;
  TextEditingController? _telephoneTextController;
  TextEditingController? _birthDateTextController;
  TextEditingController? _locationTextController;
  TextEditingController? _companyNameTextController;
  TextEditingController? _positionTextController;

  FocusNode? _nameTextFocusNode;
  FocusNode? _secondNameTextFocusNode;

  String _genderString = 'Женский';

  DateTime _date = DateTime.now();

  bool _showZodiacSign = true;
  bool _iAmNotWorking = true;

  bool _containsSymbolsAndNumbersTextField1 = false;
  bool _containsSymbolsAndNumbersTextField2 = false;

  @override
  void initState() {
    super.initState();

    _fToast = FToast();

    _nameTextController = TextEditingController();
    _secondNameTextController = TextEditingController();
    _telephoneTextController = TextEditingController();
    _birthDateTextController = TextEditingController();
    _locationTextController = TextEditingController();
    _companyNameTextController = TextEditingController();
    _positionTextController = TextEditingController();

    _nameTextFocusNode = FocusNode();
    _secondNameTextFocusNode = FocusNode();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      _fToast!.init(context);
    });
  }

  @override
  void dispose() {
    super.dispose();

    _nameTextController!.dispose();
    _secondNameTextController!.dispose();
    _telephoneTextController!.dispose();
    _birthDateTextController!.dispose();
    _locationTextController!.dispose();
    _companyNameTextController!.dispose();
    _positionTextController!.dispose();

    _nameTextFocusNode!.dispose();
    _secondNameTextFocusNode!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
       height = constraints.maxHeight;
       width = constraints.maxWidth;
       return ResponsiveWrapper.builder(
         Scaffold(
           appBar: AppBar(
             elevation: 0,
             centerTitle: false,
             backgroundColor: Colors.grey.withOpacity(0),
             title: Text('Редактировать профиль', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
             leading: IconButton(
               onPressed: () => Navigator.pop(context),
               icon: Icon(Icons.arrow_back, color: Colors.grey),
             ),
             actions: [
               Center(
                 child: TextButton(
                   child: Text(
                       'Сохранить',
                       style: TextStyle(
                           color: Color.fromRGBO(145, 10, 251, 5),
                         fontSize: 15
                       )),
                   onPressed: (){
                     validate();
                   },
                 ),
               )
             ],
           ),
           body: mainBody(),
         ),
         maxWidth: 800,
         minWidth: 450,
         defaultScale: true,
         breakpoints: [
           ResponsiveBreakpoint.resize(450, name: MOBILE),
           ResponsiveBreakpoint.autoScale(800, name: MOBILE),
         ],
       );
      },
    );
  }

  Widget mainBody(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 30),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Text('Основная информация', style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold)),
          Container(
              padding: EdgeInsets.only(top: height / 50),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameTextController,
                    focusNode: _nameTextFocusNode,
                    cursorColor: Color.fromRGBO(145, 10, 251, 5),
                    style: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: height / 50),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Имя:', style: TextStyle(
                            fontSize: 17,
                            color: _nameTextFocusNode!.hasFocus ? Color.fromRGBO(145, 10, 251, 5) : Colors.grey)),
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 10),
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                      fillColor: Colors.grey.withOpacity(0.1),
                      filled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _containsSymbolsAndNumbersTextField1 ? Colors.red : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: _containsSymbolsAndNumbersTextField1 ? Colors.red : Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onTap: (){
                      _secondNameTextFocusNode!.unfocus();

                      Focus.of(context).requestFocus(_nameTextFocusNode);
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _secondNameTextController,
                    focusNode: _secondNameTextFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.right,
                    cursorColor: Color.fromRGBO(145, 10, 251, 5),
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: height / 50),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Фамилия:', style: TextStyle(
                            fontSize: 17,
                            color: _secondNameTextFocusNode!.hasFocus ? Color.fromRGBO(145, 10, 251, 5) : Colors.grey)),
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 10),
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                      fillColor: Colors.grey.withOpacity(0.1),
                      filled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _containsSymbolsAndNumbersTextField2 ? Colors.red : Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: _containsSymbolsAndNumbersTextField2 ? Colors.red : Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onTap: () {
                      _nameTextFocusNode!.unfocus();

                      Focus.of(context).requestFocus(_secondNameTextFocusNode);
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    readOnly: true,
                    cursorColor: Color.fromRGBO(145, 10, 251, 5),
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: height / 50),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Пол:', style: TextStyle(fontSize: 17, color: Colors.grey)),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: DropdownButton<String>(
                          value: _genderString,
                          icon: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey),
                          underline: Container(),
                          items: [
                            DropdownMenuItem(
                              value: 'Мужской',
                              child: Text('Мужской', style: TextStyle(fontSize: 17, color: Colors.black)),
                            ),
                            DropdownMenuItem(
                              value: 'Женский',
                              child:  Text('Женский', style: TextStyle(fontSize: 17, color: Colors.black)),
                            ),
                            DropdownMenuItem(
                              value: 'Другое',
                              child:  Text('Другое', style: TextStyle(fontSize: 17, color: Colors.black)),
                            )
                          ],
                          onChanged: (value){
                            setState(() {
                              _genderString = value!;
                            });
                          },
                        )
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                      fillColor: Colors.grey.withOpacity(0.1),
                      filled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _telephoneTextController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    cursorColor: Color.fromRGBO(145, 10, 251, 5),
                    textAlign: TextAlign.right,
                    readOnly: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: height / 50),
                      suffixIcon: Container(
                        child: IconButton(
                          icon: Icon(Icons.keyboard_arrow_right_rounded, color: Colors.grey),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChangePhoneNumberPage())
                            );
                          },
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Телефон:', style: TextStyle(fontSize: 17, color: Colors.grey)),
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                      fillColor: Colors.grey.withOpacity(0.1),
                      filled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _birthDateTextController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    cursorColor: Color.fromRGBO(145, 10, 251, 5),
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: height / 50),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today_outlined, color: Color.fromRGBO(145, 10, 251, 5)),
                        onPressed: () => showDatePicker(),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Дата рождения:', style: TextStyle(fontSize: 17, color: Colors.grey)),
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 10),
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                      fillColor: Colors.grey.withOpacity(0.1),
                      filled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              )
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Отображать знак зодиака', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Switch.adaptive(
                activeColor: Color.fromRGBO(145, 10, 251, 5),
                value: _showZodiacSign,
                onChanged: (value){
                  setState(() {
                    _showZodiacSign = value;
                  });
                },
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Если вы скроете свой знак зодиака, то не сможете увидеть знак зодиака других людей',
            maxLines: 2,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Divider(
            thickness: 1,
          ),
          SizedBox(height: 10),
          Text(
            'Местоположение',
            style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _locationTextController,
            textInputAction: TextInputAction.done,
            cursorColor: Color.fromRGBO(145, 10, 251, 5),
            decoration: InputDecoration(
              hintText: 'Название города',
              hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
              fillColor: Colors.grey.withOpacity(0.1),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(thickness: 1),
          Text(
            'Карьера',
            style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Я не работаю', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Switch.adaptive(
                activeColor: Color.fromRGBO(145, 10, 251, 5),
                value: _iAmNotWorking,
                onChanged: (value){
                  setState(() {
                    _iAmNotWorking = value;
                  });
                },
              )
            ],
          ),
          SizedBox(height: 10),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: !_iAmNotWorking ? Column(
              children: [
                TextFormField(
                  controller: _companyNameTextController,
                  textInputAction: TextInputAction.done,
                  cursorColor: Color.fromRGBO(145, 10, 251, 5),
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: height / 50, horizontal: width / 15),
                    hintText: 'Название компании',
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _positionTextController,
                  textInputAction: TextInputAction.done,
                  cursorColor: Color.fromRGBO(145, 10, 251, 5),
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: height / 50, horizontal: width / 15),
                    hintText: 'Должность в компании',
                    hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                    fillColor: Colors.grey.withOpacity(0.1),
                    filled: true,
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ) : Container(),
          ),
          SizedBox(height: 10),
          Divider(thickness: 8, color: Colors.grey.withOpacity(0.2)),
          SizedBox(height: 10),
          Text(
            'Удаление аккаунта',
            style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Вы можете полностью удалить аккаунт Uny, истории сообщений, данные и информацию, указанную в нём.',
            maxLines: 2,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(height: 20),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            onTap: () => _showDeleteUnyAccountDialog(),
            child: Container(
              height: height / 18,
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(_deleteAccountAsset),
                      SizedBox(width: 10),
                      Text('Удалить аккаунт Uny', style: TextStyle(
                          color: Colors.black, fontSize: 17))
                    ],
                  )
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                      color: Colors.grey,
                      width: 0.5
                  )
              ),
            ),
          )
        ],
      ),
    );
  }

  void showDatePicker(){
    showCupertinoModalPopup(
        context: context,
        builder: (context){
          return Material(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
                height: (width / 2) * 1.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: width / 8),
                          Text('Дата рождения', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Container(
                            child: IconButton(
                              icon: Icon(
                                  CupertinoIcons.clear_thick_circled,
                                  color: Colors.grey.withOpacity(0.5)),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 500,
                      child: CupertinoDatePicker(
                        dateOrder: DatePickerDateOrder.dmy,
                        initialDateTime: _date,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (dateTime){
                          setState(() {
                            _date = dateTime;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 500,
                      padding: EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: FloatingActionButton.extended(
                        onPressed: (){
                          var formatter = DateFormat('dd.MM.yyyy');
                          var date = formatter.format(_date);
                          _birthDateTextController!.value = _birthDateTextController!.value.copyWith(text: date);

                          Navigator.pop(context);
                        },
                        label: Text('Готово', style: TextStyle(fontSize: 17, color: Colors.white)),
                        backgroundColor: Color.fromRGBO(145, 10, 251, 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(11))
                        ),
                      ),
                    )
                  ],
                )
            ),
          );
        }
    );
  }

  void _showDeleteUnyAccountDialog() {
    if(UniversalPlatform.isIOS){
      showCupertinoModalPopup(
          context: context,
          builder: (context){
            return CupertinoActionSheet(
              title: Text.rich(
                TextSpan(
                    text: 'Вы уверены, что хотите удалить аккаунт Uny? ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(
                          text: 'Это действие невозможно отменить.',
                          style: TextStyle(color: Colors.red, fontSize: 15)
                      ),
                    ]
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () async {
                    String token = TokenData.getUserToken();
                    Response<AuthModel> response = await UnyAPI.create(Constants.AUTH_MODEL_CONVERTER_CONSTANT).removeAccount('Bearer ' + token);

                    if(response.body!.success == true){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => AuthorizationPage()),
                            (Route<dynamic> route) => false,
                      );
                    }
                  },
                  isDestructiveAction: true,
                  child: Text('Удалить аккаунт'),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(context),
                child: Text('Отмена'),
              ),
            );
          }
      );
    }else if(UniversalPlatform.isAndroid){
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text.rich(
                TextSpan(
                    text: 'Вы уверены, что хотите удалить аккаунт Uny? ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(
                          text: 'Это действие невозможно отменить.',
                          style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    ]
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    String token = TokenData.getUserToken();
                    Response<AuthModel> response = await UnyAPI.create(Constants.AUTH_MODEL_CONVERTER_CONSTANT).removeAccount('Bearer ' + token);

                    if(response.body!.success == true){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => AuthorizationPage()),
                            (Route<dynamic> route) => false,
                      );
                    }
                  },
                  child: Text('Удалить аккаунт', style: TextStyle(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Отмена', style: TextStyle(color: Color.fromRGBO(145, 10, 251, 5))),
                ),
              ],
            );
          }
      );
    }
  }

  void validate() { 
    String _name = _nameTextController!.text;
    String _secondName = _secondNameTextController!.text;
    if(_name.contains(RegExp(r'[0-9]')) || _name.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      setState(() {
        _containsSymbolsAndNumbersTextField1 = true;
      });
      _showToast(0);
    }else if(_secondName.contains(RegExp(r'[0-9]')) || _secondName.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      setState(() {
        _containsSymbolsAndNumbersTextField2 = true;
      });
      _showToast(1);
    }else{
      setState(() {
        _containsSymbolsAndNumbersTextField1 = false;
        _containsSymbolsAndNumbersTextField2 = false;
      });
      print('Good');
    }
  }

  void _showToast(int index) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          index == 0 ?
          Text("Имя не может содержать цифры и символы", style: TextStyle(color: Colors.white))
          : Text("Фамилия не может содержать цифры и символы", style: TextStyle(color: Colors.white)),
          Container(
            height: 20,
            width: 20,
            child: Center(child: SvgPicture.asset(_warningIconAsset)),
          )
        ],
      ),
    );

    _fToast!.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
  }

}