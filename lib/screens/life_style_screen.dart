import 'package:carrot_clone/components/life_style_screen_list_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LifeStyleScreen extends StatefulWidget {

  @override
  _LifeStyleScreenState createState() => _LifeStyleScreenState();
}

class _LifeStyleScreenState extends State<LifeStyleScreen> {

  Future getSentencesList() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  List<LifeStyleScreenListItem> postList = [
    LifeStyleScreenListItem(
      title: '1인 대관 헬스장 정보 있나요?',
      tag: '건강',
      author: '아이디 · 중산동',
      publishDate: 'Feb 26',
      readDuration: '12 mins',
    ),
    LifeStyleScreenListItem(
      title: '오늘 눈오나요',
      tag: '동네질문',
      author: '아이디2 · 운서동',
      publishDate: 'Dec 28',
      readDuration: '5 mins',
    ),
    LifeStyleScreenListItem(
      title: '젤네일 제거 해주실분',
      tag: '해주세요',
      author: '아이디3 · 운서동',
      publishDate: 'Dec 28',
      readDuration: '5 mins',
    ),
    LifeStyleScreenListItem(
      title: '미니행거 무료나눔',
      tag: '해주세요',
      author: '아이디 · 중산동',
      publishDate: 'Feb 26',
      readDuration: '12 mins',
    ),
    LifeStyleScreenListItem(
      title: '책상팝니다',
      tag: '해주세요',
      author: '아이디 · 중산동',
      publishDate: 'Dec 28',
      readDuration: '5 mins',
    ),
    LifeStyleScreenListItem(
      title: '미니행거 무료나눔',
      tag: '해주세요',
      author: '아이디 · 중산동',
      publishDate: 'Feb 26',
      readDuration: '12 mins',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getSentencesList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            return Column(
              children: [
                Container(
                  color: Color(0xFFf0f1f4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          TagItem(tagTitle: '동네질문'),
                          TagItem(tagTitle: '동네맛집'),
                          TagItem(tagTitle: '동네소식'),
                          TagItem(tagTitle: '분실/실종'),
                          TagItem(tagTitle: '동네질문'),
                          TagItem(tagTitle: '동네맛집'),
                          TagItem(tagTitle: '동네소식'),
                          TagItem(tagTitle: '분실/실종'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap:true,
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return postList[index];
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 10,
                        endIndent: 0,
                        color: Color(0xFFeff1f3),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFff723a),
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        tooltip: 'Increment',
        child: const Icon(
          FontAwesomeIcons.pencilAlt,
          size: 20.0,
        ),
      ),
    );
  }
}

class TagItem extends StatelessWidget {

  final String tagTitle;
  TagItem({required this.tagTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Color(0xFFd6d8df),
          ),
          borderRadius: BorderRadius.circular(5)
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          tagTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}




