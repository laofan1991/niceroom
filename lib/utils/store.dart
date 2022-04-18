import 'package:shared_preferences/shared_preferences.dart';

enum StoreKeys { token }

class Store {
  // static StoreKeys storeKeys;
  final SharedPreferences _store;
  static Future<Store> getInstance() async {
    //异步的没办法直接放到构造函数，通过静态函数拿到prefs在放在构造函数里
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //通过这样来初始化Store
    return Store._internal(prefs);
  }

  Store._internal(this._store);

  getString(StoreKeys key) async {
    return _store.get(key.toString());
  }

  setString(StoreKeys key, String value) async {
    return _store.setString(key.toString(), value);
  }

  getStringList(StoreKeys key) async {
    return _store.getStringList(key.toString());
  }

  setStringList(StoreKeys key, List<String> value) async {
    return _store.setStringList(key.toString(), value);
  }
}
