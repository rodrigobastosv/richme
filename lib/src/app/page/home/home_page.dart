import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo.png', height: 60,),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.white,
                Colors.green,
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[500],
      body: SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
          circleColors: [
            Colors.grey[300],
            Colors.green,
            Colors.red,
          ],
          iconTheme: IconThemeData(
            color: Colors.black45,
          ),
          activeIconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          backgroundColor: Colors.white,
          titleStyle: TextStyle(
            color: Colors.black45,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          activeTitleStyle: TextStyle(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          actionButtonDetails: SCActionButtonDetails(
            color: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            elevation: 2,
          ),
          elevation: 2,
          items: [
            SCBottomBarItem(
              icon: Icons.home,
              title: "Início",
              onPressed: () {},
            ),
            SCBottomBarItem(
              icon: Icons.supervised_user_circle,
              title: "Details",
              onPressed: () {},
            ),
            SCBottomBarItem(
              icon: Icons.add_alert,
              title: 'Alertas',
              onPressed: () {},
            ),
            SCBottomBarItem(
              icon: Icons.person,
              title: 'Perfil',
              onPressed: () {},
            ),
          ],
          circleItems: [
            SCItem(
              icon: Icon(Icons.money_off),
              onPressed: () {},
            ),
            SCItem(
              icon: Icon(Icons.money_outlined),
              onPressed: () {},
            ),
          ],
          bnbHeight: 80,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 0.35 * MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).primaryColor,
                      Colors.green,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 68,
                  ),
                  child: Column(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Último gasto: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'R\$ 350,00',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 34),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Valor em carteira: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'R\$ 1237,00',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 34),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Valor gasto: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'R\$ 3912,00',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 48,
                right: 48,
                child: Container(
                  height: 0.5 * MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 0.5 * MediaQuery.of(context).size.height - 80,
                          child: RaisedButton(
                            color: Color(0xFF77CD6A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Ganhos Extras',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.5 * MediaQuery.of(context).size.height - 80,
                          child: RaisedButton(
                            color: Color(0xFFE45259),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.money_off_csred_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Despesas',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.5 * MediaQuery.of(context).size.height - 80,
                          child: RaisedButton(
                            color: Color(0xFFceaaf2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.branding_watermark,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Economias',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.5 * MediaQuery.of(context).size.height - 80,
                          child: RaisedButton(
                            color: Color(0xFFF5B812),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.wine_bar_sharp,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Lista de Desejos',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.5 * MediaQuery.of(context).size.height - 80,
                          child: RaisedButton(
                            color: Color(0xFF5B54D4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.wine_bar_sharp,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Objetivos',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
