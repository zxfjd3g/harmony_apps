
import { CommonConstants as Const } from '../../common/constants/CommonConstants';

@Styles function allSize () {
  .width(Const.THOUSANDTH_1000)
  .height(Const.THOUSANDTH_1000)
}

@Component
export default struct AddBtn {
  clickAction: Function = () => {};

  build() {
    Button({ type: ButtonType.Circle, stateEffect: false }) {
      Image($r('app.media.ic_home_add'))
        .allSize()
        .borderRadius(Const.BORDER_RADIUS_PERCENT_50)
    }
    .onClick(() => this.clickAction())
    .zIndex(Const.HOME_BTN_Z)
    .position({ x: Const.THOUSANDTH_830, y: Const.THOUSANDTH_880 })
    .width($r('app.float.default_48'))
    .height($r('app.float.default_48'))
  }
}