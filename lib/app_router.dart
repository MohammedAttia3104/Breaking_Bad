import 'package:breakingbad/Data/models/characters.dart';
import 'package:breakingbad/Data/repositery/characters_repository.dart';
import 'package:breakingbad/Data/web_services/characters_web_services.dart';
import 'package:breakingbad/Presentation/screens/character_details_screen.dart';
import 'package:breakingbad/Presentation/screens/characters_screen.dart';
import 'package:breakingbad/business_logic/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            //CodeReadability
            child: const CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(
            character: character,
          ),
        );
    }
    return null;
  }
}
