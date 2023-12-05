
/* 
类的基本定义与使用
*/
(() => {
  class Person {
    // 声明属性(必须写)
    name: string;
    age: number;
  
    // 构造方法
    constructor (name: string, age: number) {
      this.name = name
      this.age = age
    }
  
    // 一般方法
    sayInfo (): void {
      console.log(`我叫${this.name}, 今年${this.age}`)
    }
  }
  // 创建类的实例
  const p = new Person('tom', 12)
  // 调用实例的方法
  p.sayInfo()
})()


/* 
类的继承
*/
;(()=> {
  class Animal {
    run (distance: number) {
      console.log(`Animal run ${distance}m`)
    }
  }
  
  class Dog extends Animal {
    cry () {
      console.log('wang! wang!')
    }
  }
  
  const dog = new Dog()
  dog.cry() 
  dog.run(100) // 可以调用从父中继承得到的方法
  
})()

/* 
访问修饰符
*/
;(() => {
  /* 
  访问修饰符: 用来描述类内部的属性/方法的可访问性
    public: 默认值, 公开的外部也可以访问
    private: 只能类内部可以访问
    protected: 类内部和子类可以访问
  */

  class Animal {
    public name: string

    public constructor (name: string) {
      this.name = name
    }

    public run (distance: number=0) {
      console.log(`${this.name} run ${distance}m`)
    }
  }

  class Person extends Animal {
    private age: number = 18
    protected sex: string = '男'

    run (distance: number=5) {
      console.log('Person jumping...')
      super.run(distance)
    }
  }

  class Student extends Person {
    run (distance: number=6) {
      console.log('Student jumping...')

      console.log(this.sex) // 子类能看到父类中受保护的成员
      // console.log(this.age) //  子类看不到父类中私有的成员

      super.run(distance)
    }
  }

  console.log(new Person('abc').name) // 公开的可见
  // console.log(new Person('abc').sex) // 受保护的不可见
  // console.log(new Person('abc').age) //  私有的不可见
})()


/* 
静态属性与静态方法
*/
;(() => {
  /* 
  静态属性/方法, 是类对象的属性/方法
  非静态属性/方法, 是类的实例对象的属性/方法
  */

  class Person {
    name1: string = 'A'
    static name2: string = 'B'
    static fn () {
      console.log('fn')
    }
    fn2 () {
      console.log('fn2')
    }
  }

  console.log(Person.name2)
  Person.fn()

  console.log(new Person().name1)
  new Person().fn2()
})()