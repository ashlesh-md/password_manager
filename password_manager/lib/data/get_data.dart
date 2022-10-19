import '../screens/social_media.dart';

var jsonData = [
  {
    'id': 0,
    'name': 'Facebook',
    'url': 'www.facebook.com',
    'image': 'assets/Images/06/01/Bitmap.png'
  },
  {
    'id': 1,
    'name': 'YouTube',
    'url': 'www.youtube.com',
    'image': 'assets/Images/06/01_copy_3/Bitmap.png'
  },
  {
    'id': 2,
    'name': 'Twitter',
    'url': 'www.twitter.in',
    'image': 'assets/Images/06/01_copy_4/Bitmap_Copy_2.png'
  },
  {
    'id': 3,
    'name': 'Instagram',
    'url': 'www.instagram.in',
    'image': 'assets/Images/06/01_copy/Bitmap.png'
  },
  {
    'id': 4,
    'name': 'Pintrest',
    'url': 'www.pintrest.com',
    'image': 'assets/Images/06/01_copy_5/Bitmap_Copy_4.png'
  }
];
getData(String name) {
  for (int index = 0; index < jsonData.length; index++) {
    if (jsonData[index]['name'] == name) {
      return jsonData[index];
    }
    return jsonData[0];
  }
}
