class ManagementDTO {
  bool _success=false;
  Result? _result;

  ManagementDTO({bool? success, Result? result}) {
    this._success = success!;
    this._result = result;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  Result get result => _result!;
  set result(Result result) => _result = result;

   ManagementDTO.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _result = json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    if (this._result != null) {
      data['result'] = this._result!.toJson();
    }
    return data;
  }
}

class Result {
  List<MonthPurchase>? _monthPurchase;
  List<MonthIssuance>? _monthIssuance;
  List<TotalPartners>? _totalPartners;
  List<TopFivePartnerPurchaseValue>? _topFivePartnerPurchaseValue;
  List<TopFiveIssuanceCertificate>? _topFiveIssuanceCertificate;
  List<TopFiveIssuanceCertificatePartnerWise>?
  _topFiveIssuanceCertificatePartnerWise;
  List<String>? _monthArrRegVsApp;
  List<String>? _monthCountArrRegVsApp1;
  List<String>? _monthCountArrRegVsApp2;

  Result(
      {List<MonthPurchase>? monthPurchase,
        List<MonthIssuance>? monthIssuance,
        List<TotalPartners>? totalPartners,
        List<TopFivePartnerPurchaseValue>? topFivePartnerPurchaseValue,
        List<TopFiveIssuanceCertificate>? topFiveIssuanceCertificate,
        List<TopFiveIssuanceCertificatePartnerWise>?
        topFiveIssuanceCertificatePartnerWise,
        List<String>? monthArrRegVsApp,
        List<String>? monthCountArrRegVsApp1,
        List<String>? monthCountArrRegVsApp2}) {
    this._monthPurchase = monthPurchase!;
    this._monthIssuance = monthIssuance!;
    this._totalPartners = totalPartners!;
    this._topFivePartnerPurchaseValue = topFivePartnerPurchaseValue!;
    this._topFiveIssuanceCertificate = topFiveIssuanceCertificate!;
    this._topFiveIssuanceCertificatePartnerWise =
        topFiveIssuanceCertificatePartnerWise!;
    this._monthArrRegVsApp = monthArrRegVsApp!;
    this._monthCountArrRegVsApp1 = monthCountArrRegVsApp1!;
    this._monthCountArrRegVsApp2 = monthCountArrRegVsApp2!;
  }

  List<MonthPurchase> get monthPurchase => _monthPurchase!;
  set monthPurchase(List<MonthPurchase> monthPurchase) =>
      _monthPurchase = monthPurchase;
  List<MonthIssuance> get monthIssuance => _monthIssuance!;
  set monthIssuance(List<MonthIssuance> monthIssuance) =>
      _monthIssuance = monthIssuance;
  List<TotalPartners> get totalPartners => _totalPartners!;
  set totalPartners(List<TotalPartners> totalPartners) =>
      _totalPartners = totalPartners;
  List<TopFivePartnerPurchaseValue> get topFivePartnerPurchaseValue =>
      _topFivePartnerPurchaseValue!;
  set topFivePartnerPurchaseValue(
      List<TopFivePartnerPurchaseValue> topFivePartnerPurchaseValue) =>
      _topFivePartnerPurchaseValue = topFivePartnerPurchaseValue;
  List<TopFiveIssuanceCertificate> get topFiveIssuanceCertificate =>
      _topFiveIssuanceCertificate!;
  set topFiveIssuanceCertificate(
      List<TopFiveIssuanceCertificate> topFiveIssuanceCertificate) =>
      _topFiveIssuanceCertificate = topFiveIssuanceCertificate;
  List<TopFiveIssuanceCertificatePartnerWise>
  get topFiveIssuanceCertificatePartnerWise =>
      _topFiveIssuanceCertificatePartnerWise!;
  set topFiveIssuanceCertificatePartnerWise(
      List<TopFiveIssuanceCertificatePartnerWise>
      topFiveIssuanceCertificatePartnerWise) =>
      _topFiveIssuanceCertificatePartnerWise =
          topFiveIssuanceCertificatePartnerWise;
  List<String> get monthArrRegVsApp => _monthArrRegVsApp!;
  set monthArrRegVsApp(List<String> monthArrRegVsApp) =>
      _monthArrRegVsApp = monthArrRegVsApp;
  List<String> get monthCountArrRegVsApp1 => _monthCountArrRegVsApp1!;
  set monthCountArrRegVsApp1(List<String> monthCountArrRegVsApp1) =>
      _monthCountArrRegVsApp1 = monthCountArrRegVsApp1;
  List<String> get monthCountArrRegVsApp2 => _monthCountArrRegVsApp2!;
  set monthCountArrRegVsApp2(List<String> monthCountArrRegVsApp2) =>
      _monthCountArrRegVsApp2 = monthCountArrRegVsApp2;

  Result.fromJson(Map<String, dynamic> json) {
    if (json['monthPurchase'] != null) {
      _monthPurchase = new List<MonthPurchase>.empty(growable: true);
      json['monthPurchase'].forEach((v) {
        _monthPurchase!.add(new MonthPurchase.fromJson(v));
      });
    }
    if (json['monthIssuance'] != null) {
      _monthIssuance = new List<MonthIssuance>.empty(growable: true);
      json['monthIssuance'].forEach((v) {
        _monthIssuance!.add(new MonthIssuance.fromJson(v));
      });
    }
    if (json['totalPartners'] != null) {
      _totalPartners = new List<TotalPartners>.empty(growable: true);
      json['totalPartners'].forEach((v) {
        _totalPartners!.add(new TotalPartners.fromJson(v));
      });
    }
    if (json['TopFivePartnerPurchaseValue'] != null) {
      _topFivePartnerPurchaseValue = new List<TopFivePartnerPurchaseValue>.empty(growable: true);
      json['TopFivePartnerPurchaseValue'].forEach((v) {
        _topFivePartnerPurchaseValue!
            .add(new TopFivePartnerPurchaseValue.fromJson(v));
      });
    }
    if (json['TopFiveIssuanceCertificate'] != null) {
      _topFiveIssuanceCertificate = new List<TopFiveIssuanceCertificate>.empty(growable: true);
      json['TopFiveIssuanceCertificate'].forEach((v) {
        _topFiveIssuanceCertificate!
            .add(new TopFiveIssuanceCertificate.fromJson(v));
      });
    }
    if (json['TopFiveIssuanceCertificatePartnerWise'] != null) {
      _topFiveIssuanceCertificatePartnerWise =
      new List<TopFiveIssuanceCertificatePartnerWise>.empty(growable: true);
      json['TopFiveIssuanceCertificatePartnerWise'].forEach((v) {
        _topFiveIssuanceCertificatePartnerWise!
            .add(new TopFiveIssuanceCertificatePartnerWise.fromJson(v));
      });
    }
    _monthArrRegVsApp = json['monthArrRegVsApp'].cast<String>();
    _monthCountArrRegVsApp1 = json['monthCountArrRegVsApp1'].cast<String>();
    _monthCountArrRegVsApp2 = json['monthCountArrRegVsApp2'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._monthPurchase != null) {
      data['monthPurchase'] =
          this._monthPurchase!.map((v) => v.toJson()).toList();
    }
    if (this._monthIssuance != null) {
      data['monthIssuance'] =
          this._monthIssuance!.map((v) => v.toJson()).toList();
    }
    if (this._totalPartners != null) {
      data['totalPartners'] =
          this._totalPartners!.map((v) => v.toJson()).toList();
    }
    if (this._topFivePartnerPurchaseValue != null) {
      data['TopFivePartnerPurchaseValue'] =
          this._topFivePartnerPurchaseValue!.map((v) => v.toJson()).toList();
    }
    if (this._topFiveIssuanceCertificate != null) {
      data['TopFiveIssuanceCertificate'] =
          this._topFiveIssuanceCertificate!.map((v) => v.toJson()).toList();
    }
    if (this._topFiveIssuanceCertificatePartnerWise != null) {
      data['TopFiveIssuanceCertificatePartnerWise'] = this
          ._topFiveIssuanceCertificatePartnerWise!
          .map((v) => v.toJson())
          .toList();
    }
    data['monthArrRegVsApp'] = this._monthArrRegVsApp;
    data['monthCountArrRegVsApp1'] = this._monthCountArrRegVsApp1;
    data['monthCountArrRegVsApp2'] = this._monthCountArrRegVsApp2;
    return data;
  }
}

class MonthPurchase {
  String _monthCount="";
  String _monthNum="";
  String _monthDisp="";

  MonthPurchase({String? monthCount, String? monthNum, String? monthDisp}) {
    this._monthCount = monthCount!;
    this._monthNum = monthNum!;
    this._monthDisp = monthDisp!;
  }

  String get monthCount => _monthCount;
  set monthCount(String monthCount) => _monthCount = monthCount;
  String get monthNum => _monthNum;
  set monthNum(String monthNum) => _monthNum = monthNum;
  String get monthDisp => _monthDisp;
  set monthDisp(String monthDisp) => _monthDisp = monthDisp;

  MonthPurchase.fromJson(Map<String, dynamic> json) {
    _monthCount = json['month_count'];
    _monthNum = json['month_num'];
    _monthDisp = json['month_disp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month_count'] = this._monthCount;
    data['month_num'] = this._monthNum;
    data['month_disp'] = this._monthDisp;
    return data;
  }
}
class MonthIssuance {
  String _monthCount="";
  String _monthNum="";
  String _monthDisp="";

  MonthIssuance({String? monthCount, String? monthNum, String? monthDisp}) {
    this._monthCount = monthCount!;
    this._monthNum = monthNum!;
    this._monthDisp = monthDisp!;
  }

  String get monthCount => _monthCount;
  set monthCount(String monthCount) => _monthCount = monthCount;
  String get monthNum => _monthNum;
  set monthNum(String monthNum) => _monthNum = monthNum;
  String get monthDisp => _monthDisp;
  set monthDisp(String monthDisp) => _monthDisp = monthDisp;

  MonthIssuance.fromJson(Map<String, dynamic> json) {
    _monthCount = json['month_count'];
    _monthNum = json['month_num'];
    _monthDisp = json['month_disp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month_count'] = this._monthCount;
    data['month_num'] = this._monthNum;
    data['month_disp'] = this._monthDisp;
    return data;
  }
}

class TotalPartners {
  String _totalRa="";
  String _totalBp="";
  String _totalBr="";

  TotalPartners({String? totalRa, String? totalBp, String? totalBr}) {
    this._totalRa = totalRa!;
    this._totalBp = totalBp!;
    this._totalBr = totalBr!;
  }

  String get totalRa => _totalRa;
  set totalRa(String totalRa) => _totalRa = totalRa;
  String get totalBp => _totalBp;
  set totalBp(String totalBp) => _totalBp = totalBp;
  String get totalBr => _totalBr;
  set totalBr(String totalBr) => _totalBr = totalBr;

  TotalPartners.fromJson(Map<String, dynamic> json) {
    _totalRa = json['total_ra'];
    _totalBp = json['total_bp'];
    _totalBr = json['total_br'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_ra'] = this._totalRa;
    data['total_bp'] = this._totalBp;
    data['total_br'] = this._totalBr;
    return data;
  }
}

class TopFivePartnerPurchaseValue {
  String _totalQantiy="";
  String _txtName="";

  TopFivePartnerPurchaseValue({String? totalQantiy, String? txtName}) {
    this._totalQantiy = totalQantiy!;
    this._txtName = txtName!;
  }

  String get totalQantiy => _totalQantiy;
  set totalQantiy(String totalQantiy) => _totalQantiy = totalQantiy;
  String get txtName => _txtName;
  set txtName(String txtName) => _txtName = txtName;

  TopFivePartnerPurchaseValue.fromJson(Map<String, dynamic> json) {
    _totalQantiy = json['totalQantiy'];
    _txtName = json['txtName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalQantiy'] = this._totalQantiy;
    data['txtName'] = this._txtName;
    return data;
  }
}

class TopFiveIssuanceCertificate {
  String _totalCount="";
  String _txtName="";

  TopFiveIssuanceCertificate({String? totalCount, String? txtName}) {
    this._totalCount = totalCount!;
    this._txtName = txtName!;
  }

  String get totalCount => _totalCount;
  set totalCount(String totalCount) => _totalCount = totalCount;
  String get txtName => _txtName;
  set txtName(String txtName) => _txtName = txtName;

  TopFiveIssuanceCertificate.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    _txtName = json['txtName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this._totalCount;
    data['txtName'] = this._txtName;
    return data;
  }
}

class TopFiveIssuanceCertificatePartnerWise {
  String _totalCount="";
  String _name="";

  TopFiveIssuanceCertificatePartnerWise({String? totalCount, String? name}) {
    this._totalCount = totalCount!;
    this._name = name!;
  }

  String get totalCount => _totalCount;
  set totalCount(String totalCount) => _totalCount = totalCount;
  String get name => _name;
  set name(String name) => _name = name;

  TopFiveIssuanceCertificatePartnerWise.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this._totalCount;
    data['name'] = this._name;
    return data;
  }
}