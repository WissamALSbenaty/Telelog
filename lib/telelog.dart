/// A singleton class that provides a logging mechanism integrated with Telegram bots.
///
/// The `Telelog` class allows developers to send log messages directly to Telegram chats
/// with different log levels such as debug, info, warning, error, and fatal.
library;

import 'package:logger/logger.dart';
import 'package:telelog/dependencies.dart';
import 'package:telelog/src/data/clients/i_http_client.dart';
import 'package:telelog/src/enums.dart';

class Telelog {
  /// Private singleton instance of `Telelog`.
  static final Telelog _instance = Telelog._internal();

  /// Logger instance used for local debugging.
  final Logger _logger = Logger(printer: SimplePrinter());

  /// HTTP client used for sending requests to the Telegram API.
  late IHttpClient _httpClient;

  /// Telegram bot API token.
  late String _apiToken;

  /// List of Telegram user IDs to send logs to.
  late List<String> _usersIds;

  /// Private constructor for the singleton pattern.
  Telelog._internal() {
    configureDependencies();
    _httpClient = getIt<IHttpClient>(instanceName: 'HttpClientTelelog');
  }

  /// Returns the singleton instance of `Telelog`.
  static Telelog get instance => _instance;

  /// Initializes the `Telelog` instance with the Telegram bot API token and user IDs.
  ///
  /// [apiToken]: The API token of your Telegram bot.
  /// [usersIds]: A list of Telegram user IDs to which logs will be sent.
  void init({
    required final String apiToken,
    required final List<String> usersIds,
  }) {
    _apiToken = apiToken;
    _usersIds = usersIds;
  }

  /// Internal method for sending logs to Telegram.
  ///
  /// [level]: The log level of the message.
  /// [message]: The log message to send.
  /// [parameters]: Additional parameters to include in the log message.
  void _log({
    required final LogLevel level,
    required final String message,
    required final Map<String, String>? parameters,
  }) {
    String parametersString = '';
    for (MapEntry<String, String> entry in parameters?.entries ?? []) {
      parametersString = '$parametersString\n ${entry.key} : ${entry.value}';
    }

    final String toSendMessage = '''${level.header}
    
$message
      
with parameters:
$parametersString
    ''';

    for (String userId in _usersIds) {
      try {
        _httpClient.sendRequest(
          requestType: RequestMethod.post,
          url: 'https://api.telegram.org/bot$_apiToken/sendMessage',
          parameters: {
            'chat_id': userId,
            'text': toSendMessage,
          },
        );
      } catch (e) {
        _logger.w('[Telelog]:: error when sending message with error $e');
      }
    }
  }

  /// Logs a debug-level message.
  void debug({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.debug, message: message, parameters: parameters);

  /// Alias for [debug].
  void d({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.debug, message: message, parameters: parameters);

  /// Logs an info-level message.
  void info({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.info, message: message, parameters: parameters);

  /// Alias for [info].
  void i({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.info, message: message, parameters: parameters);

  /// Logs a warning-level message.
  void warning({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.warning, message: message, parameters: parameters);

  /// Alias for [warning].
  void w({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.warning, message: message, parameters: parameters);

  /// Logs an error-level message.
  void error({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.error, message: message, parameters: parameters);

  /// Alias for [error].
  void e({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.error, message: message, parameters: parameters);

  /// Logs a fatal-level message.
  void fatal({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.fatal, message: message, parameters: parameters);

  /// Alias for [fatal].
  void f({
    required final String message,
    final Map<String, String>? parameters,
  }) =>
      _log(level: LogLevel.fatal, message: message, parameters: parameters);
}
