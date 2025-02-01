import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/utils/animated_snack_dialog.dart';
import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_state.dart';
import 'package:ecommerce_app/features/home_screen/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  final ProductsModel product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpace(20),
                  Container(
                    width: 341.w,
                    height: 341.h,
                    child: CachedNetworkImage(imageUrl: product.image ?? ""),
                  ),
                  const HeightSpace(12),
                  Text(
                    product.title ?? "",
                    style: AppStyles.black16w500Style.copyWith(fontSize: 24.sp),
                  ),
                  const HeightSpace(8),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18.sp,
                      ),
                      const WidthSpace(2),
                      product.rating != null
                          ? Text(
                              "${product.rating!.rate}/5",
                              style: AppStyles.black15BoldStyle.copyWith(
                                  decoration: TextDecoration.underline),
                            )
                          : const SizedBox.shrink(),
                      const WidthSpace(2),
                      product.rating != null
                          ? Text(
                              "(${product.rating!.count} Reviews)",
                              style: AppStyles.grey12MediumStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 15.sp),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const HeightSpace(8),
                  Text(
                    product.description ?? "",
                    style: AppStyles.grey12MediumStyle.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.normal),
                  ),
                  const HeightSpace(150),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Divider(),
                  HeightSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: AppStyles.grey12MediumStyle
                                .copyWith(fontSize: 16.sp),
                          ),
                          HeightSpace(4),
                          Text(
                            "${product.price} \$",
                            style: AppStyles.black16w500Style.copyWith(
                                fontSize: 24.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const WidthSpace(16),
                      BlocConsumer<CartCubit, CartState>(
                        listener: (context, state) {
                          if (state is SuccessAddingToCarts) {
                            showAnimatedSnackDialog(context,
                                message:
                                    "Product Added Successfully To Our Cart",
                                type: AnimatedSnackBarType.success);
                          }
                        },
                        builder: (context, state) {
                          if (state is AddingToCart) {
                            return PrimayButtonWidget(
                              width: MediaQuery.of(context).size.width * 0.5,
                              isLoading: true,
                              buttonText: "Add To Cart",
                              onPress: () {},
                            );
                          }
                          return PrimayButtonWidget(
                            width: MediaQuery.of(context).size.width * 0.5,
                            buttonText: "Add To Cart",
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                            onPress: () {
                              context
                                  .read<CartCubit>()
                                  .addingToCart(product: product, quantity: 1);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const HeightSpace(8),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
