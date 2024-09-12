class StudentModel {
  int? studentId;
  String? studentName;
  String? email;
  String? address;
  String? cell;

  StudentModel(
      {this.studentId, this.studentName, this.email, this.address, this.cell});

  StudentModel.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
    email = json['email'];
    address = json['address'];
    cell = json['cell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentId'] = studentId;
    data['studentName'] = studentName;
    data['email'] = email;
    data['address'] = address;
    data['cell'] = cell;
    return data;
  }
}
