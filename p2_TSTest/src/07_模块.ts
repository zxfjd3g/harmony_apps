import('./07_b').then((module) => {
  console.log('-----', module)
})

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