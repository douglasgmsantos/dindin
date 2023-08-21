import 'package:dindin/src/core/styles/hex_color.dart';
import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
GUIA DE CORES
--- primary - Cor base primária
--- onPrimary - E aplicada ao conteúdo (ícones, texto, etc.) que fica no topo do primário
--- primaryContainer - é aplicado a elementos que precisam de menos ênfase que o primário
--- onPrimaryContainer -  é aplicado ao conteúdo (ícones, texto etc.) que fica sobre o contêiner principal
 * 
 */

ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  //primary
  primary: HexColor("#16DB65"),
  onPrimary: HexColor("#0d2818"),
  primaryContainer: HexColor("#058c42"),
  onPrimaryContainer: Colors.grey.shade300,
  inversePrimary: Colors.grey.shade300,

  //secondary
  secondary: HexColor("#04283B"),
  onSecondary: HexColor("#FFFFFF"),
  secondaryContainer: HexColor("#C6ECFF"),
  onSecondaryContainer: HexColor("#042739"),

  //tertiary
  tertiary: HexColor("#C6ECFF"),
  onTertiary: HexColor("#FFFFFF"),
  tertiaryContainer: HexColor("#C6ECFF"),
  onTertiaryContainer: HexColor("#042739"),

  //error
  error: HexColor("#B3261E"),
  onError: HexColor("#FFFFFF"),
  errorContainer: HexColor("#F9DEDC"),
  onErrorContainer: HexColor("#410E0B"),

  //outline
  outline: HexColor("#F1EDF5"),
  outlineVariant: HexColor("#79747E"),

  // surface
  surface: HexColor("#161616"),
  onSurface: Colors.grey.shade300,

  inverseSurface: Colors.grey.shade300,
  onInverseSurface: HexColor("#161616"),

  //
  shadow: HexColor("#000000"),
  scrim: HexColor("#000000"),

  background: Colors.grey.shade900,
  onBackground: Colors.grey.shade300,
);
