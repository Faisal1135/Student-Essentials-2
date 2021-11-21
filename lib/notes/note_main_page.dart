import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentessentials/constant.dart';
import 'package:studentessentials/hooks/box_hook.dart';
import 'package:auto_route/auto_route.dart';
import 'package:studentessentials/routes/routes.gr.dart';

import 'models/note_model.dart';
import 'package:auto_route/auto_route.dart';

class NotesScreen extends HookWidget {
  final DateFormat _dateFormatter = DateFormat('dd MMM');
  final DateFormat _timeFormatter = DateFormat('h:mm');

  NotesScreen({Key? key}) : super(key: key);

  final nonModWid = Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            CircleAvatar(
              child: Icon(Icons.verified_user),
            ),
            // Container(
            //   height: 50.0,
            //   width: 50.0,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/images/user.jpg'),
            //     ),
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            // ),
            SizedBox(width: 20.0),
            Text(
              'Bear Galib',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
    ],
  );

  // Widget _buildCategoryCard(int index, NoteTag tag, int count,
  //     List<NoteModel> argList, ValueNotifier<int> _selectedCategoryIndex) {
  //   return NoteCatagories();
  // }

  Column _buildNotesList(List<NoteModel> notes, BuildContext context) {
    return Column(
      children: notes
          .map(
            (note) => InkWell(
              onTap: () {
                context.router.push(EditNotePageRoute(existNote: note));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FB),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          note.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          _timeFormatter.format(note.datetime),
                          style: const TextStyle(
                            color: Color(0xFFAFB4C6),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      note.content,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      _dateFormatter.format(note.datetime),
                      style: const TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notebox = useBox<NoteModel>(Constant.kHiveNoteBox);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(EditNotePageRoute());
          },
          child: const Icon(Icons.add)),
      body: notebox == null
          ? const Center(child: CircularProgressIndicator())
          : ValueListenableBuilder(
              valueListenable: notebox.listenable(),
              builder:
                  (BuildContext context, Box<NoteModel> value, Widget? ch) {
                final Map<NoteTag, List<NoteModel>> categories = {
                  NoteTag.important: value.values
                      .where((note) => note.isImportent == true)
                      .toList(),
                  NoteTag.work: value.values
                      .where((note) => note.noteTag == NoteTag.work)
                      .toList(),
                  NoteTag.home: value.values
                      .where((note) => note.noteTag == NoteTag.home)
                      .toList(),
                  NoteTag.complete: value.values
                      .where((note) => note.noteTag == NoteTag.complete)
                      .toList(),
                };
                List<NoteModel> allNoteSortDate = value.values.toList()
                  ..sort((a, b) => a.datetime.compareTo(b.datetime));

                allNoteSortDate = allNoteSortDate.reversed.toList();

                return CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      title: Text('Your Notes'),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      nonModWid,
                      NoteCatagories(categories: categories),
                      _buildNotesList(allNoteSortDate, context),
                    ])),
                  ],
                );
              },
            ),
    );
  }
}

class NoteCatagories extends HookWidget {
  final Map<NoteTag, List<NoteModel>> categories;

  const NoteCatagories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedCategoryIndex = useState(0);
    return SizedBox(
      height: 280.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const SizedBox(width: 20.0);
          }
          return GestureDetector(
            onTap: () {
              _selectedCategoryIndex.value = index;
            },
            onDoubleTap: () {
              context.router.push(NoteCatagoryScreenRoute(
                  tag: categories.keys.toList()[index - 1]));
              // Navigator.of(context)
              //     .pushNamed(NoteCatagoryScreen.routeName, arguments: tag);
            },
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              height: 240.0,
              width: 175.0,
              decoration: BoxDecoration(
                color: _selectedCategoryIndex.value == index
                    ? const Color(0xFF417BFB)
                    : const Color(0xFFF5F7FB),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  _selectedCategoryIndex.value == index
                      ? const BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 10.0)
                      : const BoxShadow(color: Colors.transparent),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      noteTagString[categories.keys.toList()[index - 1]] ?? '',
                      style: TextStyle(
                        color: _selectedCategoryIndex.value == index
                            ? Colors.white
                            : const Color(0xFFAFB4C6),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      categories[categories.keys.toList()[index - 1]]
                              ?.length
                              .toString()
                              .padLeft(2, '0') ??
                          '00',
                      style: TextStyle(
                        color: _selectedCategoryIndex.value == index
                            ? Colors.white
                            : Colors.black,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Padding(
//                 padding: EdgeInsets.only(left: 15.0),
//                 child: TabBar(
//                   controller: _tabController,
//                   labelColor: Colors.black,
//                   unselectedLabelColor: Color(0xFFAFB4C6),
//                   indicatorColor: Color(0xFF417BFB),
//                   indicatorSize: TabBarIndicatorSize.label,
//                   indicatorWeight: 4.0,
//                   isScrollable: true,
//                   tabs: <Widget>[
//                     Tab(
//                       child: Text(
//                         'Notes',
//                         style: TextStyle(
//                           fontSize: 22.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: Text(
//                         'Important',
//                         style: TextStyle(
//                           fontSize: 22.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
