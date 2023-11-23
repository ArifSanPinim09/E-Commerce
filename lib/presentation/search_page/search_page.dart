// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// import 'package:ecomerce/bloc/bloc/search_bloc.dart';
import 'package:ecomerce/bloc/search/search_bloc.dart';
import 'package:ecomerce/presentation/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    required this.search,
  }) : super(key: key);
  final String search;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.text = widget.search;
    context.read<SearchBloc>().add(SearchEvent.search(widget.search));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(
              height: 42,
              // margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 3,
                child: TextFormField(
                  controller: searchController,
                  onFieldSubmitted: (_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchPage(search: searchController.text);
                        },
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 6,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 23,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(top: 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black38,
                        width: 1,
                      ),
                    ),
                    hintText: 'Search here ....',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: Text("Daftar Tidak Ada!"),
              );
            },
            success: (listProductResponseModel) {
              return ListView.builder(
                itemCount: listProductResponseModel.data!.length,
                itemBuilder: (context, index) {
                  final product = listProductResponseModel.data![index];
                  return InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(
                          product: product,
                        );
                      },
                    )),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            product.attributes!.image!,
                          ),
                        ),
                        title: Text(
                          product.attributes!.name!,
                        ),
                        subtitle: Text(product.attributes!.price!),
                        trailing:
                            Text("Stock : ${product.attributes!.quantity}"),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
