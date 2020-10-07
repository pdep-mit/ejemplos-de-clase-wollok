class A {
  method m1() = "Hola "
  method m2() = "Adios "
  method m3() = "Aloha "
}
class B inherits A{
  override method m1() = super() + "Pepe"
  override method m2() = "Chau"
  method m4() = "¿Como estas? "
  method m5() = self.m3()
}
class C inherits B{
  override method m3() = super() + "Lilo"
  override method m4() = super() + self.m1()
  method m6() = self.m1() + " " + self.m5()
}
