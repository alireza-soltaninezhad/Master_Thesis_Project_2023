class InsuranceType {

  final String name;
  final String icon;
  final String loginUri;

  InsuranceType(this.name, this.icon, this.loginUri);

  @override
  bool operator ==(dynamic other) =>
      other != null && other is InsuranceType && name == other.name && icon == other.icon && loginUri == other.loginUri;

  @override
  int get hashCode => super.hashCode;


}