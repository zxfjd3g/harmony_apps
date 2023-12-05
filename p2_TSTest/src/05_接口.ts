(() => {
  /* 利用接口来约束对象 */
  /* 
  需求: 创建人的对象, 需要对人的属性和方法进行一定的约束
    id是number类型, 必须有, 只读的
    name是string类型, 必须有
    age是number类型, 必须有
    sex是string类型, 可以没有
    sum: 计算返回2个数的和的方法, 必须有
  */
  interface IPerson {
    readonly id: number; // 只读属性
    name: string;
    age: number;
    sex?: string;  // sex是可以没有的
    sum (x: number, y: number): number
  }

  const person: IPerson = {
    id: 2,
    name: 'tom',
    age: 12,
    // sex: '男',
    sum (a: number, b: number): number {
      return a + b
    }
  };
  person.name = 'tom'
  // person.id = 3  // error


  /* 使用接口约束函数 */
  interface SearchFn {
    (x: string, y: string): boolean
  }

  let fn: SearchFn = function (a: string, b: string): boolean {
    return a.includes(b)
  }

  const fn2: (a: string, b: string) => boolean = function (a: string, b: string): boolean {
    return a.includes(b)
  }


  /* 使用接口来约束类   => 类去实现接口 */
  interface Alarm {
    alert(): void
  }

  interface Light {
    lightOn (): void
    lightOff (): void
  }

  class Car implements Alarm, Light {
    alert(): void {
      console.log('Car alert')
    }

    lightOn (): void {
      console.log('Car ligntOn')
    }
    lightOff (): void {
      console.log('Car lightOff')
    }
  }
  new Car().alert()
  new Car().lightOff()
  new Car().lightOn()
  // new Car().lightOn2() // error

  interface LightableAlarm extends Alarm, Light {
    test (): void
  }
  
  class Car2 implements LightableAlarm {
    alert(): void {
      console.log('Car2 alert')
    }

    lightOn (): void {
      console.log('Car2 ligntOn')
    }
    lightOff (): void {
      console.log('Car2 lightOff')
    }

    test (): void {
      
    }
  }
})();


/* 
TS类型检查的好处
1. 正确语法的补全提示
2. 错误语法的错误提示
*/