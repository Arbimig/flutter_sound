/*
 * Copyright 2018, 2019, 2020, 2021 Dooboolab.
 *
 * This file is part of Flutter-Sound.
 *
 * Flutter-Sound is free software: you can redistribute it and/or modify
 * it under the terms of the Mozilla Public License version 2 (MPL2.0),
 * as published by the Mozilla organization.
 *
 * Flutter-Sound is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * MPL General Public License for more details.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'demo/demo.dart';
import 'livePlaybackWithBackPressure/live_playback_with_back_pressure.dart';
import 'livePlaybackWithoutBackPressure/live_playback_without_back_pressure.dart';
import 'loglevel/loglevel.dart';
import 'multi_playback/multi_playback.dart';
import 'play_from_mic/play_from_mic.dart';
import 'player_onProgress/player_onProgress.dart';
import 'recordToStream/record_to_stream_example.dart';
import 'recorder_onProgress/recorder_onProgress.dart';
import 'seek/seek.dart';
import 'simple_playback/simple_playback.dart';
import 'simple_recorder/simple_recorder.dart';
import 'soundEffect/sound_effect.dart';
import 'speed_control/speed_control.dart';
import 'streamLoop/stream_loop.dart';
import 'streamLoop_justAudio/stream_loop_just_audio.dart';
import 'volume_control/volume_control.dart';

/*
    This APP is just a driver to call the various Flutter Sound examples.
    Please refer to the examples/README.md and all the examples located under the examples/lib directory.
*/

void main() {
  runApp(ExamplesApp());
}

///
const int tNotWeb = 1;

///
class Example {
  ///
  final String? title;

  ///
  final String? subTitle;

  ///
  final String? description;

  ///
  final WidgetBuilder? route;

  ///
  final int? flags;

  ///
  /* ctor */ Example(
      {this.title, this.subTitle, this.description, this.flags, this.route});

  ///
  void go(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute<void>(builder: route!));
}

///
final List<Example> exampleTable = [
  // If you update the following test, please update also the Examples/README.md file and the comment inside the dart file.

  Example(
      title: 'Demo',
      subTitle: 'Flutter Sound capabilities',
      flags: 0,
      route: (_) => Demo(),
      description:
          '''Это демонстрация того, что можно сделать с Flutter Sound. Код этого демонстрационного приложения не так прост и, к сожалению, не очень чист :-( . Новичкам Flutter Sound: вам, вероятно, следует обратить внимание на `[SimplePlayback]` и `[SimpleRecorder]`. особенностей Flutter Sound: - Воспроизведение с различных носителей с различными кодеками - Запись на различные носители с различными кодеками - Управление паузой и возобновлением записи или воспроизведения - Показывает, как использовать поток для получения событий воспроизведения (или записи) - Показывает как указать функцию обратного вызова при прекращении воспроизведения - Показывает, как записывать в поток или воспроизводить из потока - Может отображать элементы управления на экране блокировки iOS или Android - ... В этой демонстрации не используется Flutter Звуковые виджеты пользовательского интерфейса. Было бы здорово, если бы кто-нибудь переписал это демо в ближайшее время.'''),

  Example(
    title: 'simplePlayback',
    subTitle: 'A very simple example',
    flags: 0,
    route: (_) => SimplePlayback(),
    description: '''
Это очень простой пример для начинающих Flutter Sound, который показывает, как воспроизвести удаленный файл. Этот пример действительно базовый.
''',
  ),

  Example(
    title: 'simpleRecorder',
    subTitle: 'A very simple example',
    flags: 0,
    route: (_) => SimpleRecorder(),
    description: '''
Это очень простой пример для начинающих пользователей Flutter Sound, который показывает, как записывать, а затем воспроизводить файл. Этот пример действительно базовый.
''',
  ),

  Example(
    title: 'multiPlayback',
    subTitle: 'Playing several sound at the same time',
    flags: 0,
    route: (_) => MultiPlayback(),
    description: '''
Это простой пример, который воспроизводит несколько звуков одновременно.
''',
  ),

  Example(
    title: 'Volume Control',
    subTitle: 'Volume Control',
    flags: 0,
    route: (_) => VolumeControl(),
    description: '''Это очень простой пример, показывающий, как установить громкость во время воспроизведения. Этот пример действительно базовый.
''',
  ),

  Example(
    title: 'Speed Control',
    subTitle: 'Speed Control',
    flags: 0,
    route: (_) => SpeedControl(),
    description: '''
This is a very simple example showing how tune the speed of a playback.

This example is really basic.
''',
  ),

  Example(
    title: 'Seek Player',
    subTitle: 'Seek Player',
    flags: 0,
    route: (_) => Seek(),
    description: '''
This is a very simple example showing how tune the speed of a playback.

This example is really basic.
''',
  ),

  Example(
    title: 'Player onProgress',
    subTitle: 'Player onProgress',
    flags: 0,
    route: (_) => PlayerOnProgress(),
    description: '''Это очень простой пример, показывающий, как вызвать `setSubscriptionDuration() и использовать onProgress() для игрока.

''',
  ),

  Example(
    title: 'Recorder onProgress',
    subTitle: 'Recorder onProgress',
    flags: 0,
    route: (_) => RecorderOnProgress(),
    description: '''
This is a very simple example showing how to  call `setSubscriptionDuration() and use onProgress() on a recorder.

''',
  ),

  Example(
    title: 'Play from Mic',
    subTitle: 'Play from microphone',
    flags: tNotWeb,
    route: (_) => PlayFromMic(),
    description: '''Воспроизвести на блютуз гарнитуре то, что записано микрофоном. Этот пример очень прост. >>> Пожалуйста, убедитесь, что ваша гарнитура правильно подключена через Bluetooth
''',
  ),

  Example(
    title: 'recordToStream',
    subTitle: 'Example of recording to Stream',
    flags: tNotWeb,
    route: (_) => RecordToStreamExample(),
    description: '''
Это пример, показывающий, как записывать в Dart Stream. Он записывает все записанные данные из потока в файл, что совершенно глупо: если приложение хочет что-то записать в файл, оно не должно использовать потоки. Реальный интерес к записи в поток заключается, например, в том, чтобы передать механизм преобразования речи в текст или для обработки данных Live в Dart в режиме реального времени.
''',
  ),

  Example(
    title: 'livePlaybackWithoutBackPressure',
    subTitle: 'Live Playback without BackPressure',
    flags: tNotWeb,
    route: (_) => LivePlaybackWithoutBackPressure(),
    description:
        '''Очень простой пример, показывающий, как воспроизводить Live Data без обратного давления. Очень простой пример, показывающий, как воспроизводить Live Data без обратного давления. Он передает прямую трансляцию, не дожидаясь завершения фьючерсов для каждого блока. Это проще, потому что приложению не нужно ждать воспроизведения каждого блока перед воспроизведением другого. Этот пример получает данные из файла ресурса, что совершенно глупо: если приложение хочет воспроизвести файл ресурса, он должен использовать «StartPlayerFromBuffer()». Подача звука Flutter без обратного давления очень проста, но у вас могут быть две проблемы: - Если ваше приложение слишком быстро загружает аудиоканал, у него могут быть проблемы с используемой памятью Stream.- Приложение не знает, когда действительно воспроизводится предоставленный блок.Если он выполнит «stopPlayer()», оно потеряет все буферизованные данные. В этом примере используется объект foodEvent для повторной синхронизации выходного потока перед выполнением ```stop()```
''',
  ),

  Example(
    title: 'livePlaybackWithBackPressure',
    subTitle: 'Live Playback with BackPressure',
    flags: tNotWeb,
    route: (_) => LivePlaybackWithBackPressure(),
    description: '''
Очень простой пример, показывающий, как воспроизводить Live Data с противодавлением. Он передает прямую трансляцию, ожидая завершения фьючерсов для каждого блока. Этот пример получает данные из файла ресурсов, что совершенно глупо: если приложение хочет воспроизвести файл ресурсов, оно должно использовать «StartPlayerFromBuffer()». Если вам не нужно обратное давление, вы можете увидеть другой простой пример: «LivePlaybackWithoutBackPressure .dart". Этот другой пример немного проще, потому что приложению не нужно ждать воспроизведения каждого блока перед воспроизведением другого.
''',
  ),

  Example(
    title: 'soundEffect',
    subTitle: 'Sound Effect',
    flags: tNotWeb,
    route: (_) => SoundEffect(),
    description: '''
```startPlayerFromStream()`` может быть очень эффективным для воспроизведения звуковых эффектов. Например, в игровом приложении. Приложение открывает аудиосессию и вызывает ```startPlayerFromStream()``` во время инициализации. Когда он хочет воспроизвести какой-нибудь звук, ему достаточно произнести глагол «кормить».
''',
  ),

  Example(
    title: 'streamLoop',
    subTitle: 'Loop from recorder to player',
    flags: tNotWeb,
    route: (_) => StreamLoop(),
    description: '''
```streamLoop()``` — это очень простой пример, который подключает приемник FlutterSoundRecorder к потоку FlutterSoundPlayer. Конечно, мы не играем в громкоговоритель, чтобы избежать очень неприятного эффекта Ларсена. В этом примере не используется новый StreamController, а используется напрямую foodStreamController из flutter_sound_player.dart.
''',
  ),

  Example(
    title: 'setLogLevel()',
    subTitle: 'Dynamically change the log level',
    flags: 0,
    route: (_) => LogLevel(),
    description: '''
```Показывает, как изменить уровень логирования во время аудиосессии.
''',
  ),

  Example(
    title: 'StreamLoopJustAudio()',
    subTitle: 'JustAudio cohabitation',
    flags: tNotWeb,
    route: (_) => StreamLoopJustAudio(),
    description: '''
    ```Протестируйте StreamLoop с сожительством JustAudio.
    ''',
  ),
];

///
class ExamplesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sound Examples',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExamplesAppHomePage(title: 'Flutter Sound Examples'),
    );
  }
}

///
class ExamplesAppHomePage extends StatefulWidget {
  ///
  ExamplesAppHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  ///
  final String? title;

  @override
  _ExamplesHomePageState createState() => _ExamplesHomePageState();
}

class _ExamplesHomePageState extends State<ExamplesAppHomePage> {
  Example? selectedExample;

  @override
  void initState() {
    selectedExample = exampleTable[0];
    super.initState();
    //_scrollController = ScrollController( );
  }

  @override
  Widget build(BuildContext context) {
    Widget cardBuilder(BuildContext context, int index) {
      var isSelected = (exampleTable[index] == selectedExample);
      return GestureDetector(
        onTap: () => setState(() {
          selectedExample = exampleTable[index];
        }),
        child: Card(
          shape: RoundedRectangleBorder(),
          borderOnForeground: false,
          elevation: 3.0,
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: isSelected ? Colors.indigo : Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),

            //color: isSelected ? Colors.indigo : Colors.cyanAccent,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(exampleTable[index].title!,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black)),
              Text(exampleTable[index].subTitle!,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black)),
            ]),
          ),
        ),
      );
    }

    Widget makeBody() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: ListView.builder(
                  itemCount: exampleTable.length, itemBuilder: cardBuilder),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: SingleChildScrollView(
                child: Text(selectedExample!.description!),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: makeBody(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text((kIsWeb && (selectedExample!.flags! & tNotWeb != 0))
                    ? 'Not supported on Flutter Web '
                    : ''),
                ElevatedButton(
                  onPressed:
                      (kIsWeb && (selectedExample!.flags! & tNotWeb != 0))
                          ? null
                          : () => selectedExample!.go(context),
                  //color: Colors.indigo,
                  child: Text(
                    'GO',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
