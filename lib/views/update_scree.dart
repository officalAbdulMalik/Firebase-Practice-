import 'package:ecommarce_project/controler/controlers/cubits/update_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateScreen extends StatelessWidget {
  String docsid;
  String collectionid;
  String univname;
  String addres;
  UpdateScreen({
    super.key,
    required this.docsid,
    required this.collectionid,
    required this.univname,
    required this.addres,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 100,
            width: 300,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Expanded(child: Text('docs id')),
                        const Expanded(
                          child: Text('University Name'),
                        ),
                        const Expanded(child: Text('Address')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: Text(docsid)),
                        Expanded(child: Text(univname)),
                        Expanded(
                          child: Text(addres),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Container(
              height: 40,
              margin: const EdgeInsets.only(left: 70, right: 70),
              child: MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    context
                        .read<UpdateCubit>()
                        .update(docid: docsid, colleid: collectionid);
                  }))
        ],
      ),
    );
  }
}
