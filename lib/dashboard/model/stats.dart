class CurrStats {
  final int total, discharged, confirmedIndian, confirmedForeign, deaths;
  final Map<String,dynamic> regional;

  CurrStats.fromJSON(Map<String, dynamic> jsonMap) :
        total = jsonMap['data']['summary']['total'],
        discharged = jsonMap['data']['summary']['discharged'],
        confirmedIndian = jsonMap['data']['summary']['confirmedCasesIndian'],
        confirmedForeign = jsonMap['data']['summary']['confirmedCasesForeign'],
        deaths = jsonMap['data']['summary']['deaths'],
        regional=jsonMap['regional'];
}