/* 
函数泛型
*/
(() => {
  // 定义一个函数， 根据指定的数量 count 和数据 value , 创建一个包含 count 个 value 的数组

  function createArray(count: number, value: any): any[] {
    const arr: any[] = []
    for (let index = 0; index < count; index++) {
      arr.push(value)
    }
    return arr
  }

  const arr1 = createArray(4, 'abc')
  // arr1[0].length2
  const arr2 = createArray(4, 123.12)
  // arr2[1].toFixed2(1)


  /* 
  在函数上使用泛型： 泛型函数
  1. 定义泛型： 在定义函数的函数名右侧： <大定开头的泛型>   T/K/V
  2. 使用泛型: 在定义函数的形参、返回值和泛型体中通过泛型名使用
  3. 指定泛型的具体类型： 在调用函数时在函数名的右侧：<具体类型>
  */
  function createArray2<T>(count: number, value: T): T[] {
    const arr: T[] = []
    for (let index = 0; index < count; index++) {
      arr.push(value)
    }
    return arr
  }

  const arr3 = createArray2<number>(4, 123.12)
  arr3[2].toFixed()
  const arr4 = createArray2<string>(4, 'abc')
  arr4[2].length


  function swap <K, V> (a: K, b: V): [K, V] {
    return [a, b]
  }
  const result = swap<string, number>('abc', 123)
  console.log(result[0].length, result[1].toFixed())
})();

/* 
接口泛型
*/
(() => {

  class User {
    id?: number
    name: string
    age: number
    constructor (name:string, age: number) {
      this.name = name
      this.age = age
    }
  }

  class Product {
    id?: number
    title: string
    price: number
    constructor (title:string, price: number) {
      this.title = title
      this.price = price
    }
  }


  /* 
  CRUD  增删改查
  c: create  增加
  R: read 查询
  U: update 更新
  D: Delete 删除
  */
  interface BaseCRUD<T> {
    data: T[]
    add (t: T): number
    getById (id: number): T|undefined
  }


  // 封装用户数据管理的类
  class UserCRUD implements BaseCRUD<User> {
    data: User[] = [] // 内部存储的用户数组
    add (user: User): number { // 添加一个用户, 返回其id
      user.id = Date.now()
      this.data.push(user)
      return user.id
    }
    getById (id: number): User|undefined { // 根据id获取一个用户
      return this.data.find(item => item.id===id)
    }
  }

  // 封装商品数据管理的类
  class ProductCRUD implements BaseCRUD<Product> {
    data: Product[] = [] // 内部存储的用户商品
    add (p: Product): number { // 添加一个商品, 返回其id
      p.id = Date.now()
      this.data.push(p)
      return p.id
    }
    getById (id: number): Product|undefined { // 根据id获取一个商品
      return this.data.find(item => item.id===id)
    }
  }

  const userCRUD = new UserCRUD()
  userCRUD.add(new User('tom', 12))
  const id = userCRUD.add(new User('jack', 13))
  console.log(userCRUD.data)
  console.log(userCRUD.getById(id))
})();

/* 
泛型约束
*/
(() => {

  // 没有泛型约束
  function fn <T>(x: T): void {
    // console.log(x.length)  // error
  }

  interface Lengthable {
    length: number;
  }

  // 有泛型约束
  function fn2 <T extends Lengthable>(x: T): void {
    console.log(x.length)  
  }
  fn2('abc')
  // fn2(123) // error
})();