import 'package:flutter/widgets.dart';
import 'package:shopping2/ui/widgets/progress_indicator/progress-indicator.widget.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  Loader({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null)
      return Center(
        child: GenericProgressIndicator(),
      );

    if (object.length == 0)
      return Center(
        child: Text("No items to show!"),
      );

    return callback();
  }
}
