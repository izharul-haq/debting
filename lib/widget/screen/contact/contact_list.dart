import 'package:debting/model/contact.dart';
import 'package:debting/screen/contact/contact_info_screen.dart';
import 'package:debting/util/text.dart';
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
          ? _emptyContact()
          : ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
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
                        child: Text(
                          getInitials(contact.name),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          box.delete(contactKey);
                        },
                        icon: Icon(Icons.delete),
                      ),
                      title: Text(contact.name),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _emptyContact() {
    return Center(
      child: Text('Oops, You haven\'t add any contact'),
    );
  }
}
