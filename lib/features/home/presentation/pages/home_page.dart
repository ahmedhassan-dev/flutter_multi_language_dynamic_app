import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_language_dynamic_app/core/functions/service_locator.dart';
import 'package:flutter_multi_language_dynamic_app/features/home/data/data_sources/post_remote_data_source.dart';
import 'package:flutter_multi_language_dynamic_app/features/home/data/repos/post_repository_impl.dart';
import 'package:flutter_multi_language_dynamic_app/features/home/presentation/manager/post_cubit/post_cubit.dart';
import 'package:flutter_multi_language_dynamic_app/features/home/presentation/widgets/map_tap.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/functions/changeLanguage.dart';
import '../../../../core/router/route_constants.dart';
import '../../../authentication/data/repos/auth_repository_impl.dart';
import '../../data/data_sources/post_local_data_source.dart';
import '../widgets/horezental_and_vertical_view.dart';
import '../widgets/post_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('home')),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.map)),
            Tab(icon: Icon(Icons.list)),
          ],
        ),
        actions: [
          // Language Icon
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              changeLanguage(context);
            },
          ),
          // Logout Icon
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const HorezentalAndVerticalView(),
          const MapTap(),
          _postListTap(),
        ],
      ),
    );
  }

  BlocProvider<PostCubit> _postListTap() {
    return BlocProvider(
      create: (context) => PostCubit(PostRepositoryImpl(
        localDataSource: PostLocalDataSource(),
        remoteDataSource: PostRemoteDataSource(),
      ))
        ..getPosts(),
      child: const PostList(),
    );
  }

  void _logout(BuildContext context) {
    getIt<AuthRepositoryImpl>().clearSavedUser();
    context.pushReplacement(RouteConstants.login);
  }
}
