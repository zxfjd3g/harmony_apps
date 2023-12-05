
import router from '@ohos.router';
/*
欢迎路由页面
 */
@Entry
@Component
struct SplashPage {

  @State top: number = 0
  @State iconAlign: FlexAlign = FlexAlign.Start
  @State titleAlign: FlexAlign = FlexAlign.End
  @State flag: boolean = false;

  aboutToAppear() {

    setTimeout(() => {
      animateTo({duration: 2000}, () => {
        this.flag = true
      })
      animateTo({
        duration: 2000,
        curve: Curve.EaseInOut,
        onFinish: () => {
          // 动画完成, 跳转去MainPage
          // 注意: 不能是replaceUrl
          router.pushUrl({ url: 'pages/MainPage'});
          // 清除非当前路由组件(MainPage)的所有路由组件, 也就是清除SplashPage组件
          setTimeout(() => router.clear(), 1000)
        }
      }, () => {
        this.iconAlign = FlexAlign.Center
        this.titleAlign = FlexAlign.Center
      })

    }, 100)
  }

  pageTransition() {
    // 定义页面退出时的效果，向左侧滑出，时长为1000ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionExit({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Left)
  }

  aboutToDisappear() {
    clearTimeout();
  }

  build() {
    Column() {
        Row(){
          if (this.flag) {
            Image($r('app.media.logo'))
              .width('60vp')
              .aspectRatio(1)
              .transition({ type: TransitionType.Insert, opacity: 0})
          }
        }
          .justifyContent(this.iconAlign)
          .width('100%')
          .height('60vp')


        Row(){
          if (this.flag) {
            Column(){
              Text('单词打卡')
                .fontFamily('HarmonyHeiTi-Bold')
                .fontSize('24fp')
                .fontColor('#182431')
                .fontWeight(700)
                .letterSpacing(0.1)
                .margin({ top: 20, bottom: 8 })
              Text('快速记单词神器')
                .fontFamily('HarmonyHeiTi')
                .fontColor('#182431')
                .fontWeight(400)
                .letterSpacing(3.4)
                .opacity(0.6)
                .fontSize('16sp')
            }
              .transition({ type: TransitionType.Insert, opacity: 0})
          }
        }
        .justifyContent(this.titleAlign)
        .width('100%')
    }
      .width('100%')
      .height('100%')
      .padding({
        top: 120,
      })
      .backgroundImagePosition({x: 0, y: 0})
      .backgroundImage($r('app.media.ic_splash_bg'))
      .backgroundImageSize({ width: '100%', height: '100%' })
  }
}