import 'package:projeto_letramento/page_data.dart';

class QuestionsData {
  final pages = const [
    PageData(imgPath: 'assets/casa.png', answer: [
      "CA",
      "SA"
    ], audioPaths: [
      'audio_ssa.mp3',
      'audio_ca.mp3',
      'audio_sa.mp3',
      'audio_ca.mp3',
      'audio_sa.mp3',
      'audio_ssa.mp3'
    ], buttonTexts: [
      'ÇA',
      'CA',
      'SA',
      'CA',
      'SA',
      'ÇA'
    ]),
    PageData(imgPath: 'assets/FADA.png', answer: [
      "FA",
      "DA"
    ], audioPaths: [
      'DE.mp3',
      'FO.mp3',
      'DA.mp3',
      'DAL.mp3',
      'FA.mp3',
      'FE.mp3'
    ], buttonTexts: [
      'DE',
      'FO',
      'DA',
      'DAL',
      'FA',
      'FE'
    ]),
    PageData(imgPath: 'assets/dado.jpg', answer: [
      "DA",
      "DO"
    ], audioPaths: [
      'DA.mp3',
      'DE.mp3',
      'DI.mp3',
      'DO.mp3',
      'DOU.mp3',
      'DU.mp3'
    ], buttonTexts: [
      'DA',
      'DE',
      'DI',
      'DO',
      'DOU',
      'DU'
    ]),
    PageData(imgPath: 'assets/jaca.png', answer: [
      "JA",
      "CA"
    ], audioPaths: [
      'KA.mp3',
      'JA.mp3',
      'DA.mp3',
      'audio_ssa.mp3',
      'GA.mp3',
      'audio_ca.mp3'
    ], buttonTexts: [
      'KA',
      'JA',
      'DA',
      'ÇA',
      'GA',
      'CA'
    ]),
    PageData(imgPath: 'assets/balde.png', answer: [
      "BAL",
      "DE"
    ], audioPaths: [
      'BAN.mp3',
      'BAUH.mp3',
      'DE.mp3',
      'DI.mp3',
      'BAL.mp3',
      'BA.mp3'
    ], buttonTexts: [
      'BÃ',
      'BAU',
      'DE',
      'DI',
      'BAL',
      'BA'
    ]),
    PageData(imgPath: 'assets/pato.png', answer: [
      "PA",
      "TO"
    ], audioPaths: [
      'PE.mp3',
      'TE.mp3',
      'PA.mp3',
      'DI.mp3',
      'TO.mp3',
      'TU.mp3'
    ], buttonTexts: [
      'PE',
      'TE',
      'PA',
      'DI',
      'TO',
      'TU'
    ]),
  ];

  PageData getPage(int index) {
    return pages[index];
  }

  List<PageData> getAllPages() {
    return pages;
  }
}
