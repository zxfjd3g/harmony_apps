/**
 * Login page component.
 */

@Entry
@Component
export default struct LoginComponent {

  @State userName: string = '';
  @State code: string = '';

  build() {
    Column(){
      Navigation()
        .title('返回')
        .padding(0)
        .height('50vp')
        .titleMode(NavigationTitleMode.Mini)

      Column() {
        Text('用户登陆')
          .fontSize('25fp')
          .margin({top: '20vp'})


        TextInput({ placeholder: '用户名' })
          .width('100%')
          .height('48vp')
          .placeholderColor('#99182431')
          .placeholderFont({ size: '16fp' })
          .backgroundColor('#00FFFFFF')
          .fontSize('16fp')
          .padding({ left: 0 })
          .onChange((value: string) => {
            this.userName = value;
          })

        Divider()
          .width('100%')
          .height('1vp')
          .color('#33000000')
          .alignSelf(ItemAlign.Center)

        Row(){
          TextInput({ placeholder: '短信验证码' })
            .width('70%')
            .height('48vp')
            .placeholderColor('#99182431')
            .placeholderFont({ size: '16fp' })
            .fontSize('16fp')
            .backgroundColor('#00FFFFFF')
            .padding({ left: 0 })
            .onChange((value: string) => {
              this.code = value;
            })
          Text('获取验证码')
            .width('30%')
            .margin({left: '10vp'})
            .height('48vp')
        }

        Divider()
          .width('100%')
          .height('1vp')
          .color('#33000000')
          .alignSelf(ItemAlign.Center)

        Button('登陆')
          .width('100%')
          .height('40vp')
          .margin({ top: '40vp' })
          .borderRadius('20vp')
          .fontSize('16fp')
          .fontWeight(500)
          .enabled(isLoginButtonClickable(this.userName, this.code))
          .fontColor(isLoginButtonClickable(this.userName, this.code)
            ? Color.White
            : '#66FFFFFF')
          .backgroundColor(isLoginButtonClickable(this.userName, this.code)
            ? '#007DFF' : '#66007DFF')
          .onClick(() => {
            AlertDialog.show({message: '发送登陆请求!'})
          })
      }
      .padding('24vp')
      .width('100%')
      .height('100%')
      .backgroundImage($r('app.media.login_bg'))
      .backgroundImageSize(ImageSize.Cover)
    }

  }
}

/**
 * 判断按钮是否可操作
 */
function isLoginButtonClickable(userName: string, code: string): boolean {
  return userName !== '' && code !== '' && code.length===6;
}