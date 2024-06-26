import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateTimeHelper {
  timestampForDB(DateTime dt) {
    // DateTime dt = DateTime.now();
    DateFormat dbDateTimeFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    String dtToString = dbDateTimeFormat.format(dt);
    return dtToString;
  }

  ageFromDate(DateTime pickedDate) {
    DateTime currentDateTime = DateTime.now();
    int diffInDays = currentDateTime.difference(pickedDate).inDays;
    String diffInYears = (diffInDays / 365).toStringAsFixed(1);
    return diffInYears;
  }

  ageFromDateStr(String? storedDate) {
    if (storedDate != null && storedDate != '') {
      /* log('Stored date => $storedDate'); */
      DateTime parsedDateTime = DateTime.parse(storedDate);
      DateTime currentDateTime = DateTime.now();
      int diffInDays = currentDateTime.difference(parsedDateTime).inDays;
      String diffInYears = (diffInDays / 365).toStringAsFixed(1);
      return diffInYears;
    } else {
      return '0';
    }
  }

  dateInWords(DateTime? dt) {
    if (dt != null) {
      initializeDateFormatting();
      String displayedDate = DateFormat.yMMMMEEEEd('en').format(dt);
      return displayedDate;
    } else {
      return 'Date not available';
    }
  }

  toDbDateTimeFormat(String? inputDateStr) {
    if (inputDateStr != null && inputDateStr != '') {
      DateTime inputToDateTime = DateFormat('dd/MM/yyyy').parse(inputDateStr);
      String toDbFormat =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(inputToDateTime);
      return toDbFormat;
    } else {
      return '0000-00-00 00:00:00';
    }
  }

  toDbDateFormat(String? inputDateStr) {
    if (inputDateStr != null &&
        inputDateStr != '' &&
        inputDateStr != '--/--/----') {
      DateTime inputToDateTime = DateFormat('dd/MM/yyyy').parse(inputDateStr);
      String toDbFormat = DateFormat('yyyy-MM-dd').format(inputToDateTime);
      return toDbFormat;
    } else {
      return '0000-00-00';
    }
  }

  timestampAsString(DateTime datetime) {
    DateFormat dbDateTimeFormat = DateFormat('yyMMddHHmmss');
    DateTime dt = DateTime.now();
    String dtToString = dbDateTimeFormat.format(dt);
    return dtToString;
  }

  timestampToDateStr(DateTime ts) {
    DateFormat dbDateTimeFormat = DateFormat('yyyy-MM-dd');
    // DateTime dt = DateTime.now();
    String dateToString = dbDateTimeFormat.format(ts);
    return dateToString;
  }

  dateToCmrDateString(DateTime? ts) {
    if (ts != null) {
      DateFormat toDateFormat = DateFormat('dd/MM/yyyy');
      String formatted = toDateFormat.format(ts);
      return formatted;
    } else {
      return '--/--/----';
    }
  }

  displayedDateString(DateTime datetime) {
    DateFormat dbDateTimeFormat = DateFormat('dd/MM/yyyy');
    DateTime dt = DateTime.now();
    String dtToString = dbDateTimeFormat.format(dt);
    return dtToString;
  }

  currentYear(DateTime now) {
    String yearToString = DateFormat('yyyy').format(now);
    return yearToString;
  }

  toUiDateTime(String? dbDateTime) {
    // print(dbDateTime.runtimeType);
    if (dbDateTime != null && dbDateTime != '') {
      DateTime parsedDateTime = DateTime.parse(dbDateTime);
      DateFormat fDateTimeFormat = DateFormat('dd/MM/yyyy HH:mm');
      String uiDateTime = fDateTimeFormat.format(parsedDateTime);
      return uiDateTime;
    } else {
      return '--/--/---- --:--';
    }
  }

  isoToCmrDateTime(String? dbDateTime) {
    // print(dbDateTime.runtimeType);
    if (dbDateTime != null && dbDateTime != '') {
      DateTime parsedDateTime = DateTime.parse(dbDateTime);
      DateFormat fDateTimeFormat = DateFormat('dd/MM/yyyy');
      String uiDateTime = fDateTimeFormat.format(parsedDateTime);
      return uiDateTime;
    } else {
      return '--/--/---- --:--';
    }
  }

  isoToCmrDateOnly(String? dbDate) {
    // print(dbDateTime.runtimeType);
    if (dbDate != null && dbDate != '') {
      DateTime parsedDateTime = DateTime.parse(dbDate);
      DateFormat fDateTimeFormat = DateFormat('dd/MM/yyyy');
      String uiDateTime = fDateTimeFormat.format(parsedDateTime);
      return uiDateTime;
    } else {
      return '--/--/----';
    }
  }
}
