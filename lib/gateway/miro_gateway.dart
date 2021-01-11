import 'package:injectable/injectable.dart';
import 'package:trello2miro/domain/board_id.dart';
import 'package:trello2miro/domain/lane.dart';
import 'package:trello2miro/domain/story.dart';
import 'package:trello2miro/driver/miro.dart';
import 'package:trello2miro/port/miro_port.dart';

@Singleton(as: MiroPort)
class MiroGateway implements MiroPort {
  final Miro _miro;

  MiroGateway(this._miro);

  @override
  Future<void> createLanes(BoardId id, Lanes lanes) async {
    await lanes.forEachIndex((column, lane) async {
      lane.stories.forEachIndex((row, story) async {
        await _miro.createSticker(id.value, column * _columnWidth,
            row * _rowHeight, story.toHtmlString());
      });
      await _miro.createText(id.value,
          column * _columnWidth,
          _marginTop,
          lane.category.name.value,
          fontSize: 36,
          textAlign: 'center');
    });
  }
}

extension on Story {
  String toHtmlString() {
    var tags = this.tags.isNotEmpty
        ? '<p>${this.tags.map((t) => '[${t.value}]').join(' ')}</p>'
        : '';
    var point = this.point.isPresent ? '(${this.point.value.value}) ' : '';
    return '${tags}<p>${point}${content.value}</p>';
  }
}

const _columnWidth = 300;
const _rowHeight = 140;
const _marginTop = -80;
