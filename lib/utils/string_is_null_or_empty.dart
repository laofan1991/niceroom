// ignore_for_file: unnecessary_null_comparison

// ignore: non_constant_identifier_names
bool StringIsNullOrEmpty(String str) {
  if (str == null || str == '') {
    return true;
  } else {
    return false;
  }
}
