/* 
if 语句
if...else语句
if...else if....else 语句
switch…case 语句
for语句
while语句
for...of
for...in
*/
/* if 语句 */
let num: number = 5;
if (num > 0) {
  console.log("数字是正数");
}

/* if...else语句 */
var num2: number = 12;
if (num2 % 2 == 0) {
  console.log("偶数");
} else {
  console.log("奇数");
}

/* if...else if....else 语句 */
var num3: number = 2;
if (num3 > 0) {
  console.log(num + " 是正数");
} else if (num3 < 0) {
  console.log(num + " 是负数");
} else {
  console.log(num + " 为0");
}

/* switch…case 语句 */
var grade: string = "A";
switch (grade) {
  case "A": {
    console.log("优");
    break;
  }
  case "B": {
    console.log("良");
    break;
  }
  case "C": {
    console.log("及格");
    break;
  }
  case "D": {
    console.log("不及格");
    break;
  }
  default: {
    console.log("非法输入");
    break;
  }
}

let arr = [1, "string", false];

/* for...of */
for (let value of arr) {
    console.log(value)
}

/* for...in */
for (let index in arr) {
  console.log(index, arr[index])
}