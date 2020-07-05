var server = "35.228.14.221"
var dbName = "exercise"
var username = "admin"
var password = "changeme"
var port = 3306

var connectionName = "holden-apy:europe-north1:mysql-db-41133e04";
var url = "jdbc:google:mysql://" + connectionName + "/" + dbName;

function cloudSqlConnection() {
  var conn = Jdbc.getCloudSqlConnection(url, username, password);

  return conn
}

function readTable() {
  var conn = cloudSqlConnection();
  var stmt = conn.createStatement();
  
  var results = stmt.executeQuery('SELECT * FROM max_pull_ups');
}

function singleLineInsert() {
  var conn = cloudSqlConnection();
  var stmt = conn.prepareStatement('INSERT INTO minsert '
      + '(date, week, workout, `set`, reps, weight) values (STR_TO_DATE(?,"%m/%d/%Y"), ?, ?, ?, ? ,?)');
  stmt.setString(1, '02/07/2020');
  stmt.setString(2, '0');
  stmt.setString(3, '0');
  stmt.setString(4, '0');
  stmt.setString(5, '0');
  stmt.setString(6, '0');
  stmt.execute();
}

function writeSheetToDb() {
  var conn = cloudSqlConnection();
  conn.setAutoCommit(false);
  var sheet = SpreadsheetApp.getActiveSheet();
  var data = sheet.getDataRange().getValues();
  var stmt = conn.prepareCall('INSERT INTO minsert (date, week, workout, `set`, reps, weight) values (STR_TO_DATE(?,"%m/%d/%Y"), ?, ?, ?, ? ,?)');
  
  var date;
  var week;
  var workout;
  var set;
  var reps;
  var weight;
  
  for ( var i = 1; i < data.length; i++ ) {
     date = data[i][0];
     week = data[i][1];
     workout = data[i][2];
     set = data[i][3];
     reps = data[i][4];
     weight = data[i][5];
     stmt.setString(1, date);
     stmt.setString(2, week);
     stmt.setString(3, workout);
     stmt.setString(4, set);
     stmt.setString(5, reps);
     stmt.setString(6, weight);
     stmt.addBatch();
  }
  stmt.executeBatch();
  stmt.clearBatch();
  conn.commit();
  conn.close();
}