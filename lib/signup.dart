import 'package:flutter/material.dart';

void bottomSheetSignIn1(BuildContext context) {
  bool maleSelected = false;
  bool femaleSelected = false;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 35, 19, 255), // Top color
                  Color.fromARGB(255, 27, 15, 193), // Bottom color
                ],
              ),
              //Bottomsheet corner radius
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            height: MediaQuery.of(context).size.height * .9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Text('Creating Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 20.0),
                  //Progress Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: LinearProgressIndicator(
                      value: 0.25, // Set the progress value (0.0 - 1.0)
                      backgroundColor: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blue, // Set the progress color
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0, bottom: 20.0),
                    child: Text('Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 72, 18, 255),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 3.0),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 72, 18, 255),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 3.0),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Gender:', style: TextStyle(color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              maleSelected = !maleSelected;
                              femaleSelected = false;
                            });
                          },
                          child: Row(
                            children: [
                              Text('Male',
                                  style: TextStyle(color: Colors.black)),
                              if (maleSelected)
                                Icon(Icons.check, color: Colors.white),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            minimumSize: Size(20, 40),
                            backgroundColor: maleSelected
                                ? Color.fromARGB(255, 0, 194, 242)
                                : Colors.white,
                            elevation: 5, // Add a shadow
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              femaleSelected = !femaleSelected;
                              maleSelected = false;
                            });
                          },
                          child: Row(
                            children: [
                              Text('Female',
                                  style: TextStyle(color: Colors.black)),
                              if (femaleSelected)
                                Icon(Icons.check, color: Colors.white),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            minimumSize: Size(20, 40),
                            backgroundColor: femaleSelected
                                ? Color.fromARGB(255, 255, 82, 226)
                                : Colors.white,
                            elevation: 5, // Add a shadow
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      bottomSheetSignIn2(context);
                    },
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(200, 40),
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 255, 16, 219),
                      elevation: 5, // Add a shadow
                    ),
                  ),
                  SizedBox(height: 80.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Already have an account?'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

void bottomSheetSignIn2(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 35, 19, 255), // Top color
              Color.fromARGB(255, 27, 15, 193), // Bottom color
            ],
          ),
          //Bottomsheet corner radius
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        height: MediaQuery.of(context).size.height * .9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Text('Creating Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
              ),
              SizedBox(height: 20.0),

              //Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: LinearProgressIndicator(
                  value: 0.5, // Set the progress value (0.0 - 1.0)
                  backgroundColor: Colors.black,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue, // Set the progress color
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text('Enter your Email',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white)),
              ),
              Text('With this we can notify you for trends and latest updates.',
                  style: TextStyle(fontSize: 10, color: Colors.white)),
              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 72, 18, 255),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 3.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              //----or----
              Text(
                  '----------------------------- OR -----------------------------',
                  style: TextStyle(color: Colors.white)),

              //Icons in Socmed
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset('assets/facebookicon.png',
                        width: 30, height: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset('assets/googleicon.png',
                        width: 30, height: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset('assets/instagramicon.png',
                        width: 30, height: 30),
                  ),
                ],
              ),
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  bottomSheetArtist(context);
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(200, 40),
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 255, 16, 219),
                  elevation: 5, // Add a shadow
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Previous', style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(height: 30.0),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Already have an account?'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void bottomSheetArtist(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 35, 19, 255), // Top color
              Color.fromARGB(255, 27, 15, 193), // Bottom color
            ],
          ),
          //Bottomsheet corner radius
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        height: MediaQuery.of(context).size.height * .9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Text('Creating Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
              ),
              SizedBox(height: 20.0),

              //Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: LinearProgressIndicator(
                  value: 0.75, // Set the progress value (0.0 - 1.0)
                  backgroundColor: Colors.black,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue, // Set the progress color
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text('The kind of Artist',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white)),
              ),
              Text('Which style you prefer? Choose 1 or more!',
                  style: TextStyle(fontSize: 10, color: Colors.white)),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle male selection
                      },
                      child: Text('Sketching'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle female selection
                      },
                      child: Text('Anime'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle male selection
                      },
                      child: Text('Pixel Art'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle female selection
                      },
                      child: Text('Realism'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle male selection
                      },
                      child: Text('Architecture'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle female selection
                      },
                      child: Text('Doodle'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle male selection
                      },
                      child: Text('Comic Style'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle female selection
                      },
                      child: Text('3D Art'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(20, 40),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 5, // Add a shadow
                      ),
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () {
                  bottomSheetComplete(context);
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(200, 40),
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 255, 16, 219),
                  elevation: 5, // Add a shadow
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Previous', style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(height: 20.0),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Already have an account?'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void bottomSheetComplete(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 35, 19, 255), // Top color
              Color.fromARGB(255, 27, 15, 193), // Bottom color
            ],
          ),
          //Bottomsheet corner radius
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        height: MediaQuery.of(context).size.height * .9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Text('Creating Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
              ),
              SizedBox(height: 20.0),

              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text('Complete!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white)),
              ),
              SizedBox(height: 20.0),
              //Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: LinearProgressIndicator(
                  value: 1, // Set the progress value (0.0 - 1.0)
                  backgroundColor: Colors.black,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue, // Set the progress color
                  ),
                ),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  bottomSheetArtist(context);
                },
                child: Text('Finish'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(200, 40),
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 255, 16, 219),
                  elevation: 5, // Add a shadow
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Previous', style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      );
    },
  );
}
