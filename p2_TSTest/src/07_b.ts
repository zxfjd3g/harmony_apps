/* 
import {a1, a2, a4, a5} from './a.js'
// import {default as xxxx} from './a' // 完整写法
import xxxx from './a' // 简写
import * as a from './a' 
*/

export {a1, a2, a4, a5} from './07_a'
export {default as xxx} from './07_a'
export * as a from './07_a'

/* 
{
  a1, a2, a4, a5
  xxx:  function () {},
  a: {
    a1: 123,
    a2 () {},
    default () {},
    a4: 'abc',
    a5: {}
  }
}
*/