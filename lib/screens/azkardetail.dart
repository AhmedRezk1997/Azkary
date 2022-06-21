import 'package:azkary/model/azkardetailmodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Azkardetail extends StatefulWidget {
  final int id;
  final String title;
  const Azkardetail({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _AzkardetailState createState() => _AzkardetailState();
}

class _AzkardetailState extends State<Azkardetail> {
  List<SectionDetailModel> sectionDetails = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSectionDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        backgroundColor: Colors.cyan[500],
        centerTitle: true,
        title: Text(
          "${widget.title}",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(color: Colors.cyan[200], boxShadow: [
                  BoxShadow(
                    color: Colors.cyan,
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]),
                child: ListTile(
                  title: Text(
                    "${sectionDetails[index].description}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  subtitle: Text(
                    "${sectionDetails[index].content}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Colors.grey.withOpacity(.8),
                ),
            itemCount: sectionDetails.length),
      ),
    );
  }

  loadSectionDetail() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/data/datadetail.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetailModel _sectionDetail =
            SectionDetailModel.fromJson(section);

        if (_sectionDetail.sectionId == widget.id) {
          sectionDetails.add(_sectionDetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
