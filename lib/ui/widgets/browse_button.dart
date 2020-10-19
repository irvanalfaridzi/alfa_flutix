part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton(this.genre);

  @override
  Widget build(BuildContext context) {
    // return Text(genre);
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.only(bottom: 4),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xFFEEF1F8), borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: SizedBox(
            height: 36,
            child: Image(
              image: AssetImage(getImageGenre(genre)),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(genre, style: blackTextFont.copyWith(fontSize: 13)),
    ]);
  }

  String getImageGenre(String genre) {
    switch (genre) {
      case "Horror":
        return "assets/ic_horror.png";
        break;
      case "Music":
        return "assets/ic_music.png";
        break;
      case "Action":
        return "assets/ic_action.png";
        break;
      case "War":
        return "assets/ic_war.png";
        break;
      case "Drama":
        return "assets/ic_drama.png";
        break;
      case "Crime":
        return "assets/ic_crime.png";
        break;
    }
  }
}
