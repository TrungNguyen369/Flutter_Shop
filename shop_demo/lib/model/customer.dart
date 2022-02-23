class Customer {
  String? id;
  String? name;
  String? password;
  String? phone;
  String? email;
  String? address;
  String? question;

  Customer(
      {this.id,
        this.name,
        this.password,
        this.phone,
        this.email,
        this.address,
        this.question});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['question'] = this.question;
    return data;
  }

  static bool exsist = false;
  static List<Customer> customer = [];
  static late String useName;
  static late String passWord;
}
