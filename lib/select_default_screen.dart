// import 'package:flutter/material.dart';

// class SelectDefaultSportScreen extends StatefulWidget {
//   @override
//   _SelectDefaultSportScreenState createState() =>
//       _SelectDefaultSportScreenState();
// }

// class _SelectDefaultSportScreenState extends State<SelectDefaultSportScreen> {
//   String selectedSport = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           icon: Icon(
//             Icons.close,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             // Add your logic to close the screen
//             Navigator.pop(context);
//           },
//         ),
//         title: Row(
//           children: [
//             Text(
//               'Select Default Sport',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Select your default sport:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           SportListTile(
//             sportName: 'Football',
//             isSelected: selectedSport == 'Football',
//             onTap: () {
//               _selectSport('Football');
//             },
//           ),
//           SportListTile(
//             sportName: 'Basketball',
//             isSelected: selectedSport == 'Basketball',
//             onTap: () {
//               _selectSport('Basketball');
//             },
//           ),
//           SportListTile(
//             sportName: 'Tennis',
//             isSelected: selectedSport == 'Tennis',
//             onTap: () {
//               _selectSport('Tennis');
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _selectSport(String sport) {
//     setState(() {
//       selectedSport = sport;
//     });
//   }
// }

// class SportListTile extends StatelessWidget {
//   final String sportName;
//   final bool isSelected;
//   final VoidCallback onTap;

//   SportListTile({
//     required this.sportName,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         leading: Icon(
//           Icons.sports_soccer,
//           color: Colors.white,
//         ), // You can replace this with sport-specific icons
//         title: Text(
//           sportName,
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         trailing: Icon(
//           Icons.notifications,
//           color: Color(0xff9B8BFF),
//         )
//         // isSelected
//         //     ? Container(
//         //         width: 4,
//         //         decoration: BoxDecoration(
//         //           color: Color(0xff9B8BFF), // Change the color as needed
//         //         ),
//         //       )
//         //     : null,
//         // onTap: onTap,
//         );
//   }
// }

import 'package:flutter/material.dart';

class SelectDefaultSportScreen extends StatefulWidget {
  @override
  _SelectDefaultSportScreenState createState() =>
      _SelectDefaultSportScreenState();
}

class _SelectDefaultSportScreenState extends State<SelectDefaultSportScreen> {
  String selectedSport = 'Football';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            // Add your logic to close the screen
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text(
              'Select Default Sport',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Select your default sport:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SportListTile(
            sportName: 'Football',
            sportIcon: Icons.sports_soccer,
            isSelected: selectedSport == 'Football',
            onTap: () {
              _selectSport('Football');
            },
          ),
          SportListTile(
            sportName: 'Basketball',
            sportIcon: Icons.sports_basketball,
            isSelected: selectedSport == 'Basketball',
            onTap: () {
              _selectSport('Basketball');
            },
          ),
          SportListTile(
            sportName: 'Tennis',
            sportIcon: Icons.sports_tennis,
            isSelected: selectedSport == 'Tennis',
            onTap: () {
              _selectSport('Tennis');
            },
          ),
        ],
      ),
    );
  }

  void _selectSport(String sport) {
    setState(() {
      selectedSport = sport;
    });
  }
}

class SportListTile extends StatelessWidget {
  final String sportName;
  final IconData sportIcon;
  final bool isSelected;
  final VoidCallback onTap;

  SportListTile({
    required this.sportName,
    required this.sportIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xff9B8BFF) : Colors.transparent,
            ),
            margin: EdgeInsets.only(right: 10),
          ),
          Icon(
            sportIcon,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            sportName,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      trailing: Icon(
        Icons.notifications,
        color: Color(0xff9B8BFF),
      ),
      onTap: onTap,
    );
  }
}
