import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:studentessentials/hooks/box_hook.dart';

import '../../constant.dart';
import 'models/note_model.dart';

import 'widget/notegriditem.dart';

class NoteCatagoryScreen extends HookWidget {
  const NoteCatagoryScreen({Key? key, required this.tag}) : super(key: key);
  final NoteTag tag;

  @override
  Widget build(BuildContext context) {
    final notebox = useBox<NoteModel>(Constant.kHiveNoteBox);
    return Scaffold(
      appBar: AppBar(
        title: Text('$tag'),
      ),
      body: notebox != null
          ? ValueListenableBuilder(
              valueListenable: notebox.listenable(),
              builder:
                  (BuildContext context, Box<NoteModel> noteBox, Widget? ch) {
                List<NoteModel> notelist = noteBox.values.toList();
                List<NoteModel> notes = tag == NoteTag.important
                    ? notelist
                        .where((note) => note.isImportent == true)
                        .toList()
                    : notelist.where((note) => note.noteTag == tag).toList();
                return StaggeredGridView.countBuilder(
                    itemCount: notes.length,
                    crossAxisCount: 4,
                    itemBuilder: (BuildContext context, int i) => NoteGriditem(
                          note: notes[i],
                        ),
                    staggeredTileBuilder: (int i) =>
                        const StaggeredTile.fit(2));
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

//  StaggeredGridView.countBuilder(
//               crossAxisCount: 4,
//               itemCount: notes.length,
             
//               staggeredTileBuilder: (int i) => StaggeredTile.fit(2),
//             );
// StaggeredGridView.countBuilder(
//         crossAxisCount: 4,
//         itemCount: notes.length,
//         itemBuilder: (BuildContext context, int i) => NoteGriditem(
//           note: notes[i],
//         ),
//         staggeredTileBuilder: (int i) => StaggeredTile.fit(2),
//       ),
