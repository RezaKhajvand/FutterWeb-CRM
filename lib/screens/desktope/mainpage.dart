import 'package:flutter/material.dart';
import 'package:shasfacrm/const/rkconst.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'contactstab.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final List<List<String>> menulist = [
    [
      'داشبورد',
      'assets/dashboard_icon.svg',
    ],
    [
      'مخاطبین',
      'assets/contacts_icon.svg',
    ],
    [
      'کارمندان',
      'assets/employee_icon.svg',
    ],
    [
      'فاکتورها',
      'assets/factor_icon.svg',
    ],
  ];

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4,
        vsync: this,
        initialIndex: 0,
        animationDuration: Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: RKConst.bgcolor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Row(
            children: [
              SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: ShapeDecoration(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text('مدیریت شسفا',
                              style: Theme.of(context).textTheme.bodyLarge)
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    StatefulBuilder(builder: (context, setState) {
                      return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  _tabController.animateTo(index,
                                      duration: Duration.zero);
                                  setState(() {});
                                },
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  leading: SvgPicture.asset(
                                    menulist[index].last,
                                    width: 24,
                                    color: _tabController.index == index
                                        ? RKConst.purplecolor
                                        : RKConst.hintcolor,
                                  ),
                                  title: Text(menulist[index].first,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: _tabController.index == index
                                                ? RKConst.purplecolor
                                                : RKConst.hintcolor,
                                          )),
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: menulist.length);
                    })
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: ShapeDecoration(
                    color: RKConst.cardcolor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: RKConst.bordercolor),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ContactsTab(title: 'داشبورد'),
                      ContactsTab(title: 'مخاطبین'),
                      ContactsTab(title: 'کارمندان'),
                      ContactsTab(title: 'فاکتورها'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

