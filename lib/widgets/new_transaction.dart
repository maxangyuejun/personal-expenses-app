import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  // const NewTransaction({Key? key}) : super(key: key);

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
          ),
          TextButton(
            onPressed: () {
              print(titleController.text);
              addTx(
                titleController.text,
                double.parse(amountController.text),
              );
            },
            child: Text(
              "Add Transaction",
              style: TextStyle(
                color: Colors.orange[900],
              ),
            ),
          )
        ],
      ),
    );
  }
}
