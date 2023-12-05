import { CustomDialogCallback } from './CustomDialogView';
import TaskInfo from '../../viewmodel/TaskInfo';
import { TaskMapById } from '../../model/TaskInitList';
import { CommonConstants as Const } from '../../common/constants/CommonConstants';
import { GlobalContext } from '../../common/utils/GlobalContext';

@Extend(Text) function textStyle () {
  .fontColor($r('app.color.white'))
  .fontFamily($r('app.string.HarmonyHeiTi'))
}

@Extend(Text) function taskTextStyle () {
  .fontColor($r('app.color.white'))
  .width('100%')
}

@CustomDialog
export struct TaskDetailDialog {
  controller: CustomDialogController = new CustomDialogController({ builder: '' });
  @Consume currentTask: TaskInfo;
  @State showButton: boolean = true;
  @Consume dialogCallBack: CustomDialogCallback;

  build() {
    Column() {
      TaskBaseInfo({
        taskName: TaskMapById[this.currentTask?.taskID - 1].taskName
      });

      TaskClock({
        confirm: () => {
          this.dialogCallBack.confirmCallback(this.currentTask);
          this.controller.close();
        },
        cancel: () => {
          this.controller.close();
        },
        showButton: this.showButton
      })
    }
    .height($r('app.float.default_451'))
    .width($r('app.float.default_316'))
    .backgroundImage(TaskMapById[this.currentTask?.taskID - 1].dialogBg, ImageRepeat.NoRepeat)
    .backgroundImageSize({
      width: '100%',
      height: '100%'
    })
    .justifyContent(FlexAlign.End)
    .padding({
      bottom: $r('app.float.default_12'),
      left: $r('app.float.default_20')
    })
  }
}

@Component
struct TaskBaseInfo {
  taskName: string | Resource = '';

  build() {
    Column({ space: Const.DEFAULT_8 }) {
      Text(this.taskName)
        .fontSize($r('app.float.default_22'))
        .fontWeight(FontWeight.Bold)
        .fontFamily($r('app.string.HarmonyHeiTi_Bold'))
        .taskTextStyle()
        .margin({left: $r('app.float.default_12')})
    }
    .position({ y: $r('app.float.default_267') })
  }
}

@Component
struct TaskClock {
  confirm: Function = () => {};
  cancel: Function = () => {};
  showButton: boolean = false;

  build() {
    Column({ space: Const.DEFAULT_12 }) {
      Button() {
        Text($r('app.string.clock_in'))
          .height($r('app.float.default_42'))
          .fontSize($r('app.float.default_20'))
          .fontWeight(FontWeight.Normal)
          .textStyle()
      }
      .width($r('app.float.default_220'))
      .borderRadius($r('app.float.default_24'))
      .backgroundColor('rgba(255,255,255,0.40)')
      .onClick(() => {
        GlobalContext.getContext().setObject('taskListChange', true);
        this.confirm();
      })
      .visibility(!this.showButton ? Visibility.None : Visibility.Visible)

      Text($r('app.string.got_it'))
        .fontSize($r('app.float.default_14'))
        .fontWeight(FontWeight.Regular)
        .textStyle()
        .onClick(() => {
          this.cancel();
        })
    }
  }
}