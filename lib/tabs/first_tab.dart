import 'package:flutter/material.dart';

class firstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ContactPage();
  }
}
class StudentModal {
  final String fullName;
  final String email;

  const StudentModal({this.fullName, this.email});
}
class ContactPage extends StatelessWidget {
  _buildContactList() {
    return <StudentModal>[
      const StudentModal(
          fullName: 'AStudent 1', email: 'Astudent1@example.com'),
      const StudentModal(
          fullName: 'BStudent 2', email: 'Bstudent2@example.com'),
      const StudentModal(
          fullName: 'CStudent 3', email: 'Cstudent3@example.com'),
      const StudentModal(
          fullName: 'DStudent 4', email: 'Dstudent4@example.com'),
      const StudentModal(
          fullName: 'EStudent 5', email: 'Estudent5@example.com'),
      const StudentModal(
          fullName: 'FStudent 6', email: 'Fstudent6@example.com'),
      const StudentModal(
          fullName: 'GStudent 7', email: 'Gstudent7@example.com'),
      const StudentModal(
          fullName: 'HStudent 8', email: 'Hstudent8@example.com'),
      const StudentModal(
          fullName: 'IStudent 9', email: 'Istudent9@example.com'),
      const StudentModal(
          fullName: 'JStudent 10', email: 'Jstudent10@example.com'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContactsList(_buildContactList()));
  }

}
class ContactsList extends StatelessWidget {
  final List<StudentModal> _contactModal;

  ContactsList(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<ContactListItem> _buildContactsList() {
    return _contactModal
        .map((contact) => ContactListItem(contact))
        .toList();
  }
}
class ContactListItem extends StatelessWidget {
  final StudentModal _contactModal;

  ContactListItem(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(child: Text(_contactModal.fullName[0])),
        title: Text(_contactModal.fullName),
        subtitle: Text(_contactModal.email));
  }
}