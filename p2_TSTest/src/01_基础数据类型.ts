(() => {
  /* 
  1. boolean
  2. number
  3. string
  4. undefined 和 null
  5. 数组
  6. 元组
  7. 枚举
  9. unknown
  10. void
  11. object
  12. 联合类型
  */

  /* 1. boolean */
  let isDone: boolean = false;
  isDone = true;
  // isDone = 2 // error

  /* 2. number */
  let age: number = 10 // 十进制
  let age2: number = 0b1010  // 二进制
  let age3: number = 0o12 // 八进制
  let age4: number = 0xa // 十六进制

  /* 3. string */
  let name:string = 'tom'
  name = 'jack'
  // name = 12 // error
  const info: string = `我叫${name}, 今年${age}`

  /* 4. undefined 和 null */
  let u: undefined = undefined
  let n: null = null

  /* 5. 数组 */
  let list1: number[] = [1, 2, 3]
  let list2: Array<number> = [1, 2, 3]
  // list2.push('abc') // error
  list2.push(3) 

  /* 6. 元组 */
  let t1: [string, number]
  t1 = ['hello', 10] // OK
  // t1 = [10, 'hello'] // Error

  /* 7. 枚举 */
  // 默认是数值枚举
  enum Color {
    Red,
    Yellow=2,
    Blue
  }
  console.log(Color)

  let color: Color = Color.Yellow
  // color = -1   // 数值枚举有问题: 变量可以为别的值

  let cat = {
    name: 'tom',
    color: 1
  }

  switch (cat.color) {
    case Color.Red:
      console.log('你的猫是红色的')
      break;
    case Color.Yellow:
      console.log('你的猫是黄色的')
      break;
    case Color.Blue:
      console.log('你的猫是蓝色的')
      break;
    default:
      console.log('你的猫是其它色的')
  }

  // 字符串枚举
  enum Status {
    padding = 'Padding',
    resolved = 'Resolved',
    rejected = 'Rejected'
  }
  
  let status: Status = Status.padding
  // status = 'abc'  // error 不能是枚举之外的值

  /* 9. unknown */
  let notSure: unknown = 4;
  notSure = 'maybe a string instead';
  notSure = false;

  /* 10. void */
  function test(): void {
    console.log('This is function is void');
    // return null // error

    // return undefined
  }

  /* 11. object */
  function fn2(): object {
    // return 1 // error
    // return null // error
    // return undefined // error
    // return {}
    // return () => {}
    return []
  }

  /* 11. 联合类型 */
  let c1: number | string = 3
  c1 = 'abc'
  // c1 = true // error
  let c2: object|null = null
  c2 = {}
  // c2 = 3 // error
})()


