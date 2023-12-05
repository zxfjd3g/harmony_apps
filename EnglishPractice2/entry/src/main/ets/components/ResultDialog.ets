import { convertMillisecondsToTime } from '../commons/util/DateUtil';

@CustomDialog
@Preview
export struct ResultDialog {
  controller: CustomDialogController
  passCount: number;
  correctCount: number;
  timeUsed: number;
  start: () => void;

  build() {
    Column({ space: 10 }) {
      Row() {
        Image($r('app.media.ic_timer')).width('24vp').margin({ right: 10 })
        Text('用时')
        Blank()
        Text(convertMillisecondsToTime(this.timeUsed))
      }.width('100%')

      Row() {
        Image($r('app.media.ic_correct')).width('24vp').margin({ right: 10 })
        Text('准确率')
        Blank()
        Text((this.passCount === 0 ? 0 : this.correctCount / this.passCount * 100).toFixed(0) + '%')
      }.width('100%')

      Row() {
        Image($r('app.media.ic_count')).width('24vp').margin({ right: 10 })
        Text('单词总数')
        Blank()
        Text(this.passCount.toString())
      }.width('100%')

      Divider()

      Row() {
        Button('再来一局').onClick(() => {
          this.controller.close();
          this.start();
        }).backgroundColor('#3BCDDD')
          .height('30vp')
        Button('关闭').onClick(() => {
          this.controller.close();
        }).backgroundColor('#3BCDDD')
          .height('30vp')
      }.width('100%')
      .justifyContent(FlexAlign.SpaceAround)
    }
    .padding(20)
  }
}