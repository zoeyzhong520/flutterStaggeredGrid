import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaper_app/Tools/full_screen_image_page.dart';

class HomePage extends StatelessWidget {
  // 图片数组
  final List imgList = [
    "https://img2.baidu.com/it/u=1858491136,2859208585&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=799"
    "https://img2.baidu.com/it/u=4172004079,2733524534&fm=26&fmt=auto",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fbfaa3e046f08286b933092b163ceaaa7f518b186142f2b-Edz4DO_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634800921&t=0f489fcc7bf682a39d55f2f3d52213a3",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201409%2F11%2F20140911024403_SjUNS.thumb.700_0.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634800921&t=eae9ee90edd2388456c06abed110be79",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fgss0.baidu.com%2F-Po3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2F0dd7912397dda1445eb535b0bfb7d0a20cf48670.jpg&refer=http%3A%2F%2Fgss0.baidu.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634800921&t=fc74f6f07e358c384788c4c20167df80",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201608%2F10%2F20160810082019_nZfBF.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634800921&t=7162f1550ca10200bec54209f8721114",
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F014c055a4d8d70a801206ed3fe7ce5.jpg%402o.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634800921&t=5a77dfabe9238e300e96ace01a6ca089',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201809%2F24%2F20180924122358_zwNXn.thumb.700_0.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634800921&t=6081dd5d4472eda1d6cebc1b65a2c750',
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F31aa510768d7523a11ca134f847630bf7c7d719eb93eb-sk7d9N_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634800921&t=65df12d8fcb5810d86def83e81546c7e",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01dcb75a4d8d73a801219741b755f0.jpg%401280w_1l_2o_100sh.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634800921&t=05469c31667eeae7da3ee6293db00f2d",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2F2f%2Faf%2Fdb%2F2fafdb262c719550380115d9127edb46.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634800921&t=c84d5afe41988186bb55cf35fb168d48",
    "https://img1.baidu.com/it/u=3577001010,2265256872&fm=26&fmt=auto",
    "https://img0.baidu.com/it/u=3442910649,3934501150&fm=15&fmt=auto",
    "https://img2.baidu.com/it/u=2361805512,1681388566&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=889"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: imgList.length,
        itemBuilder: (context, i) {
          return itemWidget(context, i);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index == 0 ? 2.5 : 3),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }

  // 瀑布流每个子项
  Widget itemWidget(context, int index) {
    String imgPath = imgList[index];
    return new Material(
      elevation: 8.0,
      borderRadius: new BorderRadius.all(
        new Radius.circular(8.0),
      ),
      child: new InkWell(
        child: new Hero(
            tag: imgPath,
            child: CachedNetworkImage(
              imageUrl: imgPath,
              fit: BoxFit.fitWidth,
        )
        ),
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
              builder: (context) {
              return new FullScreenImagePage(imageUrl: imgPath, curentIndex: index);
            }
           )
          );
        },
      ),
    );
  }

}