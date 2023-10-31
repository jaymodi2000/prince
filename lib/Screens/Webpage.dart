import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:prince/Screens/Splashscreen.dart';
class webpage extends StatefulWidget {
  const webpage({super.key});
  @override
  State<webpage> createState() => _webpageState();
}
String dropdownValue = 'Gujarat';
class _webpageState extends State<webpage> {
  TextEditingController dateCtl = TextEditingController();
  TextEditingController states = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman & Diu',
    'Delhi',
    'Jammu & Kashmir',
    'Ladakh',
    'Lakshadweep',
    'Puducherry',
  ];
  var _newSelectedValue;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Aamani Client Data Form",style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal,),),
      ),
      body: SingleChildScrollView(
      child: Center(
    child: Form(
      key: _formKey,
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 3.6,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.network("https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=434,fit=crop,q=95/Y4LODR9ED1S2NLX4/aamani_group_logo-removebg-preview-Aq2e3QQxG6HRznjg.png",height: 50, width: 50,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Fill this form Compulsary",style: TextStyle(fontSize: 30,color: Colors.brown.shade700),),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText: "Full Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0.0),
                        ),
                        hintText: "Address",
                        prefixIcon: Icon(
                          Icons.abc,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0.0),
                        ),
                        hintText: "City",
                        prefixIcon: Icon(
                          Icons.location_on_sharp,color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          var _currentSelectedValue;
                          return InputDecorator(
                            decoration: InputDecoration(
                                //errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)
                                ),
                              hintText: "State",
                              prefixIcon: Icon(
                                Icons.location_on_sharp,color: Colors.black,
                              ),
                            ),
                            isEmpty: _currentSelectedValue == 'Gujarat',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _currentSelectedValue,
                                isDense: true,
                                onChanged: (value) => (String newValue) {
                                  setState(() {
                                    _newSelectedValue = newValue;
                                    state.didChange(_newSelectedValue);
                                  });
                                },
                                items: _states.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                      ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0.0),
                        ),
                        hintText: "Pincode",
                        prefixIcon: Icon(
                          Icons.pin,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                    controller: dateCtl,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0.0),
                        ),
                        hintText: "Date of Birth",
                        prefixIcon: Icon(Icons.calendar_month,color: Colors.black,
                        ),
                      ),
                    onTap: () async{
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:DateTime(1900),
                          lastDate: DateTime(2100));
                      dateCtl.text = date!.toString();},
                    ),
                  ),
              Padding(padding: EdgeInsets.all(10.0),
                    child : IntlPhoneField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0.0),
                        ),
                        counter: Offstage(),
                        hintText: 'Mobile Number',
                      ),
                      initialCountryCode: 'IN',
                      showDropdownIcon: true,
                      dropdownIconPosition: IconPosition.trailing,
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0.0),
                        ),
                        hintText: "Email Id",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
              SizedBox(height: 25,),
              Text("Nominee Details",style: TextStyle(fontSize: 30,color: Colors.black),),
              SizedBox(height: 25,),
              Padding(padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 0.0),
                        ),
                        hintText: "Nominee Name",
                        prefixIcon: Icon(
                          Icons.person
                        ),
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: dateCtl,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Date of Birth",
                    prefixIcon: Icon(Icons.calendar_month,color: Colors.black,
                    ),
                  ),
                  onTap: () async{
                    DateTime? date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());
                    date = await showDatePicker(
                        context: context,
                        initialDate:DateTime.now(),
                        firstDate:DateTime(1900),
                        lastDate: DateTime(2100));
                    dateCtl.text = date!.toIso8601String();},
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Relations",
                    prefixIcon: Icon(
                        Icons.person_2
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text("Project Details",style: TextStyle(fontSize: 30,color: Colors.black),),
              SizedBox(height: 25,),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 0.0),
                  ),
                    hintText: "Project Name",
                    prefixIcon: Icon(
                        Icons.account_balance
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Plot Area",
                    prefixIcon: Icon(
                        Icons.location_city_rounded
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Plot Rate",
                    prefixIcon: Icon(
                        Icons.currency_rupee
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Total Plot Value",
                    prefixIcon: Icon(
                        Icons.currency_rupee
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Investment Proposal",
                    prefixIcon: Icon(
                        Icons.person
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "If EMI",
                    prefixIcon: Icon(
                        Icons.currency_rupee
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "EMI Amount",
                    prefixIcon: Icon(
                        Icons.currency_rupee
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "EMI Term",
                    prefixIcon: Icon(
                        Icons.calendar_month
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "If EOI",
                    prefixIcon: Icon(
                        Icons.interests
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text("Payments/Booking Details",style: TextStyle(fontSize: 30,color: Colors.black),),
              SizedBox(height: 25,),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Booking Amount",
                    prefixIcon: Icon(
                        Icons.currency_rupee
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Payment Mode",
                    prefixIcon: Icon(
                        Icons.payment
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Paid Amount",
                    prefixIcon: Icon(
                        Icons.currency_rupee
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Transactions Details",
                    prefixIcon: Icon(Icons.details
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: dateCtl,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 0.0),
                    ),
                    hintText: "Date of Payments",
                    prefixIcon: Icon(Icons.calendar_month,color: Colors.black,
                    ),
                  ),
                  onTap: () async{
                    DateTime? date = DateTime(1900);
                    FocusScope.of(context).requestFocus(FocusNode());
                    date = await showDatePicker(
                        context: context,
                        initialDate:DateTime.now(),
                        firstDate:DateTime(1900),
                        lastDate: DateTime(2100));
                    dateCtl.text = date!.toIso8601String();},
                ),
              ),
              SizedBox(height: 10,),
              Text("This Information is correct, and I am responsible for this information.",style: TextStyle(color: Colors.brown.shade700),),
                  SizedBox(height: 30,),
                  Container(
                color: Colors.blue,
                height: 40,
                    width: 150,
              child: OutlinedButton(
                onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Splashscreen(),),
                );},
                child: const Text('Submit',style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ),
                  ],
              ),
                ],
                  ),
        ),
    ),
    ),
    ),
    );
  }
}
