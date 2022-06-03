import 'package:flutter/material.dart';
import 'package:razorbook_barber/helpers/colors.dart';
import 'package:razorbook_barber/helpers/style.dart';

class ProfileViewOpenTime extends StatefulWidget {
  const ProfileViewOpenTime({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileViewOpenTime> createState() => _ProfileViewOpenTimeState();
}

class _ProfileViewOpenTimeState extends State<ProfileViewOpenTime> {
  List<String> data = [
    "TUE - 09:00 AM - 09:00 PM",
    "WED - 09:00 AM - 09:00 PM",
    "THU - 09:00 AM - 09:00 PM",
    "FRI - 09:00 AM - 09:00 PM",
    "SAT - 09:00 AM - 09:00 PM",
    "SUN - 09:00 AM - 09:00 PM"
  ];
  List<String> deletedData = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Opening Time",
                      style: kProfileInfoTextBold,
                    ),
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: const Icon(Icons.edit_note_sharp)),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: const Text('Add Open Time'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _controller,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    // shape: const StadiumBorder(),
                                                    primary: Helper.kFABColor,
                                                    fixedSize:
                                                        const Size(100, 42)),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("CANCLE")),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    // shape: const StadiumBorder(),
                                                    primary: Helper.kFABColor,
                                                    fixedSize:
                                                        const Size(100, 42)),
                                                onPressed: () {
                                                  setState(() {
                                                    data.add(_controller.text);
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("SAVE")),
                                          ],
                                        )
                                      ],
                                    ),
                                  ));
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // Wrap(
                //   spacing: 8,
                //   runSpacing: 8,
                //   children: data.map((e) {
                //     bool isDeleted = deletedData.contains(e);
                //     log(isDeleted ? 'deleted' : 'not deleted');
                //     return !isDeleted
                //         ? Chip(
                //             onDeleted: () {
                //               setState(() {
                //                 if (deletedData.length < data.length - 1) {
                //                   deletedData.add(e);
                //                 }
                //               });
                //             },
                //             label: Text(e),
                //             deleteIcon: const Icon(Icons.cancel)
                //             // backgroundColor: kProfileInfoChipColor,
                //             )
                //         : Container();
                //   }).toList(),
                // ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (ctx, idx) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[idx],
                                style: kProfileInfoText14,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      data.removeAt(idx);
                                    });
                                  },
                                  icon: const Icon(Icons.cancel)),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
