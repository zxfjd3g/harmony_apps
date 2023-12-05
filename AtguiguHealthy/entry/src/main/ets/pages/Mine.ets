import {MineInfoList, InfoItem} from '../model/MineModel'

@Entry
@Component
struct Mine {

  build() {
    Column(){
      Column() {
        // userIcon
        Image($r('app.media.ic_user'))
          .objectFit(ImageFit.Contain)
          .height('66vp')
          .width('66vp')
          .margin({ top: '71vp' })

        Column() {
          Text('LV.7')
            .fontSize('12vp')
            .fontWeight(FontWeight.Bolder)
            .fontColor('#c99411')
        }
          .width('44vp')
          .height('16vp')
          .margin({ top: '-8vp' })
          .border({ radius: '5vp' })
          .backgroundColor('#d4e6f1')
          .justifyContent(FlexAlign.Center)

        // nickname
        Text('未登陆')
          .fontSize('20vp')
          .fontFamily('Helvetica')
          .margin({ bottom: '6vp' })
          .fontWeight(FontWeight.Normal)
          .fontColor('#000000')

        // signature
        Text('还没有个性签名')
          .fontSize('16vp')
          .fontWeight(FontWeight.Normal)
          .fontFamily('PingFangSC-Regular')
          .fontColor('#66686a')
      }

      List() {
        ForEach(MineInfoList, (item: InfoItem) => {
          ListItem() {
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              Text(item.title)
                .fontSize('16vp')
                .height('40vp')

              Image($r('app.media.ic_right_grey'))
                .objectFit(ImageFit.Contain)
                .height('12vp')
                .width('7vp')
            }
          }
          .backgroundColor('#FFFFFF')
          .margin({
            left: '24vp',
            right: '24vp'
          })
          .height('48vp')
          .border({
            width: { bottom: '1vp' },
            color: '#cccccc'
          })

        }, (item: InfoItem) => JSON.stringify(item));
      }
      .border({
        radius: {
          topLeft: '24vp',
          topRight: '24vp'
        }
      })
      .backgroundColor('#ffffff')
      .margin({ top: '24vp' })
      .padding({ top: '24vp' })
      .flexGrow(1)
      .clip(true)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#edf2f5')
  }
}