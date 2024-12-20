enum RequestMethod { get, delete, post, patch, put }

enum LogLevel {
  debug('🐛 Debug 🐛'),
  info('ℹ️ Info ℹ️'),
  warning('⚠️ Warning ⚠️'),
  error('🚨 Error 🚨'),
  fatal('⚡ Fatal ⚡');

  final String header;

  const LogLevel(this.header);
}
