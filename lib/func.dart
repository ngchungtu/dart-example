sayhello([String name = "User Default"]) {
  print('Hello - $name');
}

String logHosting(String serverName, {int port = 8800}) {
  return 'https://$serverName:$port';
}

String getDateTime({int? date, int? month, int? year}) {
  String strDay = (date ?? 0) < 10
      ? '0$date'
      : '$date'; //(date ?? 0) - trả về giá trị mặc định
  String strMonth = (month ?? 0) < 10 ? '0$month' : '$month';
  return "$strDay - $strMonth - $year";
}

//call to another void function
void doSomeTasks({int number_1 = 1, int number_2 = 2, Function? completion, Function? sum}){
  print("doing tasks...");
  sum!(number_1 + number_2);
  completion!("done task"); // x! make sure x is "not null"
}