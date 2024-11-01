import 'package:flutter/material.dart';
import 'package:ambulancey/models/hospital_detail_model.dart';
import 'package:ambulancey/models/review_model.dart';
import 'package:ambulancey/views/common/star.dart';
import 'package:ambulancey/views/common/color.dart';
import 'package:ambulancey/views/common/dialog.dart';
import 'package:ambulancey/views/common/editable_star.dart';
import 'package:ambulancey/views/common/sub_page_template.dart';
import 'package:ambulancey/views/hospital/review_item.dart';

class HospitalDetail extends StatefulWidget {
  final int id;
  const HospitalDetail({super.key, required this.id});

  @override
  State<HospitalDetail> createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {
  int star = 5;

  Future<HospitalDetailModel> init() async {
    late final HospitalDetailModel data;
    await Future.delayed(
      const Duration(seconds: 1),
      () => data = const HospitalDetailModel(
        id: 1,
        name: '동대전정신병원',
        type: '정신과',
        description: '대전광역시 동구 삼정동 118-5',
        openTime: 'openTime',
        isOpen: true,
        phone: 'phone',
        star: 3.2,
        reviews: [
          ReviewModel(id: 1, name: 'user', content: '진료가 친절해요', star: 1.6),
          ReviewModel(id: 2, name: 'name', content: 'content', star: 5),
          ReviewModel(id: 3, name: 'name', content: 'content', star: 3.2),
          ReviewModel(id: 4, name: 'name', content: 'content', star: 2.4)
        ]
      )
    );
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HospitalDetailModel>(
      future: init(),
      builder: (context, snap) {
        if (!snap.hasData && snap.connectionState == ConnectionState.done) {
          return const Center(child: Text('Error loading data'));
        } else {
          final isDone = (snap.connectionState == ConnectionState.done);
          final HospitalDetailModel? data = snap.data;
          return Scaffold(
            body: SingleChildScrollView(
              child: SubpageTemplate(
                title: isDone ? data!.name : 'Loading...',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '설명: ${isDone ? data!.description : ''}',
                      style: const TextStyle(color: gray500, fontSize: 18),
                    ),
                    Text(
                      '진료과: ${isDone ? data!.type : ''}',
                      style: const TextStyle(color: gray500, fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    Container(width: double.infinity, height: 2, color: gray400),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          origin: const Offset(-80, 40),
                          scale: 1.08,
                          child: Star(star: isDone ? data!.star : 0)
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${isDone ? data!.star : 0}(평균)',
                          style: const TextStyle(color: gray700, fontSize: 18),
                        )
                      ]
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(5, (i) {
                      i = 4-i;
                      final count = isDone ? data!.reviews.where((e) => e.star.floor() == i + 1).length : 0;
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Text(
                                '${i + 1}점',
                                style: const TextStyle(color: gray500, fontSize: 14),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: count / (isDone ? data!.reviews.length : 1),
                                  color: blue400,
                                  backgroundColor: gray300,
                                  minHeight: 20,
                                  borderRadius: BorderRadius.circular(10),
                                )
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '$count건',
                                style: const TextStyle(color: gray500, fontSize: 14),
                              )
                            ]
                          )
                      );
                    }),
                    const SizedBox(height: 14),
                    Container(width: double.infinity, height: 2, color: gray400),
                    const SizedBox(height: 12),
                    const Text(
                      '병원후기',
                      style: TextStyle(
                        color: gray600,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text(
                        '${isDone ? data!.reviews.length : 0}건',
                      style: const TextStyle(
                        color: gray500,
                        fontSize: 16
                      )
                    ),
                    const SizedBox(height: 10),
                    if (isDone)
                      Column(
                        children: List.generate(
                          data!.reviews.length * 2,
                          (i) => i % 2 == 0 ? ReviewItem(data: data.reviews[i~/2]) : const SizedBox(height: 6)
                        )
                      )
                  ]
                )
              )
            ),
            bottomNavigationBar: CommentBottomInput(
              onTap: (comment)=>showDialog(
                context: context,
                builder: (context)=>ModalDialog(
                  title: '알림',
                  child: Column(
                    children: [
                      const Text(
                        '이 병원에 별점도 남겨주세요.',
                        style: TextStyle(
                          color: gray600,
                          fontSize: 20
                        )
                      ),
                      const SizedBox(height: 10),
                      EditableStar(onChanged: (value) => star = value)
                    ]
                  ),
                  onAccept: () {
                    print(star);
                  }
                )
              )
            )
          );
        }
      }
    );
  }
}

class CommentBottomInput extends StatefulWidget {
  final void Function(String) onTap;
  const CommentBottomInput({super.key, required this.onTap});

  @override
  State<CommentBottomInput> createState() => _CommentBottomInputState();
}

class _CommentBottomInputState extends State<CommentBottomInput> {
  String comment = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: white,
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 8,
            offset: Offset(0, -4)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              SizedBox(width: 16),
              Text(
                '후기 남기기',
                style: TextStyle(
                  color: gray500,
                  fontSize: 14
                )
              )
            ]
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: TextField(
                  cursorWidth: 1,
                  cursorHeight: 16,
                  cursorColor: Colors.black,
                  onChanged: (value)=>setState(()=>comment = value),
                  decoration: const InputDecoration(
                    fillColor: gray200,
                    filled: true,
                    isDense: true,
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(15))),
                    border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(15))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "후기를 남겨주세요",
                    hintStyle: TextStyle(
                      color: gray500,
                      fontSize: 16
                    )
                  )
                )
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: comment.isNotEmpty ? ()=>widget.onTap(comment) : null,
                enableFeedback: comment.isNotEmpty,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: ShapeDecoration(
                    color: comment.isEmpty ? gray400 : blue400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                    )
                  ),
                  child: const Icon(Icons.keyboard_arrow_up, color: white)
                )
              )
            ]
          )
        ]
      )
    );
  }
}
