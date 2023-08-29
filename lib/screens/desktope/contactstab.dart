import 'package:flutter/material.dart';

import '../../const/rkconst.dart';

class ContactsTab extends StatelessWidget {
  final String title;
  ContactsTab({
    super.key,
    required this.title,
  });

  final List<String> titles = [
    'کارمند',
    'مشتری',
    'نام کامل',
    'همراه',
    'ثابت',
    'آدرس',
    'یادداشت',
    'شغل',
    'پیگیری',
    'فروش',
  ];
  final List<String> testrecord = [
    'احمدی',
    '✅',
    'رضا خواجوند',
    '۰۹۲۱۳۷۶۲۷۶۰\n۰۹۲۱۳۷۶۲۷۶۰',
    '۰۲۱۲۲۴۸۴۲۵۶',
    'انتهای اتوبان ارتش شهرک',
    'تماس با آقای قنبری',
    'برنامه نویس',
    '۲۲۴۵۶۷۲۱',
    '✅',
  ];

  final ScrollController _horizcontroller = ScrollController();
  final ScrollController _vertcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbVisibility: true,
      interactive: true,
      radius: const Radius.circular(3),
      trackRadius: const Radius.circular(3),
      trackVisibility: true,
      trackColor: RKConst.bordercolor,
      thumbColor: RKConst.hintcolor,
      thickness: 7,
      controller: _vertcontroller,
      child: SingleChildScrollView(
        controller: _vertcontroller,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'مدیریت   شسفا     /    ',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    TextSpan(
                      text: title,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: RKConst.hintcolor),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: RKConst.hintcolor,
                    ),
                    hintStyle: TextStyle(
                      color: RKConst.hintcolor,
                      fontSize: 14,
                    ),
                    hintText:
                        'جستجو کنید : میتوانید از نام تاریخ و ... استفاده کنید'),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  RawScrollbar(
                    thumbVisibility: true,
                    interactive: true,
                    radius: const Radius.circular(3),
                    trackRadius: const Radius.circular(3),
                    trackVisibility: true,
                    trackColor: RKConst.bordercolor,
                    thumbColor: RKConst.hintcolor,
                    thickness: 7,
                    controller: _horizcontroller,
                    child: SingleChildScrollView(
                      controller: _horizcontroller,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: DataTable(
                        dataRowMinHeight: 60,
                        dataRowMaxHeight: 60,
                        headingRowHeight: 60,
                        border: TableBorder(
                          horizontalInside:
                              BorderSide(width: 0.3, color: RKConst.hintcolor),
                        ),
                        horizontalMargin: 0,
                        columns: List.generate(
                          titles.length,
                          (index) => DataColumn(
                            label: Text(
                              titles[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: RKConst.hintcolor),
                            ),
                          ),
                        ),
                        rows: List.generate(
                          20,
                          (index) => DataRow(
                            cells: List.generate(
                              testrecord.length,
                              (index) => DataCell(
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: index == testrecord.length - 1
                                          ? 100
                                          : 0),
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    testrecord[index],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(
                      21,
                      (index) => InkWell(
                        onTap: index == 0 ? null : () {},
                        child: Container(
                          height: 59,
                          width: 60,
                          margin: const EdgeInsets.only(bottom: 1),
                          decoration: BoxDecoration(
                            color: RKConst.cardcolor,
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(7, 0),
                                  blurRadius: 5,
                                  color: Colors.black12)
                            ],
                          ),
                          child: index == 0
                              ? Icon(
                                  Icons.more_horiz,
                                  color: RKConst.hintcolor,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 16,
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
