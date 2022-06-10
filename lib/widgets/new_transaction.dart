import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print("invalid");
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    // titleController.clear();
    // amountController.clear();
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              onSubmitted: (_) => submitData(),
            ),
          ),
          TextButton(
            onPressed: submitData,
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
