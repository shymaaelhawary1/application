import 'package:flutter/material.dart';
import 'package:restaurant/data.dart';
import 'package:fluttertoast/fluttertoast.dart';



void main() {
  runApp(RestaurantReviewApp());
}

class RestaurantReviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Review',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RestaurantReviewPage(),
    );
  }
}

class RestaurantReviewPage extends StatefulWidget {
  @override
  _RestaurantReviewPageState createState() => _RestaurantReviewPageState();
}

class _RestaurantReviewPageState extends State<RestaurantReviewPage> {
  int rating = 0;

  TextEditingController feedbackController =
      TextEditingController(text: 'Your feedback is valuable to us. Tell us about your experience.');

  String reasonValue = 'Poor Service';
  TextEditingController descriptionController = TextEditingController();

  void submitReview() {
    DatabaseProvider.insertReview(
      rating: rating,
      feedback: feedbackController.text,
      reason: reasonValue,
      description: descriptionController.text,
    );
    print('Rating: $rating');
    print('Feedback: ${feedbackController.text}');
    print('Reason: $reasonValue');
    print('Description: ${descriptionController.text}');

    // Show a success message
    Fluttertoast.showToast(
      msg: 'Review submitted successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Your Review')),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://img.lovepik.com/png/20231104/smiley-face-vector-smiling-cartoon-character-smiley-face-Smile-illustration_495609_wh860.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'Rate Us',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  InkWell(
                    onTap: () {
                      setState(() {
                        rating = i;
                      });
                    },
                    child: Icon(
                      Icons.star,
                      size: 40.0,
                      color: i <= rating ? Colors.yellow : Colors.grey,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: feedbackController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                labelText: 'Send Your Feedback',
                hintText: 'Your feedback is valuable to us. Tell us about your experience.',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: reasonValue,
              onChanged: (value) {
                setState(() {
                  reasonValue = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'Poor Service',
                  child: Text('Poor Service'),
                ),
                DropdownMenuItem(
                  value: 'Food Quality',
                  child: Text('Food Quality'),
                ),
                DropdownMenuItem(
                  value: 'Prices',
                  child: Text('Prices'),
                ),
                // You can add more items as needed
              ],
              decoration: InputDecoration(
                labelText: 'Select Reason',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: descriptionController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: submitReview,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}