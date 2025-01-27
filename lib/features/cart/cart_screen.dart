import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/cart/widget/cart_item_widget.dart';
import 'package:ecommerce_app/features/home_screen/widgets/title_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpace(20),
              CartItemWidget(),
              CartItemWidget(),
              CartItemWidget(),
              HeightSpace(20),
              TitlePriceWidget(title: "Sub Total", price: "1190 \$"),
              TitlePriceWidget(title: "VAT (16 %)", price: "1190 \$"),
              TitlePriceWidget(title: "Shipping Fees", price: "1190 \$"),
              const HeightSpace(20),
              Divider(),
              const HeightSpace(20),
              TotalPriceWidget(title: "Total", price: "1190 \$"),
              const HeightSpace(20),
              PrimayButtonWidget(
                buttonText: "Go To Checkout",
                trailingIcon: Icon(
                  Icons.payment,
                  color: Colors.white,
                  size: 16.sp,
                ),
                onPress: () {},
              ),
              const HeightSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
