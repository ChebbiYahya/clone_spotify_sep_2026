// Importe les widgets Material de Flutter.
import 'package:flutter/material.dart';

// Importe les couleurs personnalisées de l'application.
import '../../constants/colors.dart';

// Contient la configuration des thèmes de Dialog.
class TDialogTheme {
  // Constructeur privé pour empêcher l'instanciation.
  TDialogTheme._();

  // Thème Dialog pour le mode clair.
  static DialogThemeData lightDialogTheme = DialogThemeData(
    // Définit la forme et l'arrondi.
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    // Définit la couleur de fond.
    backgroundColor: TColors.lightContainer,

    // Définit le style du texte du contenu.
    contentTextStyle: TextStyle(color: TColors.secondary),
  );

  // Thème Dialog pour le mode sombre.
  static DialogThemeData darkDialogTheme = DialogThemeData(
    // Définit la forme et l'arrondi.
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    // Définit la couleur de fond.
    backgroundColor: TColors.darkContainer,

    // Définit le style du texte du contenu.
    contentTextStyle: TextStyle(color: TColors.white),
  );
}
