part of '../welcome_view.dart';

class PrivacyPolicyWidget extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyPolicyController>(
      init: PrivacyPolicyController(),
      builder: (controller) {
        return CheckboxListTile(
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          checkColor: ColorsProject.apricotSorbet,
          contentPadding: EdgeInsets.zero,
          title: InkWell(
            onTap: () {},
            child: Text(
              'Gizlilik Politikası ve şartlarinizi kabul ediyorum.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorsProject.apricotSorbet,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          side: const BorderSide(color: ColorsProject.apricotSorbet),
          value: controller.isChecked.value,
          activeColor: Colors.white,
          onChanged: controller.toggleCheckbox,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}
