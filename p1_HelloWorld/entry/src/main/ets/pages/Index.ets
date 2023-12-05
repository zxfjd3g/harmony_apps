import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'First Page'

  build() {
    Row() {
      Column() {
    Text(this.message)
      .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .width('40%')
        .height('5%')
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          // this.message += '--'
          router.pushUrl({ url: 'pages/Second' })
            .then(
              () => {
                console.info('Succeeded in jumping to the second page.')
              },
              (err) => {
                console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
              }
            )
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}