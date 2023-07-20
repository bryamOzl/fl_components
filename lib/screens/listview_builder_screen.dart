import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatefulWidget {
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  _ListviewBuilderScreenState createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = new ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // print(
      //     '${scrollController.position.pixels},${scrollController.position.maxScrollExtent}');

      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // add5();
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  Future<void> oneRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: oneRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/500/300?image=${imagesIds[index]}'),
                  );
                },
              ),
            ),
            if (isLoading)
              Positioned(
                bottom: 40.0,
                left: size.width * 0.5 - 30,
                child: _LoadingIcon(),
              ),
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
