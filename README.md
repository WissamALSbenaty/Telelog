<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


<img src="assets/logo.webp"  width="128" alt="logo"/>

#### A lightweight Flutter package for logging messages directly to a Telegram bot. Easily send logs, debug information, or notifications to your Telegram chats with minimal setup. Ideal for monitoring apps or debugging in real-time.



## Motivation
If Telegram is practically your second home, why not make it your logging hub too? This package lets you send logs and updates directly to your Telegram chat, so you can stay on top of your app's performance while pretending you're just checking messages. Productivity has never been so convenient—or so sneaky.  




## Getting started
First , you need to create a bot using [this bot](https://t.me/BotFather) and get your api token.
<br>
then for every user you need to be notified when a new message sent , you need to use [this bot](https://t.me/userinfobot) to get the user id 
<br>

![](assets/trail.gif)

## Usage
First of all you need to initialize the logger instance
```dart
Telelog.instance.init(
    apiToken: 'your api token',
    usersIds: ['your chat id']
);
```

and then you can use this function to send messages to users

```dart
Telelog.instance.i(message: 'Hello World', parameters: {
      'app name': 'my cool app',
});
```

## Logging Levels

the package has several logging levels to helps you differentiate the log type 

### Logging Methods
### Logging Methods

| **Level**  | **Method**                             | **Alternative**          |
|:----------:|----------------------------------------|--------------------------|
| **Debug**  | `Telelog.instance.d`                  | `Telelog.instance.debug` |
| **Info**   | `Telelog.instance.i`                  | `Telelog.instance.info`  |
| **Warning**| `Telelog.instance.w`                  | `Telelog.instance.warning` |
| **Error**  | `Telelog.instance.e`                  | `Telelog.instance.error` |
| **Fatal**  | `Telelog.instance.f`                  | `Telelog.instance.fatal` |
  