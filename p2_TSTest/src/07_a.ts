export const a1 = 123
export const a2 = () => {}

export default function a3 () {}

const a4 = 'abc'
const a5 = {}
export {
  a4,
  a5
}

/* 
模块整体都是一个对象, 任何暴露的语法都是向这个对象中添加属性/方法
{
  a1: 123,
  a2 () {},
  default () {},
  a4: 'abc',
  a5: {}
}
*/