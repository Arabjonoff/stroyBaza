import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroy_baza/src/api/repository.dart';
import 'package:stroy_baza/src/bloc/cart/cart_bloc.dart';
import 'package:stroy_baza/src/dialog/toast_dialog.dart';
import 'package:stroy_baza/src/model/order/order_model.dart';
import 'package:stroy_baza/src/model/parametrs/product_model.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/theme/app_style.dart';
import 'package:stroy_baza/src/ui/cart/cart_screen.dart';
import 'package:stroy_baza/src/widgets/button_widget.dart';
import 'package:stroy_baza/src/widgets/text_field_widget.dart';
import 'package:badges/badges.dart' as badges;

class CategoryDetailScreen extends StatefulWidget {
  final ProductResult data;
  final List img;
  const CategoryDetailScreen({super.key, required this.data, required this.img,});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}
class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  int selectedIndex = 0,count = 1,price = -1,color = -1,productId=0;
  String selectPrice = '';
  bool isButton = true;
  final Repository _repository = Repository();
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    cartBloc.getCartAll();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 314.h,
                    child: PageView.builder(
                      onPageChanged: (index){
                        selectedIndex = index;
                        setState(() {});
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (ctx,index){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8),
                        width: 350.w,
                        height: 314.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CachedNetworkImage(imageUrl: widget.img[index],fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                          errorWidget: (context, url, error) => const Center(child: Icon(Icons.image)),
                        )
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Qoldiq: ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("${widget.data.count}")
                          ],
                        ),
                        Row(
                          children: [
                            Text("Kategoriyasi: ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("${widget.data.category.name}")
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextFieldWidget(
                    onTap: (){
                      setState(() {
                      });
                      price = 0;
                      selectPrice = widget.data.unitPrice;
                    },
                    controller: controller,readOnly:true,isBorder: price==0?true:false,prefix: Padding(padding: EdgeInsets.only(top: 14.w), child: Text("Oddiy: ${widget.data.unitPrice}",style: const TextStyle(fontWeight: FontWeight.bold),),
                  ),),
                  TextFieldWidget(
                    onTap: (){
                      setState(() {
                      });
                      price = 1;
                      selectPrice = widget.data.wholesalePrice;
                    },
                    controller: controller,readOnly:true,isBorder: price==1?true:false,prefix: Padding(
                    padding: EdgeInsets.only(top: 14.w),
                    child: Text("Optom: ${widget.data.wholesalePrice}",style: const TextStyle(fontWeight: FontWeight.bold),),
                  ),),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0.w),
                    child: Text("Ranglari:",style: AppStyle.headLine3(Colors.black),),
                  ),
                  ListView.builder(
                    // ignore: prefer_const_constructors
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.data.productCounts.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                        });
                        color = index;
                        productId = widget.data.productCounts[index].id;
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10.h,left: 16.w),
                        margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4.h),
                        width: MediaQuery.of(context).size.width,
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: index == color?AppColors.blue:Colors.grey)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${widget.data.productCounts[index].color.name} - ",style: AppStyle.headLine3(Colors.black),),
                            Text(widget.data.productCounts[index].size.name,style: AppStyle.headLine3(Colors.black),),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
          if (isButton) ButtonWidget(
              height: 64, onTap: ()async{
                try{
                  OrderModel item = OrderModel(
                      id: productId,
                      count: count,
                      price: num.parse(selectPrice),
                      image: widget.img[0],
                      name: widget.data.name,
                      priceType: price==0?"Oddiy":"Optom"
                  );
                  cartBloc.saveCart(item);
                  setState(() {
                    isButton = false;
                  });
                }catch(e){
                  ToastDialog.showErrorToast(context, e.toString());
                }
          }, text: "Savatga qo’shish", color: AppColors.blue, textColor: Colors.white) else Container(
            margin: EdgeInsets.symmetric(horizontal: 14.w),
            height: 64.h,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: 64.r,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Icon(Icons.clear,size: 34,color: Colors.white,),
                  ),
                    onTap: (){
                    cartBloc.delete(widget.data.id);
                      setState(() {
                        isButton = true;
                      });

                    },
                ),
                SizedBox(width: 4.w,),
                Expanded(child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          if(count <=1){

                          }else{
                            count --;
                            OrderModel item = OrderModel(
                                id: productId,
                                count: count,
                                price: num.parse(selectPrice),
                                image: widget.img[0],
                                name: widget.data.name,
                                priceType: price==0?"Oddiy":"Optom"
                            );
                            cartBloc.saveCart(item);
                          }
                          setState(() {});
                        },
                        child: Container(
                          width: 54.w,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),topLeft: Radius.circular(15)),
                            border: Border(
                              right: BorderSide(
                                  color: Colors.black
                              )
                            )
                          ),
                          child: const Icon(Icons.remove,size: 34,),
                        ),
                      ),
                      Expanded(child: Center(child: Text('$count',style: AppStyle.headLine2(Colors.black),))),
                      InkWell(
                        onTap: (){
                          count ++;
                          setState(() {});
                          OrderModel item = OrderModel(
                              id: productId,
                              count: count,
                              price: num.parse(selectPrice),
                              image: widget.img[0],
                              name: widget.data.name,
                              priceType: price==0?"Oddiy":"Optom"
                          );
                          cartBloc.saveCart(item);
                        },
                        child: Container(
                          width: 54.w,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topRight: Radius.circular(15)),
                              border: Border(
                                  left: BorderSide(
                                      color: Colors.black
                                  )
                              )
                          ),
                          child: const Icon(Icons.add,size: 34,),
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(width: 4.w,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx){
                      return CartScreen();
                    }));
                  },
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -20.r, end: -8.r),
                    showBadge: true,
                    ignorePointer: false,
                    badgeContent: StreamBuilder<List<OrderModel>>(
                      stream: cartBloc.getCartStream,
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return Text(snapshot.data!.length.toString(),style: const TextStyle(color: Colors.white,fontSize: 22),);
                        }
                        return const Text('1',style: TextStyle(color: Colors.white,fontSize: 22),);
                      }
                    ),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Colors.red,
                      padding: EdgeInsets.all(8),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: 64.r,
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(Icons.shopping_bag_rounded,size: 34,color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 34.h,)
        ],
      ),
    );
  }
  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive
            ? 10:8.0,
        width: isActive
            ? 12:8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
              color: AppColors.blue,
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(
                0.0,
                0.0,
              ),
            )
                : const BoxShadow(
              color: Colors.transparent,
            )
          ],
          shape: BoxShape.circle,
          color: isActive ? AppColors.blue : const Color(0XFFEAEAEA),
        ),
      ),
    );
  }
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }
}
