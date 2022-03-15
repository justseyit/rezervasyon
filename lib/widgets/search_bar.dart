import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.enabled, this.onTap, this.onChanged, this.onSettingsTap, required this.isColorBlack}) : super(key: key);

  final bool enabled;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function()? onSettingsTap;
  final bool isColorBlack;


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width*(9/10),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isColorBlack == false ? Color.fromARGB(255, 20, 20, 20) : Color.fromARGB(255, 245, 245, 245),
          border: Border.all(
            color: isColorBlack == false ? Color.fromARGB(255, 0, 0, 0) : Color.fromARGB(255, 225, 225, 225),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Icon(Icons.search, color: Theme.of(context).disabledColor,),
            ),
            Container(
              width: MediaQuery.of(context).size.width*(6.5/10),
              height: 60,
              child: Center(
                child: TextFormField(
                  onTap: onTap,
                  enabled: enabled,
                  onChanged: onChanged,
                  style: TextStyle(fontSize: 16),
                  autofocus: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    hintText: "Demokrasi Gazetesinde arayın.",
                    //hintStyle: TextStyle(fontFamily: 'JetBrainsMono-Light'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Icon(Icons.tune_outlined, color: Theme.of(context).disabledColor,),
                onTap: onSettingsTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}