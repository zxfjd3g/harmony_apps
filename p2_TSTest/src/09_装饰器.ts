(() => {
  /* 
  类装饰器
  @decorator
  class A {}

  // 等同于
  class A {}
  A = decorator(A) || A;
  */
  @decClass
  class MyTestableClass {
    // ...
  }

  function decClass(target: any) { // target被装饰的类
    console.log('target', target)
    // 给类添加静态属性
    target.isTestable = true;
    // 给原型对象添加属性或方法
    target.prototype.isTestable2 = false
  }

  console.log((MyTestableClass as any).isTestable) // true
  console.log((new MyTestableClass() as any).isTestable) // false

})()

;(()=> {
  // 指定自定义参数
  function testable(isTestable: any) {
    return function(target: any) {
      target.isTestable = isTestable;
    }
  }
  @testable(true)
  class MyTestableClass {}
  console.log((MyTestableClass as any).isTestable) // true
  
  @testable(false)
  class MyClass {}
  console.log((MyClass as any).isTestable) // false

})()