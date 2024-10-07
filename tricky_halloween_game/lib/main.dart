// // // import 'package:flutter/material.dart';
// // // import 'package:audioplayers/audioplayers.dart';
// // // import 'dart:math';

// // // // Team Member Names:
// // // // 1. Your Name
// // // // 2. Partner's Name

// // // void main() {
// // //   runApp(HalloweenGameApp());
// // // }

// // // class HalloweenGameApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Halloween Game',
// // //       home: HalloweenGameScreen(),
// // //     );
// // //   }
// // // }

// // // class HalloweenGameScreen extends StatefulWidget {
// // //   @override
// // //   _HalloweenGameScreenState createState() => _HalloweenGameScreenState();
// // // }

// // // class _HalloweenGameScreenState extends State<HalloweenGameScreen> {
// // //   final _audioPlayer = AudioPlayer();
// // //   final Random _random = Random();
// // //   bool _isCorrectItemClicked = false;
// // //   double _ghostLeft = 100;
// // //   double _ghostTop = 100;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _playBackgroundMusic();
// // //     _startGhostAnimation();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _audioPlayer.dispose();
// // //     super.dispose();
// // //   }

// // //   void _playBackgroundMusic() async {
// // //     await _audioPlayer.play('assets/spooky_music.mp3', isLocal: true);

// // //     // Loop the audio by listening to when it completes
// // //     _audioPlayer.onPlayerCompletion.listen((event) {
// // //       _audioPlayer.resume(); // Restart the music to simulate looping
// // //     });
// // //   }

// // //   void _playSoundEffect(String soundPath) async {
// // //     final player = AudioPlayer();
// // //     await player.play(soundPath, isLocal: true);
// // //   }

// // //   void _startGhostAnimation() {
// // //     Future.delayed(Duration(seconds: 2), () {
// // //       setState(() {
// // //         _ghostLeft = _random.nextDouble() * MediaQuery.of(context).size.width;
// // //         _ghostTop = _random.nextDouble() * MediaQuery.of(context).size.height;
// // //       });
// // //       _startGhostAnimation();
// // //     });
// // //   }

// // //   void _handleItemTap(bool isCorrect) {
// // //     if (isCorrect) {
// // //       _showSuccessMessage();
// // //       _playSoundEffect('assets/success_sound.mp3');
// // //     } else {
// // //       _playSoundEffect('assets/jump_scare.mp3');
// // //     }
// // //   }

// // //   void _showSuccessMessage() {
// // //     setState(() {
// // //       _isCorrectItemClicked = true;
// // //     });
// // //     showDialog(
// // //       context: context,
// // //       builder: (_) => AlertDialog(
// // //         title: Text("You Found It!"),
// // //         content: Text("Congratulations!"),
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () => Navigator.pop(context),
// // //             child: Text("Close"),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.black,
// // //       appBar: AppBar(
// // //         title: Text('Halloween Game'),
// // //         backgroundColor: Colors.deepOrange,
// // //       ),
// // //       body: Stack(
// // //         children: [
// // //           // Animated Ghost as a Trap
// // //           AnimatedPositioned(
// // //             duration: Duration(seconds: 2),
// // //             left: _ghostLeft,
// // //             top: _ghostTop,
// // //             child: GestureDetector(
// // //               onTap: () => _handleItemTap(false),
// // //               child: Image.asset('assets/ghost.jpeg', width: 80),
// // //             ),
// // //           ),
// // //           // Correct Item: Pumpkin
// // //           Positioned(
// // //             left: 200,
// // //             top: 400,
// // //             child: GestureDetector(
// // //               onTap: () => _handleItemTap(true),
// // //               child: Image.asset('assets/pumpkin.png', width: 100),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'dart:math';

// // void main() {
// //   runApp(HalloweenGameApp());
// // }

// // class HalloweenGameApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Halloween Game',
// //       home: HalloweenGameScreen(),
// //     );
// //   }
// // }

// // class HalloweenGameScreen extends StatefulWidget {
// //   @override
// //   _HalloweenGameScreenState createState() => _HalloweenGameScreenState();
// // }

// // class _HalloweenGameScreenState extends State<HalloweenGameScreen> {
// //   final AudioPlayer _audioPlayer = AudioPlayer();
// //   final Random _random = Random();

// //   double _ghostX = 0.0;
// //   double _ghostY = 0.0;
// //   double _batX = 200.0;
// //   double _batY = 100.0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _playBackgroundMusic();
// //     _animateObjects();
// //   }

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   void _playBackgroundMusic() async {
// //     await _audioPlayer.play('assets/spooky_music.mp3', isLocal: true);

// //     // Loop the audio by restarting it when complete
// //     _audioPlayer.onPlayerCompletion.listen((event) {
// //       _audioPlayer.play('assets/spooky_music.mp3', isLocal: true);
// //     });
// //   }

// //   void _playSoundEffect(String path) async {
// //     final player = AudioPlayer();
// //     await player.play(path, isLocal: true);
// //   }

// //   void _animateObjects() {
// //     Future.delayed(Duration(seconds: 2), () {
// //       setState(() {
// //         _ghostX = _random.nextDouble() * 300;
// //         _ghostY = _random.nextDouble() * 500;
// //         _batX = _random.nextDouble() * 300;
// //         _batY = _random.nextDouble() * 500;
// //       });
// //       _animateObjects(); // Repeat to keep animating
// //     });
// //   }

// //   void _handleTrapTap() {
// //     _playSoundEffect('assets/jump_scare.mp3');
// //   }

// //   void _handleCorrectTap() {
// //     _playSoundEffect('assets/success_sound.mp3');
// //     showDialog(
// //       context: context,
// //       builder: (_) => AlertDialog(
// //         title: Text("You Found It!"),
// //         content: Text("Congratulations!"),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: Text("Close"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         title: Text('Halloween Game'),
// //         backgroundColor: Colors.deepOrange,
// //       ),
// //       body: Stack(
// //         children: [
// //           // Floating ghost (trap)
// //           AnimatedPositioned(
// //             duration: Duration(seconds: 2),
// //             left: _ghostX,
// //             top: _ghostY,
// //             child: GestureDetector(
// //               onTap: _handleTrapTap,
// //               child: Image.asset('assets/ghost.jpeg', width: 80),
// //             ),
// //           ),
// //           // Floating pumpkin (trap)
// //           AnimatedPositioned(
// //             duration: Duration(seconds: 2),
// //             left: _batX,
// //             top: _batY,
// //             child: GestureDetector(
// //               onTap: _handleTrapTap,
// //               child: Image.asset('assets/pumpkin.png', width: 80),
// //             ),
// //           ),
// //           // Correct item (pumpkin)
// //           // Positioned(
// //           //   left: 150,
// //           //   top: 400,
// //           //   child: GestureDetector(
// //           //     onTap: _handleCorrectTap,
// //           //     child: Image.asset('assets/pumpkin.png', width: 100),
// //           //   ),
// //           // ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'dart:math';

// // void main() {
// //   runApp(HalloweenGameApp());
// // }

// // class HalloweenGameApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Halloween Game',
// //       home: HalloweenGameScreen(),
// //     );
// //   }
// // }

// // class HalloweenGameScreen extends StatefulWidget {
// //   @override
// //   _HalloweenGameScreenState createState() => _HalloweenGameScreenState();
// // }

// // class _HalloweenGameScreenState extends State<HalloweenGameScreen> {
// //   final AudioPlayer _audioPlayer = AudioPlayer();
// //   final Random _random = Random();
  
// //   double _ghostX = 0.0;
// //   double _ghostY = 0.0;
// //   double _batX = 200.0;
// //   double _batY = 100.0;
// //   double _pumpkinX = 150.0;
// //   double _pumpkinY = 400.0;

// //   bool _isCorrectItemFound = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _playBackgroundMusic();
// //     _animateObjects();
// //   }

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   void _playBackgroundMusic() async {
// //     await _audioPlayer.play('assets/spooky_music.mp3', isLocal: true);
// //     _audioPlayer.onPlayerCompletion.listen((event) {
// //       _audioPlayer.play('assets/spooky_music.mp3', isLocal: true);
// //     });
// //   }

// //   void _playSoundEffect(String path) async {
// //     final player = AudioPlayer();
// //     await player.play(path, isLocal: true);
// //   }

// //   void _animateObjects() {
// //     Future.delayed(Duration(seconds: 2), () {
// //       setState(() {
// //         _ghostX = _random.nextDouble() * 300;
// //         _ghostY = _random.nextDouble() * 500;
// //         _batX = _random.nextDouble() * 300;
// //         _batY = _random.nextDouble() * 500;
// //       });
// //       _animateObjects();
// //     });
// //   }

// //   void _handleTrapTap() {
// //     _playSoundEffect('assets/jump_scare.mp3');
// //   }

// //   void _handleCorrectTap() {
// //     if (!_isCorrectItemFound) {
// //       setState(() {
// //         _isCorrectItemFound = true;
// //       });
// //       _playSoundEffect('assets/success_sound.mp3');
// //       showDialog(
// //         context: context,
// //         builder: (_) => AlertDialog(
// //           title: Text("You Found It!"),
// //           content: Text("Congratulations!"),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: Text("Close"),
// //             ),
// //           ],
// //         ),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         title: Text('Halloween Game'),
// //         backgroundColor: Colors.deepOrange,
// //       ),
// //       body: Stack(
// //         children: [
// //           AnimatedPositioned(
// //             duration: Duration(seconds: 2),
// //             left: _ghostX,
// //             top: _ghostY,
// //             child: GestureDetector(
// //               onTap: _handleTrapTap,
// //               child: Image.asset('assets/ghost.jpeg', width: 80),
// //             ),
// //           ),
// //           AnimatedPositioned(
// //             duration: Duration(seconds: 2),
// //             left: _batX,
// //             top: _batY,
// //             child: GestureDetector(
// //               onTap: _handleTrapTap,
// //               child: Image.asset('assets/pumpkin.png', width: 80),
// //             ),
// //           ),
// //           AnimatedPositioned(
// //             duration: Duration(seconds: 2),
// //             left: _pumpkinX,
// //             top: _pumpkinY,
// //             child: GestureDetector(
// //               onTap: _isCorrectItemFound ? null : _handleCorrectTap,
// //               child: Image.asset('assets/pumpkin.png', width: 100),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'dart:math';

// void main() {
//   runApp(HalloweenGameApp());
// }

// class HalloweenGameApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Halloween Game',
//       home: HalloweenGameScreen(),
//     );
//   }
// }

// class HalloweenGameScreen extends StatefulWidget {
//   @override
//   _HalloweenGameScreenState createState() => _HalloweenGameScreenState();
// }

// class _HalloweenGameScreenState extends State<HalloweenGameScreen> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   final Random _random = Random();
  
//   double _ghostX = 0.0;
//   double _ghostY = 0.0;
//   double _batX = 200.0;
//   double _batY = 100.0;
//   double _pumpkinX = 150.0;
//   double _pumpkinY = 400.0;

//   bool _isCorrectItemFound = false;

//   @override
//   void initState() {
//     super.initState();
//     _playBackgroundMusic();
//     _animateObjects();
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   void _playBackgroundMusic() async {
//     await _audioPlayer.play('assets/spooky_music.mp3', isLocal: true);
//     _audioPlayer.onPlayerCompletion.listen((event) {
//       _audioPlayer.play('assets/spooky_music.mp3', isLocal: true);
//     });
//   }

//   void _playSoundEffect(String path) async {
//     final player = AudioPlayer();
//     await player.play(path, isLocal: true);
//   }

//   void _animateObjects() {
//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         _ghostX = _random.nextDouble() * 300;
//         _ghostY = _random.nextDouble() * 500;
//         _batX = _random.nextDouble() * 300;
//         _batY = _random.nextDouble() * 500;
        
//         // Make the pumpkin (correct item) move as well
//         _pumpkinX = _random.nextDouble() * 300;
//         _pumpkinY = _random.nextDouble() * 500;
//       });
//       _animateObjects(); // Keep animating continuously
//     });
//   }

//   void _handleTrapTap() {
//     _playSoundEffect('assets/jump_scare.mp3');
//   }

//   void _handleCorrectTap() {
//     if (!_isCorrectItemFound) {
//       setState(() {
//         _isCorrectItemFound = true;
//       });
//       _playSoundEffect('assets/success_sound.mp3');
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text("You Found It!"),
//           content: Text("Congratulations!"),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Close"),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Halloween Game'),
//         backgroundColor: Colors.deepOrange,
//       ),
//       body: Stack(
//         children: [
//           // Animated Ghost (Trap)
//           AnimatedPositioned(
//             duration: Duration(seconds: 2),
//             left: _ghostX,
//             top: _ghostY,
//             child: GestureDetector(
//               onTap: _handleTrapTap,
//               child: Image.asset('assets/ghost.jpeg', width: 80),
//             ),
//           ),
//           // Animated Bat (Trap)
//           AnimatedPositioned(
//             duration: Duration(seconds: 2),
//             left: _batX,
//             top: _batY,
//             child: GestureDetector(
//               onTap: _handleTrapTap,
//               child: Image.asset('assets/bat.png', width: 80),
//             ),
//           ),
//           // Moving Pumpkin (Correct Item)
//           AnimatedPositioned(
//             duration: Duration(seconds: 2),
//             left: _pumpkinX,
//             top: _pumpkinY,
//             child: GestureDetector(
//               onTap: _isCorrectItemFound ? null : _handleCorrectTap,
//               child: Image.asset('assets/pumpkin.png', width: 100),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

void main() {
  runApp(HalloweenGameApp());
}

class HalloweenGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halloween Game',
      home: HalloweenGameScreen(),
    );
  }
}

class HalloweenGameScreen extends StatefulWidget {
  @override
  _HalloweenGameScreenState createState() => _HalloweenGameScreenState();
}

class _HalloweenGameScreenState extends State<HalloweenGameScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Random _random = Random();
  
  double _ghostX = 0.0;
  double _ghostY = 0.0;
  double _batX = 200.0;
  double _batY = 100.0;
  double _pumpkinX = 150.0;
  double _pumpkinY = 400.0;

  bool _isCorrectItemFound = false;
  int _attempts = 5;  // Number of attempts allowed

  @override
  void initState() {
    super.initState();
    _playBackgroundMusic();
    _animateObjects();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playBackgroundMusic() async {
    await _audioPlayer.play('assets/spooky_music.mp3', isLocal: true);
    _audioPlayer.onPlayerCompletion.listen((event) {
      _audioPlayer.play('assets/spooky_music.mp3', isLocal: true);
    });
  }

  void _playSoundEffect(String path) async {
    final player = AudioPlayer();
    await player.play(path, isLocal: true);
  }

  void _animateObjects() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _ghostX = _random.nextDouble() * 300;
        _ghostY = _random.nextDouble() * 500;
        _batX = _random.nextDouble() * 300;
        _batY = _random.nextDouble() * 500;
        
        // Make the pumpkin (correct item) move as well
        _pumpkinX = _random.nextDouble() * 300;
        _pumpkinY = _random.nextDouble() * 500;
      });
      _animateObjects();
    });
  }

  void _handleTrapTap() {
    if (_attempts > 0 && !_isCorrectItemFound) {
      setState(() {
        _attempts -= 1;
      });
      _playSoundEffect('assets/jump_scare.mp3');

      if (_attempts == 0) {
        _showGameOverDialog();
      }
    }
  }

  void _handleCorrectTap() {
    if (!_isCorrectItemFound && _attempts > 0) {
      setState(() {
        _isCorrectItemFound = true;
      });
      _playSoundEffect('assets/success_sound.mp3');
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("You Found It!"),
          content: Text("Congratulations! You found the correct item."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        ),
      );
    }
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Game Over"),
        content: Text("You've run out of attempts. Better luck next time!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Halloween Game'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Stack(
        children: [
          // Display remaining attempts
          Positioned(
            top: 20,
            right: 20,
            child: Text(
              'Attempts left: $_attempts',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          // Animated Ghost (Trap)
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            left: _ghostX,
            top: _ghostY,
            child: GestureDetector(
              onTap: _attempts > 0 && !_isCorrectItemFound ? _handleTrapTap : null,
              child: Image.asset('assets/ghost.jpeg', width: 80),
            ),
          ),
          // Animated Bat (Trap)
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            left: _batX,
            top: _batY,
            child: GestureDetector(
              onTap: _attempts > 0 && !_isCorrectItemFound ? _handleTrapTap : null,
              child: Image.asset('assets/bat.png', width: 80),
            ),
          ),
          // Moving Pumpkin (Correct Item)
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            left: _pumpkinX,
            top: _pumpkinY,
            child: GestureDetector(
              onTap: _attempts > 0 && !_isCorrectItemFound ? _handleCorrectTap : null,
              child: Image.asset('assets/pumpkin.png', width: 100),
            ),
          ),
        ],
      ),
    );
  }
}
