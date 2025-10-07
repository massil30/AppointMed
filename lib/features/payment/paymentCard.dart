import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/textfield.dart';
import 'package:responsivity/components/buttons.dart';
import 'package:responsivity/utils/theme_extention.dart';
import 'package:u_credit_card/u_credit_card.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController holderController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Card"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: CreditCardUi(
                  cardHolderFullName: 'John Doe',
                  cardNumber: '*************',
                  validThru: 'mm/yy',
                  topLeftColor: context.primary,
                  bottomRightColor: context.primary.withOpacity(0.5),
                  cardType: CardType.other,
                ),
              ),
              SizedBox(height: 24.sp),
              CustomTextField(
                controller: holderController,
                hint: "Lionel Messi",
                label: "Card Holder Name",
              ),
              const SizedBox(height: 18),

              CustomTextField(
                controller: numberController,
                hint: "000 000 000 00",
                label: "Card Number",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: expiryController,
                          hint: "04/28",
                          label: "Expiry Date",
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        CustomTextField(
                          maxLines: 1,
                          controller: cvvController,
                          hint: "0000",
                          label: "CVV",
                          keyboardType: TextInputType.number,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              CustomButton(
                text: "Add Card",
                onPressed: () {
                  // Save card logic
                },
                width: double.infinity,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
