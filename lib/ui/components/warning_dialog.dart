import '../../utils/importer.dart';

class WarningDialog extends StatelessWidget {
  final Function() onDeleteTap;
  final String text;
  const WarningDialog({super.key, required this.onDeleteTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('warning'.tr),
      content: Text('${'are_you_sure'.tr} $text'),
      actions: [
        MaterialButton(
          onPressed: ()=>Navigator.of(context).pop(),
          child: Text('no'.tr),
        ),
        MaterialButton(
            onPressed: (){
              onDeleteTap();
              Navigator.of(context).pop();
            },
          child: Text('yes'.tr),
        ),
      ],
    );
  }
}
