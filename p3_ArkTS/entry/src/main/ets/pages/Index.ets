@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Text('item 1')
      Divider()
      Text('item 2')
      Divider()
      Text($r('app.string.title_value'))
    }
  }
}