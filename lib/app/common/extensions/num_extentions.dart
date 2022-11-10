extension EnumExtention on Enum {
  String toStr() => toString().split('.').last;
}
