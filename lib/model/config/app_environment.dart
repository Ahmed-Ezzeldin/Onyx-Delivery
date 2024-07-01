enum EnvironmentType {
  development,
  staging,
  production,
}

class AppEnvironment {
  AppEnvironment._internal();
  static final AppEnvironment instance = AppEnvironment._internal();
  EnvironmentType environment = EnvironmentType.production;

  static initialize(EnvironmentType environment) {
    instance.environment = environment;
  }

  String get appName => "${appNamesMap[environment]}";
  String get serverURL => "${serverURLsMap[environment]}";

  final appNamesMap = {
    EnvironmentType.development: "Onyx Delivery Dev",
    EnvironmentType.staging: "Onyx Delivery Staging",
    EnvironmentType.production: "Onyx Delivery",
  };
  final serverURLsMap = {
    EnvironmentType.development: "http://mdev.yemensoft.net:8087",
    EnvironmentType.staging: "",
    EnvironmentType.production: "",
  };
}

extension DevString on String {
  String get dev {
    return AppEnvironment.instance.environment != EnvironmentType.development ? "" : this;
  }
}
