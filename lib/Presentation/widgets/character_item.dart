import 'package:breakingbad/Data/models/characters.dart';
import 'package:breakingbad/constants/my_colors.dart';
import 'package:breakingbad/constants/strings.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(4),
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          charactersDetailsScreen,
          arguments: character,
        ),
        child: GridTile(
          footer: Hero(
            tag: character.charId,
            child: Container(
              color: Colors.black54,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: const TextStyle(
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          child: Container(
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    height: double.infinity,
                    width: double.infinity,
                    placeholder: 'assets/images/loading.gif',
                    image: character.image)
                : Image.asset('assets/images/placeholder.jpg'),
          ),
        ),
      ),
    );
  }
}
