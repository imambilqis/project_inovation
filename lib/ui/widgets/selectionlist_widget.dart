import 'package:flutter/material.dart';
import 'package:selection_menu/components_configurations.dart';
import 'package:selection_menu/selection_menu.dart';
import 'package:project_inovation/core/models/selectionlist_model.dart';

class SelectionList extends StatelessWidget {
  final labelText;
  final initialIndex;
  final bool canTrigger;
  final List<SelectionListModel> itemList;
  final OnItemSelected<SelectionListModel> onItemSelected;

  SelectionList(
      {this.labelText,
      @required this.itemList,
      @required this.onItemSelected,
      this.initialIndex,
      this.canTrigger});

  @override
  Widget build(BuildContext context) {
    print(canTrigger);
    if (!canTrigger)
      return SelectionMenu<SelectionListModel>(
        itemsList: itemList,
        showSelectedItemAsTrigger: true,
        initiallySelectedItemIndex: initialIndex,
        itemBuilder: this.itemBuilder,
        onItemSelected: onItemSelected,
        closeMenuInsteadOfPop: true,
        closeMenuOnEmptyMenuSpaceTap: false,
        closeMenuWhenTappedOutside: true,
        closeMenuOnItemSelected: true,
        allowMenuToCloseBeforeOpenCompletes: true,
        componentsConfiguration:
            DropdownComponentsConfiguration<SelectionListModel>(
          triggerComponent: TriggerComponent(
            builder: _cantTriggerBuilder,
          ),
          triggerFromItemComponent:
              TriggerFromItemComponent<SelectionListModel>(
                  builder: _cantTriggerFromItemBuilder),
          menuSizeConfiguration: MenuSizeConfiguration(
            maxWidthFraction: double.infinity,
            maxHeightFraction: double.infinity,
            minHeightFraction: double.infinity,
            minWidthFraction: double.infinity,
          ),
          animationComponent: DialogAnimationComponent(),
        ),
      );
    else
      return SelectionMenu<SelectionListModel>(
        itemsList: itemList,
        showSelectedItemAsTrigger: true,
        initiallySelectedItemIndex: initialIndex,
        itemBuilder: this.itemBuilder,
        onItemSelected: onItemSelected,
        closeMenuInsteadOfPop: true,
        closeMenuOnEmptyMenuSpaceTap: false,
        closeMenuWhenTappedOutside: true,
        closeMenuOnItemSelected: true,
        allowMenuToCloseBeforeOpenCompletes: true,
        componentsConfiguration:
            DropdownComponentsConfiguration<SelectionListModel>(
          triggerComponent: TriggerComponent(
            builder: _triggerBuilder,
          ),
          triggerFromItemComponent:
              TriggerFromItemComponent<SelectionListModel>(
                  builder: _triggerFromItemBuilder),
          menuSizeConfiguration: MenuSizeConfiguration(
            maxWidthFraction: double.infinity,
            maxHeightFraction: double.infinity,
            minHeightFraction: double.infinity,
            minWidthFraction: double.infinity,
          ),
          animationComponent: DialogAnimationComponent(),
        ),
      );
  }

  Widget itemBuilder(BuildContext context, SelectionListModel data,
      OnItemTapped onItemTapped) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onItemTapped,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.optionText,
                    style: textStyle.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: textStyle.fontSize * 0.75,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
              thickness: 0.5,
            )
          ],
        ),
      ),
    );
  }

  Widget _triggerBuilder(TriggerComponentData data) {
    return ButtonTheme(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: data.triggerMenu,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              labelText,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _triggerFromItemBuilder(TriggerFromItemComponentData data) {
    if (data.item.icon != null)
      return ButtonTheme(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: data.triggerMenu,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: data.item.icon,
              ),
              Text(
                data.item.optionText,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      );
    else
      return ButtonTheme(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: data.triggerMenu,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
              ),
              Text(
                data.item.optionText,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      );
  }

  static Widget _cantTriggerFromItemBuilder(TriggerFromItemComponentData data) {
    if (data.item.icon != null)
      return ButtonTheme(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: data.item.icon,
              ),
              Text(
                data.item.optionText,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      );
    else
      return ButtonTheme(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
              ),
              Text(
                data.item.optionText,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      );
  }

  Widget _cantTriggerBuilder(TriggerComponentData data) {
    return ButtonTheme(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              labelText,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
