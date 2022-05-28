import 'package:debting/model/contact.dart';
import 'package:debting/screen/contact/contact_info_screen.dart';
import 'package:debting/util/text.dart';
import 'package:debting/widget/common/empty_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  late final Box debtBox;

  @override
  void initState() {
    super.initState();
    debtBox = Hive.box('debts');
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: debtBox.listenable(),
      builder: (context, Box box, widget) => box.isEmpty
          ? EmptyList(message: 'Oops, You haven\'t add any contact')
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: box.length,
              itemBuilder: (context, index) {
                var contact = box.getAt(index) as Contact;
                var contactKey = box.keyAt(index);

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactInfoScreen(
                            uuid: contactKey as String,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      leading: CircleAvatar(
                        child: Text(getInitials(contact.name)),
                      ),
                      trailing: IconButton(
                        onPressed: () => _deleteDialog(context, contactKey),
                        icon: Icon(Icons.delete_rounded),
                      ),
                      title: Text(contact.name),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _deleteDialog(BuildContext context, String contactKey) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Contact'),
          content: Text('Are you sure to remove this contact?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                debtBox.delete(contactKey);
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.all(Colors.blue.shade600),
              ),
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
