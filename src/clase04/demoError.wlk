class A {
  var property paso = false
  method m1(param){
    param.x()
    self.m2()
  }
  method m2(){ paso = true }
}
object b {
  var property y = 0
  method x(){
    if(y < 0) self.error("BOOM")
  }
}
