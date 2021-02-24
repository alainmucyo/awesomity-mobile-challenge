import 'package:awesomity_challenge/providers/task_provider.dart';
import 'package:awesomity_challenge/screens/task_form.dart';
import 'package:awesomity_challenge/utils/constants.dart';
import 'package:awesomity_challenge/widgets/app_bar.dart';
import 'package:awesomity_challenge/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  Widget _buildDashboardItem(String title, int amount, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .37,
      height: MediaQuery.of(context).size.width * .26,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[100]),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 6.0,
            offset: Offset(3, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "$amount",
            style: TextStyle(
                fontSize: 30,
                color: Constants.SECONDARY_COLOR,
                fontWeight: FontWeight.w900),
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, TaskFormScreen.routeName),
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .22,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .04,
                right: MediaQuery.of(context).size.width * .04,
                top: 20,
              ),
              decoration: BoxDecoration(
                color: Color(0xfffdfdfe),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 8.0,
                      offset: Offset(0, 2))
                ],
              ),
              width: double.infinity,
              padding: const EdgeInsets.only(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildDashboardItem("Total Tasks", 0, context),
                              _buildDashboardItem("Active Tasks", 0, context),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildDashboardItem("Tasks Done", 0, context),
                              _buildDashboardItem(
                                  "Active High Priority", 0, context),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: TaskList(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
