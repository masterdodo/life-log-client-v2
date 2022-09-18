import 'package:life_log_client_v2/config/secrets.dart' as secrets;

const String appName = 'Life Logger';
// Server and routes
const String serverName = secrets.serverName;
const String activeVersion = 'v1';
const String logPath = '/log';
const String logEndPath = '/log/end';
const String recentLogPath = '/logs/recent';
const String recentStatsPath = '/stats/recent';
const String rangeStatsPath = '/stats/range';
const String logUrl = serverName + activeVersion + logPath;
const String logEndUrl = serverName + activeVersion + logEndPath;
const String recentLogUrl = serverName + activeVersion + recentLogPath;
const String recentStatsUrl = serverName + activeVersion + recentStatsPath;
const String rangeStatsUrl = serverName + activeVersion + rangeStatsPath;
// Tokens
const String mobileToken = secrets.mobileToken;
const String testToken = secrets.testToken;
const String authToken = secrets.authToken;
// Request headers
const String contentType = 'application/json; charset=UTF-8';
// Datatypes
const String mysqlDatetimeFormat = 'yyyy-MM-dd HH:mm:ss';
const String apiDateFormat = 'yyyy-MM-dd';

// Actions
const String homeActionsTitle = 'All Actions';
const String homeActionsRoute = '/home-actions';

const String healthActionsTitle = 'Health';
const String healthActionsRoute = '/health-actions';
const String entertainmentActionsTitle = 'Entertainment';
const String entertainmentActionsRoute = '/entertainment-actions';
const String workActionsTitle = 'Work';
const String workActionsRoute = '/work-actions';
const String journalActionsTitle = 'Journal';
const String journalActionsRoute = '/journal-actions';
const String socialActionsTitle = 'Social';
const String socialActionsRoute = '/social-actions';
const String eventsActionsTitle = 'Events';
const String eventsActionsRoute = '/event-actions';

const String recentLogsTitle = 'Recent Logs';
const String recentLogsRoute = '/recent-logs';

const String recentStatsTitle = 'Last week Stats';
const String recentStatsRoute = '/recent-stats';
const String rangeStatsTitle = 'Range Stats';
const String rangeStatsRoute = '/range-stats';
