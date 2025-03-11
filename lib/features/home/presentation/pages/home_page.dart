import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_language_dynamic_app/core/functions/service_locator.dart';
import 'package:flutter_multi_language_dynamic_app/features/home/data/data_sources/post_remote_data_source.dart';
import 'package:flutter_multi_language_dynamic_app/features/home/data/repos/post_repository_impl.dart';
import 'package:flutter_multi_language_dynamic_app/features/home/presentation/manager/post_cubit/post_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/functions/changeLanguage.dart';
import '../../../../core/router/route_constants.dart';
import '../../../authentication/data/repos/auth_repository_impl.dart';
import '../../data/data_sources/post_local_data_source.dart';
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
          // First Tab: Horizontal and Vertical Scrolling
          _buildFirstTab(),
          // Second Tab: Map with Current Location
          _buildSecondTab(),
          // Third Tab: Post List
          BlocProvider(
            create: (context) => PostCubit(PostRepositoryImpl(
              localDataSource: PostLocalDataSource(),
              remoteDataSource: PostRemoteDataSource(),
            ))
              ..getPosts(),
            child: const PostList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Horizontal Scroll'),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.all(8),
                  color: Colors.blue,
                  child: Center(child: Text('Item $index')),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text('Vertical Scroll'),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSecondTab() {
    return const Center(
      child: Text('Map with Current Location'),
    );
  }

  void _logout(BuildContext context) {
    getIt<AuthRepositoryImpl>().clearSavedUser();
    context.pushReplacement(RouteConstants.login);
  }
}
