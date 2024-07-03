class DeliveryBillModel {
  String? bILLTYPE;
  String? bILLNO;
  String? bILLSRL;
  String? bILLDATE;
  String? bILLTIME;
  String? bILLAMT;
  String? tAXAMT;
  String? dLVRYAMT;
  String? mOBILENO;
  String? cSTMRNM;
  String? rGNNM;
  String? cSTMRBUILDNO;
  String? cSTMRFLOORNO;
  String? cSTMRAPRTMNTNO;
  String? cSTMRADDRSS;
  String? lATITUDE;
  String? lONGITUDE;
  String? dLVRYSTATUSFLG;

  DeliveryBillModel({
    this.bILLTYPE,
    this.bILLNO,
    this.bILLSRL,
    this.bILLDATE,
    this.bILLTIME,
    this.bILLAMT,
    this.tAXAMT,
    this.dLVRYAMT,
    this.mOBILENO,
    this.cSTMRNM,
    this.rGNNM,
    this.cSTMRBUILDNO,
    this.cSTMRFLOORNO,
    this.cSTMRAPRTMNTNO,
    this.cSTMRADDRSS,
    this.lATITUDE,
    this.lONGITUDE,
    this.dLVRYSTATUSFLG,
  });

  DeliveryBillModel.fromJson(Map<String, dynamic> json) {
    bILLTYPE = json['BILL_TYPE'];
    bILLNO = json['BILL_NO'];
    bILLSRL = json['BILL_SRL'];
    bILLDATE = json['BILL_DATE'];
    bILLTIME = json['BILL_TIME'];
    bILLAMT = json['BILL_AMT'];
    tAXAMT = json['TAX_AMT'];
    dLVRYAMT = json['DLVRY_AMT'];
    mOBILENO = json['MOBILE_NO'];
    cSTMRNM = json['CSTMR_NM'];
    rGNNM = json['RGN_NM'];
    cSTMRBUILDNO = json['CSTMR_BUILD_NO'];
    cSTMRFLOORNO = json['CSTMR_FLOOR_NO'];
    cSTMRAPRTMNTNO = json['CSTMR_APRTMNT_NO'];
    cSTMRADDRSS = json['CSTMR_ADDRSS'];
    lATITUDE = json['LATITUDE'];
    lONGITUDE = json['LONGITUDE'];
    dLVRYSTATUSFLG = json['DLVRY_STATUS_FLG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BILL_TYPE'] = bILLTYPE;
    data['BILL_NO'] = bILLNO;
    data['BILL_SRL'] = bILLSRL;
    data['BILL_DATE'] = bILLDATE;
    data['BILL_TIME'] = bILLTIME;
    data['BILL_AMT'] = bILLAMT;
    data['TAX_AMT'] = tAXAMT;
    data['DLVRY_AMT'] = dLVRYAMT;
    data['MOBILE_NO'] = mOBILENO;
    data['CSTMR_NM'] = cSTMRNM;
    data['RGN_NM'] = rGNNM;
    data['CSTMR_BUILD_NO'] = cSTMRBUILDNO;
    data['CSTMR_FLOOR_NO'] = cSTMRFLOORNO;
    data['CSTMR_APRTMNT_NO'] = cSTMRAPRTMNTNO;
    data['CSTMR_ADDRSS'] = cSTMRADDRSS;
    data['LATITUDE'] = lATITUDE;
    data['LONGITUDE'] = lONGITUDE;
    data['DLVRY_STATUS_FLG'] = dLVRYSTATUSFLG;
    return data;
  }
}
