import 'package:clot/constants/AppColor.dart';
import 'package:clot/widgets/btn.dart';
import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  bool secondScreen = false;
  bool isMale = true; 
  
  final List<String> ageRanges = [
    'Under 18', '18-24', '25-34', '35-44', '45-54', '55-64', '65 or older'
  ];
  
  String? selectedAgeRange;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This ensures the button moves up when the keyboard appears
      resizeToAvoidBottomInset: true, 
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFF4F4F4),
            child: IconButton(
              onPressed: () {
                if (secondScreen) {
                  setState(() => secondScreen = false);
                } else {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              
              if (!secondScreen) ...[
                _buildHeader('Reset Password'),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppColor.inputDecoration('Email Address'),
                ),
              ] else ...[
                _buildHeader('Tell us about yourself'),
                const SizedBox(height: 32),
                const Text(
                  'Who do you identify as?', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
                ),
                const SizedBox(height: 16),
                
                // Gender Selection Cards
                Row(
                  children: [
                    _selectionCard('Male', isMale, () => setState(() => isMale = true)),
                    const SizedBox(width: 15),
                    _selectionCard('Female', !isMale, () => setState(() => isMale = false)),
                  ],
                ),
                
                const SizedBox(height: 32),
                const Text(
                  'How old are you?', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
                ),
                const SizedBox(height: 16),
                
                // Age Dropdown
                DropdownButtonFormField<String>(
                  value: selectedAgeRange,
                  hint: const Text("Select Age Range"),
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF4F4F4),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  items: ageRanges.map((String range) {
                    return DropdownMenuItem<String>(
                      value: range,
                      child: Text(range, style: const TextStyle(fontSize: 15)),
                    );
                  }).toList(),
                  onChanged: (newValue) => setState(() => selectedAgeRange = newValue),
                ),
              ],
            ],
          ),
        ),
      ),
      // Sticky Bottom Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 23, 
          right: 23, 
          bottom: MediaQuery.of(context).viewInsets.bottom + 23
        ),
        child: Btn(
          onPressed: () {
            if (!secondScreen) {
              if (_emailController.text.isNotEmpty) {
                setState(() => secondScreen = true);
              }
            } else {
              // Final Action (e.g., Navigate to Home or Show Success)
              print("Finished: Gender Male: $isMale, Age: $selectedAgeRange");
            }
          }, 
          text: secondScreen ? 'Finish' : 'Continue'
        ),
      ),
    );
  }

  // Header Text Helper
  Widget _buildHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        color: AppColor.textColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      ),
    );
  }

  // Reusable Gender Selection Card
  Widget _selectionCard(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.btnBackgroundColor : const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}