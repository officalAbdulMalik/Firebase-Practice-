import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommarce_project/views/update_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controler/controlers/cubits/fetch_data_cubit.dart';

class Universty extends StatefulWidget {
  String id;

  Universty({super.key, required this.id});

  @override
  State<Universty> createState() => _UniverstyState();
}

class _UniverstyState extends State<Universty> {
  @override
  void initState() {
    context.read<FetchDataCubit>().fetchData(id: widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FetchDataCubit, FetchDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is FetchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchLoaded) {
            return ListView.builder(
                itemCount: state.model.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UpdateScreen(
                          docsid: state.model[index].id,
                          collectionid: widget.id,
                          univname: state.model[index].universityName,
                          addres: state.model[index].address,
                        );
                      }));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Text(state.model[index].id.toString()),
                        trailing:
                            Text(state.model[index].universityName.toString()),
                      ),
                    ),
                  );
                });
          } else if (state is FetchDataErro) {
            return Text('Some Error');
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
//stream builder
// StreamBuilder(
// stream: FirebaseFirestore.instance
//     .collection('university')
// .doc(id)
// .collection('details')
// .snapshots(),
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// return ListView.builder(
// itemCount: snapshot.data!.docs.length,
// itemBuilder: (context, int index) {
// return ListTile(
// trailing: Text('${index + 1}'),
// leading:
// Text(snapshot.data!.docs[index]['University_name']),
// );
// });
// } else {
// return const Center(child: Text('data is Empty'));
// }
// },
// )
