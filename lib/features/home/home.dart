import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internsala_assignment/features/home/widgets/custom_container.dart';
import 'package:internsala_assignment/features/home/widgets/customdrawer.dart';
import 'package:internsala_assignment/services/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends ConsumerStatefulWidget {
  static const routePath = '/Home-Screen';
  List<String>? jobTitle;
  List<bool>? workType;
  List<String>? joblocation;
  List<String>? salary;

  HomeScreen({
    super.key,
    this.jobTitle,
    this.workType,
    this.joblocation,
    this.salary,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool isRemote = false;
  bool isOffice = false;
  bool isBelow5500 = false;
  bool isBelow20000 = false;
  bool isAbove20000 = false;
  List<int> filteredIds = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterInternships);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterInternships);
    searchController.dispose();
    super.dispose();
  }

  void _filterInternships() {
    final data = ref.read(internships).asData?.value;
    if (data != null) {
      setState(() {
        filteredIds = data.internshipIds.where((id) {
          final jobTitle =
              data.internshipsMeta['$id']?.title.toLowerCase() ?? '';
          final salaryString =
              data.internshipsMeta['$id']?.stipend.salary ?? '';
          final salary =
              int.tryParse(salaryString.replaceAll(RegExp(r'\D'), '')) ?? 0;
          final isWFH = data.internshipsMeta['$id']?.workFromHome ?? false;
          final query = searchController.text.trim().toLowerCase();

          final matchesJobTitle = jobTitle.contains(query);
          final matchesWorkType = (isRemote && isWFH) ||
              (isOffice && !isWFH) ||
              (!isRemote && !isOffice);
          final matchesSalary = (isBelow5500 && salary <= 5500) ||
              (isBelow20000 && salary > 5500 && salary <= 20000) ||
              (isAbove20000 && salary > 20000) ||
              (!isBelow5500 && !isBelow20000 && !isAbove20000);

          return matchesJobTitle && matchesWorkType && matchesSalary;
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(internships);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leadingWidth: 45,
        title: const Text(
          "Internships",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width / 1.7,
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Job title',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: customDrawer(context),
      body: data.when(
        data: (data) {
          final idsToDisplay =
              filteredIds.isNotEmpty || searchController.text.isNotEmpty
                  ? filteredIds
                  : data.internshipIds;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRemote,
                    onChanged: (value) {
                      setState(() {
                        isRemote = value ?? false;
                        _filterInternships();
                      });
                    },
                  ),
                  const Text('Remote'),
                  Checkbox(
                    value: isOffice,
                    onChanged: (value) {
                      setState(() {
                        isOffice = value ?? false;
                        _filterInternships();
                      });
                    },
                  ),
                  const Text('Office'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isBelow5500,
                    onChanged: (value) {
                      setState(() {
                        isBelow5500 = value ?? false;
                        _filterInternships();
                      });
                    },
                  ),
                  const Text('5,500'),
                  Checkbox(
                    value: isBelow20000,
                    onChanged: (value) {
                      setState(() {
                        isBelow20000 = value ?? false;
                        _filterInternships();
                      });
                    },
                  ),
                  const Text('20,000'),
                  Checkbox(
                    value: isAbove20000,
                    onChanged: (value) {
                      setState(() {
                        isAbove20000 = value ?? false;
                        _filterInternships();
                      });
                    },
                  ),
                  const Text('>20,000'),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: idsToDisplay.length,
                  itemBuilder: (context, index) {
                    final id = idsToDisplay[index];
                    return customContainer(
                      jobTitle: '${data.internshipsMeta['$id']?.title}',
                      companyName:
                          '${data.internshipsMeta['$id']?.companyName}',
                      isWFH: data.internshipsMeta['$id']?.workFromHome,
                      salary: '${data.internshipsMeta['$id']?.stipend.salary}',
                      duration:
                          '${data.internshipsMeta['$id']?.duration.name.toLowerCase()}',
                      locations: data.internshipsMeta['$id']?.locationNames,
                      postedBy: '${data.internshipsMeta['$id']?.postedByLabel}',
                      deadLine: '${data.internshipsMeta['$id']?.expiringIn}',
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (error, stacktrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
