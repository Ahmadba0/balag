// ignore_for_file: prefer_const_constructors, file_names, avoid_print, prefer_adjacent_string_concatenation

import 'package:balag/core/model/replay_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotifiHelper {
  //TaskController taskController = Get.put(TaskController());
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //
  initializeNotification() async {
    configureLocalTimeZone();
    //tz.initializeTimeZones();
    /*final IOSInitializationSettings initializationSettingsIOS =
     IOSInitializationSettings(
         requestSoundPermission: false,
         requestBadgePermission: false,
         requestAlertPermission: false,
         onDidReceiveLocalNotification: onDidReceiveLocalNotification
     );*/

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("lol");

//                ********
    final InitializationSettings initializationSettings =
        InitializationSettings(
      // iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
        //          *******
        initializationSettings,
        // onSelectNotification: selectNotification,
        onDidReceiveNotificationResponse: selectNotification);
  }

  Future selectNotification(
    payload,
  ) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }

    /* if (payload == "Theme Changed") {
      print("no thinmg");
    } else {
      print("WWWWWWWWWWw");
      Get.to(() =>
          NotifiedPage(label: taskController.title, body: taskController.body));
    }*/
  }

  displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true);
    // var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      //iOS: iOSPlatformChannelSpecifics
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: title,
    );
  }

  scheduledNotification(int hour, int minutes, ReplayModel replayModel) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        replayModel.policereplayId!,
        replayModel.policereplayText,
        replayModel.policereplayTime,
        convertTime(hour, minutes),
        //tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: "${replayModel.policereplayText}|" +
            "${replayModel.policereplayTime}|");
    // payload: task.title);
    //taskController.title = task.title!;
    //taskController.body = task.note!;
  }

  scheduledNotification1(
      int hour, int minutes, int id, String text, String any) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        text,
        any,
        convertTime(hour, minutes),
        //tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: "${text}|" + "${any}|");
    // payload: task.title);
    //taskController.title = task.title!;
    //taskController.body = task.note!;
  }

  /* scheduledNotification1(Task task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        task.title,
        task.note,
        tz.TZDateTime.now(tz.local).add(Duration(minutes: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }*/

  tz.TZDateTime convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }
    print(scheduleDate);
    return scheduleDate;
  }

  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    //final String timeZone = await FlutterTimezone.getLocalTimezone();
    //tz.setLocalLocation(tz.getLocation(timeZone));
    var locations = tz.timeZoneDatabase.locations;
    final locationName = tz.getLocation(locations.keys.first); //Asia/Calcutta
    tz.setLocalLocation(locationName);
    print(locationName);
    print("*****");
  }
}
