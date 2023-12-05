import router from '@ohos.router'
@Entry
@Component
struct Second {
  @State message: string = 'Hello World'

  build() {
    Row(){
      Column(){
        Text('Second Page')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button(){
          Text('返回')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        // .type(ButtonType.Capsule)
        .margin({top: 20})
        .width('40%')
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}