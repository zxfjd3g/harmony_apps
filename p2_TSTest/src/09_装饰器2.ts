(() => {
  /* 
  类的属性装饰器
    参数1: 函数的原型对象
    参数2: 属性名
  */
  function decProp(target: any, name: any) {
    console.log('decProp', target, name)
  }
  
  /* 
  类的属性或方法的装饰器
    参数1: 函数的原型对象
    参数2: 方法名
    参数3: 方法的属性描述符对象
  */
  function log(target: any, name: any, descriptor: any) {
    console.log('log', target, name, descriptor)
    var fn = descriptor.value;
    descriptor.value = function() {
      console.log(`调用 "${name}" with`, arguments);
      return fn.apply(null, arguments);
    };
    return descriptor;
  }

  class Person {
    @decProp name: string = 'abc'

    constructor(name: string) {
      console.log('constructor')
      this.name = name
    }

    @log
    test (val: any) {

    }
  }
  const p = new Person('bob')
  p.test(123)
})()