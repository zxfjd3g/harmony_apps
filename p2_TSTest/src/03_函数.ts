// 命名函数
function add2(x: number, y: number): number {
  return x + y
}
// 匿名函数
let myAdd2 = function(x: number, y: number): number { 
  return x + y
}

// 完整写法
let myAdd3: (x: number, y: number) => number = function(x: number, y: number): number {
    return x + y
}