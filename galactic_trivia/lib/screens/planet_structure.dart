import 'package:flutter/material.dart';

class SolarSystemScreen extends StatelessWidget {
  final List<Map<String, dynamic>> solarSystemContent = [
    {
      'name': 'Mercury',
      'image': 'assets/images/mercury.png',
      'description':
          'Mercury is the closest planet to the Sun and has extreme temperatures. It has no atmosphere and a very cratered surface.',
    },
    {
      'name': 'Venus',
      'image': 'assets/images/venus.png',
      'description':
          'Venus is similar in size and composition to Earth but has a thick, toxic atmosphere with extreme surface temperatures.',
    },
    {
      'name': 'Earth',
      'image': 'assets/images/earth.png',
      'description':
          'Earth is the only known planet to support life. It has a diverse climate and atmosphere and is home to a variety of ecosystems.',
    },
    {
      'name': 'Mars',
      'image': 'assets/images/mars.png',
      'description':
          'Mars, also known as the Red Planet, has a thin atmosphere and is known for its reddish appearance caused by iron oxide.',
    },
    {
      'name': 'Jupiter',
      'image': 'assets/images/jupiter.png',
      'description':
          'Jupiter is the largest planet in the Solar System, with a massive storm called the Great Red Spot, and a thick atmosphere made mostly of hydrogen and helium.',
    },
    {
      'name': 'Saturn',
      'image': 'assets/images/saturn.png',
      'description':
          'Saturn is famous for its beautiful ring system and is the second-largest planet in the Solar System, made mostly of gas.',
    },
    {
      'name': 'Uranus',
      'image': 'assets/images/uranus.png',
      'description':
          'Uranus is a giant ice planet with a unique rotation, as it spins on its side compared to other planets in the Solar System.',
    },
    {
      'name': 'Neptune',
      'image': 'assets/images/neptune.png',
      'description':
          'Neptune is the most distant planet in the Solar System and has a strong wind system and a deep blue color caused by methane in the atmosphere.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Solar System and Sun\'s Structure',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 54, 112),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/solar_bckgr.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: solarSystemContent.length,
              itemBuilder: (context, index) {
                String imagePath = solarSystemContent[index]['image'];
                String description = solarSystemContent[index]['description'];

                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            solarSystemContent[index]['name'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            description,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Close',
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            solarSystemContent[index]['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
