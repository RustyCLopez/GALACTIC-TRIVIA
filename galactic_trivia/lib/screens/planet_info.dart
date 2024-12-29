import 'package:flutter/material.dart';

class PlanetInfoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> planets = [
    // Planet data remains unchanged
    {
      'name': 'Sun',
      'avatar': 'assets/images/sun.png',
      'Equatorial Diameter': '1.39 M km',
      'Mass': '1.989 × 10²⁴ kg',
      'galacticCenterDistance': '27,000 LY',
      'rotationPeriod': '24.47 days',
      'galacticOrbitPeriod': '225 million years',
      'surfaceGravity': '274 m/s²',
      'surfaceTemperature': '5,500°C',
      'description':
          'The Sun is the central star of our solar system and the source of light and energy for all the planets. It is a massive ball of burning gases, primarily hydrogen and helium, undergoing nuclear fusion. Its strong gravitational pull holds the planets in orbit. The Sun\'s surface temperature is around 5,500°C, with its core reaching up to 15 million°C.',
    },
    {
      'name': 'Mercury',
      'avatar': 'assets/images/mercury.png',
      'Equatorial Diameter': '4,880 km',
      'Mass': '3.3011 × 10²³ kg',
      'galacticCenterDistance': '28,000 LY',
      'rotationPeriod': '58.6 Earth days',
      'galacticOrbitPeriod': '225 million years',
      'surfaceGravity': '3.7 m/s²',
      'surfaceTemperature': '430°C (day) / -180°C (night)',
      'description':
          'Mercury is the closest planet to the Sun, and its surface experiences extreme temperature fluctuations. Due to its proximity to the Sun, it has no atmosphere to retain heat, causing temperatures to range from 430°C during the day to -180°C at night. Its day lasts longer than its year, as it rotates on its axis very slowly. Despite its small size, it has a dense metallic core.',
    },
    {
      'name': 'Venus',
      'avatar': 'assets/images/venus.png',
      'Equatorial Diameter': '12,104 km',
      'Mass': '4.867 × 10²⁴ kg',
      'galacticCenterDistance': '28,000 LY',
      'rotationPeriod': '243 Earth days (retrograde rotation)',
      'galacticOrbitPeriod': '225 million years',
      'surfaceGravity': '8.87 m/s²',
      'surfaceTemperature': '465°C (constant)',
      'description':
          'Venus is often called Earth\'s "sister planet" due to its similar size, but it has a very hostile environment. It has a thick atmosphere of carbon dioxide, which traps heat and makes the surface temperature a constant 465°C. The planet rotates slowly and in the opposite direction to most planets, causing its day to be longer than its year. Venus is known for its sulfuric acid clouds and extreme greenhouse effect.',
    },
    {
      'name': 'Earth',
      'avatar': 'assets/images/earth.png',
      'Equatorial Diameter': '12,742 km',
      'Mass': '5.972 × 10²⁴ kg',
      'galacticCenterDistance': '28,000 LY',
      'rotationPeriod': '23.93 hours',
      'galacticOrbitPeriod': '225 million years',
      'surfaceGravity': '9.81 m/s²',
      'surfaceTemperature': '15°C (average)',
      'description':
          'Earth is the only known planet to support life, with a perfect balance of water, atmosphere, and temperature. It has a variety of ecosystems, from polar ice caps to tropical rainforests, which support a rich diversity of life. Earth\'s atmosphere protects life from harmful solar radiation and helps regulate temperature. Its surface is covered by 70% water and 30% land.',
    },
    {
      'name': 'Mars',
      'avatar': 'assets/images/mars.png',
      'Equatorial Diameter': '6,779 km',
      'Mass': '6.4171 × 10²³ kg',
      'galacticCenterDistance': '28,000 LY',
      'rotationPeriod': '24.6 hours',
      'galacticOrbitPeriod': '225 million years',
      'surfaceGravity': '3.71 m/s²',
      'surfaceTemperature': '-60°C (average)',
      'description':
          'Mars, also known as the Red Planet, has a reddish appearance due to iron oxide (rust) on its surface. It has a thin atmosphere, mainly carbon dioxide, and is home to the largest volcano and canyon in the solar system. Evidence suggests that Mars once had liquid water, and scientists are studying it to determine its potential to support life. Its average surface temperature is around -60°C.',
    },
    {
      'name': 'Jupiter',
      'avatar': 'assets/images/jupiter.png',
      'Equatorial Diameter': '139,820 km',
      'Mass': '1.898 × 10²⁷ kg',
      'galacticCenterDistance': '28,000 LY',
      'rotationPeriod': '9.93 hours',
      'galacticOrbitPeriod': '225 million years',
      'surfaceGravity': '24.79 m/s²',
      'surfaceTemperature': '-145°C (cloud tops)',
      'description':
          'Jupiter is the largest planet in our solar system, known for its Great Red Spot, a massive storm that has been raging for centuries. It is a gas giant made mostly of hydrogen and helium, with a thick atmosphere of clouds and storms. Jupiter has 79 known moons, including Ganymede, the largest moon in the solar system. Its strong magnetic field is one of the strongest in the solar system.',
    },
    {
      'name': 'Saturn',
      'avatar': 'assets/images/saturn.png',
      'Equatorial Diameter': '116,460 km',
      'Mass': '5.683 × 10²⁶ kg',
      'galacticCenterDistance': '28,000 LY',
      'rotationPeriod': '10.7 hours',
      'galacticOrbitPeriod': '225 million years',
      'surfaceGravity': '10.44 m/s²',
      'surfaceTemperature': '-178°C (cloud tops)',
      'description':
          'Saturn is famous for its stunning ring system, which is made of ice particles and rocky debris. It is the second-largest planet in the solar system and a gas giant composed mainly of hydrogen and helium. Saturn has at least 82 moons, with Titan being the largest and most Earth-like. Despite its massive size, Saturn has the lowest density of any planet in the solar system.',
    },
    {
      'name': 'Uranus',
      'avatar': 'assets/images/uranus.png',
      'Equatorial Diameter': '50,724 km',
      'Mass': '8.681 × 10²⁵ kg',
      'galacticCenterDistance': '28,000 LY',
      'rotationPeriod': '17.24 hours',
      'galacticOrbitPeriod': '225 million years',
      'surfaceGravity': '8.69 m/s²',
      'surfaceTemperature': '-197°C',
      'description':
          'Uranus is an ice giant with a unique tilted axis, which makes its poles point almost directly at the Sun. Its atmosphere is composed mainly of hydrogen, helium, and icy compounds like water, methane, and ammonia. Uranus has 27 known moons and faint ring systems. It has extreme seasons, with each pole experiencing 42 years of continuous sunlight or darkness.',
    },
    {
      'name': 'Neptune',
      'avatar': 'assets/images/neptune.png',
      'Equatorial Diameter': '49,244 km',
      'Mass': '1.024 × 10²⁶ kg',
      'galacticCenterDistance': '28,000 LY',
      'rotationPeriod': '16.11 hours',
      'galacticOrbitPeriod': '225 million years',
      'surfaceGravity': '11.15 m/s²',
      'surfaceTemperature': '-200°C',
      'description':
          'Neptune is the farthest planet from the Sun and is known for its striking blue color due to methane in its atmosphere. It has the strongest winds in the solar system, reaching speeds of over 2,000 km/h. Neptune has 14 known moons, with Triton being the largest. The planet’s intense storms and strong magnetic field make it one of the most dynamic planets in the solar system.',
    },
    {
      'name': 'Pluto',
      'avatar': 'assets/images/pluto.png',
      'Equatorial Diameter': '2,377 km',
      'Mass': '1.303 × 10²² kg',
      'galacticCenterDistance': '28,000 LY',
      'rotationPeriod': '6.39 days',
      'galacticOrbitPeriod': '248 years',
      'surfaceGravity': '0.62 m/s²',
      'surfaceTemperature': '-225°C',
      'description':
          'Pluto, a dwarf planet, has a highly elliptical orbit and is known for its icy and rocky composition. It has five moons, the largest being Charon. Pluto’s surface is covered in frozen nitrogen, and it has a very thin atmosphere. The planet’s orbital path crosses that of Neptune, though they never collide due to gravitational resonance.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Planet Info',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bckg04.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: planets.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(planets[index]['avatar']),
                  radius: 30,
                ),
                title: Text(
                  planets[index]['name'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                subtitle: Text(
                  'Tap to learn more',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanetDetailsScreen(
                        planetName: planets[index]['name'],
                        planetAvatar: planets[index]['avatar'],
                        planetDiameter: planets[index]['Equatorial Diameter'],
                        planetMass: planets[index]['Mass'],
                        planetGalacticCenterDistance: planets[index]
                            ['galacticCenterDistance'],
                        planetRotationPeriod: planets[index]['rotationPeriod'],
                        planetGalacticOrbitPeriod: planets[index]
                            ['galacticOrbitPeriod'],
                        planetSurfaceGravity: planets[index]['surfaceGravity'],
                        planetSurfaceTemperature: planets[index]
                            ['surfaceTemperature'],
                        planetDescription: planets[index]['description'],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class PlanetDetailsScreen extends StatelessWidget {
  final String planetName;
  final String planetAvatar;
  final String planetDiameter;
  final String planetMass;
  final String planetGalacticCenterDistance;
  final String planetRotationPeriod;
  final String planetGalacticOrbitPeriod;
  final String planetSurfaceGravity;
  final String planetSurfaceTemperature;
  final String planetDescription;

  const PlanetDetailsScreen({
    Key? key,
    required this.planetName,
    required this.planetAvatar,
    required this.planetDiameter,
    required this.planetMass,
    required this.planetGalacticCenterDistance,
    required this.planetRotationPeriod,
    required this.planetGalacticOrbitPeriod,
    required this.planetSurfaceGravity,
    required this.planetSurfaceTemperature,
    required this.planetDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          planetName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 54, 112),
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg8.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(planetAvatar),
                    radius: 50,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Details about $planetName:',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 20),
                _buildDetailRow('Equatorial Diameter', planetDiameter),
                _buildDetailRow('Mass', planetMass),
                _buildDetailRow(
                    'Galactic Center Distance', planetGalacticCenterDistance),
                _buildDetailRow('Rotation Period', planetRotationPeriod),
                _buildDetailRow(
                    'Galactic Orbit Period', planetGalacticOrbitPeriod),
                _buildDetailRow('Surface Gravity', planetSurfaceGravity),
                _buildDetailRow(
                    'Surface Temperature', planetSurfaceTemperature),
                const SizedBox(height: 20),
                Text(
                  'Description:',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  planetDescription,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
