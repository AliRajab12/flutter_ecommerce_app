import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Data/models/product.dart';
import 'package:store/presentation/bloc/search/search_event.dart';
import 'package:store/presentation/screens/product_details/product_details_screen.dart';
import 'package:store/presentation/screens/search/components/item_not_found.dart';
import 'package:store/presentation/screens/search/components/search_app_bar.dart';
import 'package:store/presentation/bloc/search/search_state.dart';

import 'components/item_card.dart';

class ProductSearchDelegate extends CustomSearchDelegate<Product> {
  final Bloc<SearchEvent,SearchState> productBloc;

  ProductSearchDelegate({required this.productBloc});

  // Widget to display after the search query in the AppBar
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(),
    ];
  }

  // Widget to display before the current query in the AppBar
  @override
  Widget? buildLeading(BuildContext context) {
    return Container();
  }

  // The results shown after the user submits a search from the search page
  @override
  Widget buildResults(BuildContext context) {
    // final productBloc =  BlocProvider.of<SearchBloc>(context);

    // productBloc.add(const FetchDataEvent(queryString: ""));

    return Container();
  }

  // Suggestions shown in the body of the search page while user types a query into the seach field
  @override
  Widget buildSuggestions(BuildContext context) {
    return SafeArea(
      child: BlocBuilder(
        bloc: productBloc,
        builder: (BuildContext context,SearchState state){
          if(state is SearchLoadingState){
            return const Align(
              alignment: Alignment.topCenter,
                child: CircularProgressIndicator());
          }

          if(state is SearchSuccessFetchDataState){
            if(state.products.isEmpty){
              return const ItemNotFound();
            }else{
              return Center(
                child: Column(
                  children: [
                    Text(
                      "Found  ${state.products.length} results",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15,),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Wrap(
                                spacing: 15,
                                children:  List.generate(state.products.length, (index){
                                  return ItemCard(
                                      image: state.products[index].image,
                                      price: "From ${state.products[index].price}",
                                      title: state.products[index].title,
                                      evenItem : (index % 2 ==0) ? true : false,
                                      onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments: state.products[index])
                                  );
                                },
                                ),
                            ),
                              ),
                        ),
                          ],
                      )
                );
            }
          }

          if(state is SearchErrorFetchDataState){
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container();
        },
      ),
    );
  }
}
Future<T?> showProductSearchDelegate<T>({
  required BuildContext context,
  required CustomSearchDelegate<T> delegate,
  String? query = '',
  bool useRootNavigator = false,
}) {
  assert(delegate != null);
  assert(context != null);
  assert(useRootNavigator != null);
  delegate.query = query ?? delegate.query;
  delegate._currentBody = _SearchBody.suggestions;
  return Navigator.of(context, rootNavigator: useRootNavigator).push(_SearchPageRoute<T>(
    delegate: delegate,
  ));
}


abstract class CustomSearchDelegate<T> {

  CustomSearchDelegate({
    this.searchFieldLabel,
    this.searchFieldStyle,
    this.searchFieldDecorationTheme,
    this.keyboardType,
    this.textInputAction = TextInputAction.search,
  }) : assert(searchFieldStyle == null || searchFieldDecorationTheme == null);

  Widget buildSuggestions(BuildContext context);

  Widget buildResults(BuildContext context);

  Widget? buildLeading(BuildContext context);

  List<Widget>? buildActions(BuildContext context);

  PreferredSizeWidget? buildBottom(BuildContext context) => null;

  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }
  String get query => _queryTextController.text;

  set query(String value) {
    assert(query != null);
    _queryTextController.text = value;
    _queryTextController.selection = TextSelection.fromPosition(TextPosition(offset: _queryTextController.text.length));
  }

  void showResults(BuildContext context) {
    _focusNode?.unfocus();
    _currentBody = _SearchBody.results;
  }

  void showSuggestions(BuildContext context) {
    assert(_focusNode != null, '_focusNode must be set by route before showSuggestions is called.');
    _focusNode!.requestFocus();
    _currentBody = _SearchBody.suggestions;
  }

  void close(BuildContext context, T result) {
    _currentBody = null;
    _focusNode?.unfocus();
    Navigator.of(context)
      ..popUntil((Route<dynamic> route) => route == _route)
      ..pop(result);
  }

  final String? searchFieldLabel;

  final TextStyle? searchFieldStyle;

  final InputDecorationTheme? searchFieldDecorationTheme;

  final TextInputType? keyboardType;

  final TextInputAction textInputAction;

  Animation<double> get transitionAnimation => _proxyAnimation;

  FocusNode? _focusNode;

  final TextEditingController _queryTextController = TextEditingController();

  final ProxyAnimation _proxyAnimation = ProxyAnimation(kAlwaysDismissedAnimation);

  final ValueNotifier<_SearchBody?> _currentBodyNotifier = ValueNotifier<_SearchBody?>(null);

  _SearchBody? get _currentBody => _currentBodyNotifier.value;
  set _currentBody(_SearchBody? value) {
    _currentBodyNotifier.value = value;
  }

  _SearchPageRoute<T>? _route;
}
enum _SearchBody {
  suggestions,
  results,
}

class _SearchPageRoute<T> extends PageRoute<T> {
  _SearchPageRoute({
    required this.delegate,
  }) : assert(delegate != null) {
    assert(
    delegate._route == null,
    'The ${delegate.runtimeType} instance is currently used by another active '
        'search. Please close that search by calling close() on the SearchDelegate '
        'before opening another search with the same delegate instance.',
    );
    delegate._route = this;
  }

  final CustomSearchDelegate<T> delegate;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => false;

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  Animation<double> createAnimation() {
    final Animation<double> animation = super.createAnimation();
    delegate._proxyAnimation.parent = animation;
    return animation;
  }

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return _SearchPage<T>(
      delegate: delegate,
      animation: animation,
    );
  }

  @override
  void didComplete(T? result) {
    super.didComplete(result);
    assert(delegate._route == this);
    delegate._route = null;
    delegate._currentBody = null;
  }
}

class _SearchPage<T> extends StatefulWidget {
  const _SearchPage({
    required this.delegate,
    required this.animation,
  });

  final CustomSearchDelegate<T> delegate;
  final Animation<double> animation;

  @override
  State<StatefulWidget> createState() => _SearchPageState<T>();
}

class _SearchPageState<T> extends State<_SearchPage<T>> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.delegate._queryTextController.addListener(_onQueryChanged);
    widget.animation.addStatusListener(_onAnimationStatusChanged);
    widget.delegate._currentBodyNotifier.addListener(_onSearchBodyChanged);
    focusNode.addListener(_onFocusChanged);
    widget.delegate._focusNode = focusNode;
  }

  @override
  void dispose() {
    super.dispose();
    widget.delegate._queryTextController.removeListener(_onQueryChanged);
    widget.animation.removeStatusListener(_onAnimationStatusChanged);
    widget.delegate._currentBodyNotifier.removeListener(_onSearchBodyChanged);
    widget.delegate._focusNode = null;
    focusNode.dispose();
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status != AnimationStatus.completed) {
      return;
    }
    widget.animation.removeStatusListener(_onAnimationStatusChanged);
    if (widget.delegate._currentBody == _SearchBody.suggestions) {
      focusNode.requestFocus();
    }
  }

  @override
  void didUpdateWidget(_SearchPage<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.delegate != oldWidget.delegate) {
      oldWidget.delegate._queryTextController.removeListener(_onQueryChanged);
      widget.delegate._queryTextController.addListener(_onQueryChanged);
      oldWidget.delegate._currentBodyNotifier.removeListener(_onSearchBodyChanged);
      widget.delegate._currentBodyNotifier.addListener(_onSearchBodyChanged);
      oldWidget.delegate._focusNode = null;
      widget.delegate._focusNode = focusNode;
    }
  }

  void _onFocusChanged() {
    if (focusNode.hasFocus && widget.delegate._currentBody != _SearchBody.suggestions) {
      widget.delegate.showSuggestions(context);
    }
  }

  void _onQueryChanged() {
    setState(() {
      // rebuild ourselves because query changed.
    });
  }

  void _onSearchBodyChanged() {
    setState(() {
      // rebuild ourselves because search body changed.
    });
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = widget.delegate.appBarTheme(context);
    final String searchFieldLabel = widget.delegate.searchFieldLabel
        ?? MaterialLocalizations.of(context).searchFieldLabel;
    Widget? body;
    switch(widget.delegate._currentBody) {
      case _SearchBody.suggestions:
        body = KeyedSubtree(
          key: const ValueKey<_SearchBody>(_SearchBody.suggestions),
          child: widget.delegate.buildSuggestions(context),
        );
        break;
      case _SearchBody.results:
        body = KeyedSubtree(
          key: const ValueKey<_SearchBody>(_SearchBody.results),
          child: widget.delegate.buildResults(context),
        );
        break;
      case null:
        break;
    }

    late final String routeName;
    switch (theme.platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        routeName = '';
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        routeName = searchFieldLabel;
    }

    return Semantics(
      explicitChildNodes: true,
      scopesRoute: true,
      namesRoute: true,
      label: routeName,
      child: Theme(
        data: theme,
        child: Scaffold(
          // Added by me
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(150),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: (){
                                  Navigator.pop(context);
                                }
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                                child: SearchAppBar(queryTextController: widget.delegate._queryTextController,)
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: body,
            )
        ),
      ),
    );
  }
}