import { CurrentStatus } from '../commons/enum/CurrentStatus';
import { PracticeStatus } from '../commons/enum/PracticeStatus';
import { ResultDialog } from '../components/ResultDialog';
import { Question, questionData } from '../datamodel/QuestionData';
import Prompt from '@system.prompt';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  @State passCount: number = 0;
  @State correctCount: number = 0;
  @State questions: Question[] = [];
  @State practiceStatus: PracticeStatus = PracticeStatus.STOPPED;
  @State timeUsed: number = 0;
  @State currentStatus: CurrentStatus = CurrentStatus.WAITING;
  @State selectedAnswer: string = '';
  @State select: number = 1
  numbers: string[] = ['5', '10', '15', '20']
  textTimerController: TextTimerController = new TextTimerController()
  dialogController: CustomDialogController = new CustomDialogController({
    builder: ResultDialog({
      passCount: this.passCount,
      correctCount: this.correctCount,
      timeUsed: this.timeUsed,
      start: () => {
        this.start();
      }
    }),
    autoCancel: false
  })

  pageTransition() {
    // 定义页面进入时的效果，从右侧滑入，时长为1000ms
    PageTransitionEnter({ type: RouteType.Push, duration: 1000 }).slide(SlideEffect.Right)
  }

  build() {
    Column() {
      //控制面板
      Column({ space: 10 }) {
        //准确率
        Row() {
          Image($r('app.media.ic_correct')).width('24vp').margin({ right: 10 })
          Text('准确率')
          Blank()
          Text((this.passCount === 0 ? 0 : this.correctCount / this.passCount * 100).toFixed(0) + '%')
            .width(100).textAlign(TextAlign.Center)
        }
        .width('100%')

        //进度
        Row() {
          Image($r('app.media.ic_progress')).width('24vp').margin({ right: 10 })
          Text('进度')
          Blank()
          Progress({
            type: ProgressType.Linear,
            value: this.passCount,
            total: parseInt(this.numbers[this.select]),
          })
            .width(100)
        }.width('100%')

        //个数
        Row() {
          Image($r('app.media.ic_count')).width('24vp').margin({ right: 10 })
          Text('个数')
          Blank()
          Button(this.numbers[this.select])
            .width(100)
            .height(26)
            .backgroundColor('#EBEBEB')
            .fontColor(this.practiceStatus===PracticeStatus.STOPPED?Color.Black:Color.Gray)
            .enabled(this.practiceStatus==PracticeStatus.STOPPED)
            .onClick(() => {
              TextPickerDialog.show({
                range: this.numbers,
                selected: this.select,
                onAccept: (value: TextPickerResult) => {
                  // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                  this.select = value.index
                  console.log(this.select.toString());
                  this.getQuestions(parseInt(this.numbers[this.select]))
                }
              })
            })
        }.width('100%')

        //用时
        Row() {
          Image($r('app.media.ic_timer')).width('24vp').margin({ right: 10 })
          Text('用时')
          Blank()
          Column(){
            TextTimer({ controller: this.textTimerController })
              .onTimer((utc, elapsedTime) => {
                this.timeUsed = elapsedTime;
              })
          }
            .width(100)

        }
        .width('100%')

        Divider()
        //控制按钮
        Row() {
          Column(){
            Image(this.practiceStatus !== PracticeStatus.STOPPED ? $r('app.media.ic_stop') : $r('app.media.ic_stop_disable'))
              .width('30vp')
          }
            .padding(5)
            .margin({
              right: 20
            })
            .onClick(() => {
              this.stop();
            })
            .enabled(this.practiceStatus !== PracticeStatus.STOPPED)

          Column(){
            Image(this.practiceStatus === PracticeStatus.RUNNING ? $r('app.media.ic_pause') : $r('app.media.ic_start'))
              .width('30vp')
          }
            .padding(5)
            .margin({
              left: 20
            })
            .onClick(() => {
              if (this.practiceStatus === PracticeStatus.RUNNING) {
                this.pause();
              } else {
                this.start();
              }
            })
        }
          .width('100%')
          .justifyContent(FlexAlign.Center)

      }
      .width('90%')
      .backgroundColor(Color.White)
      .margin({ top: 15 })
      .borderRadius(15)
      .padding(15)

      Blank()
      //英文单词
      Text(this.questions[this.currentIndex].word).fontSize(50).fontWeight(FontWeight.Bold)
      Blank()
      //答案选项
      if (this.questions.length > 0) {
        Column({ space: 20 }) {
          ForEach(this.questions[this.currentIndex].options, (item) => {
            Button(item)
              .width('90%')
              .backgroundColor(this.getButtonColor(item, this.questions[this.currentIndex].answer))
              .stateEffect(false)
              .fontColor(Color.Black)
              .height(50)
              // .enabled(this.practiceStatus === PracticeStatus.RUNNING && this.currentStatus === CurrentStatus.WAITING)
              .onClick(() => {
                if (this.practiceStatus!==PracticeStatus.RUNNING) {
                  Prompt.showToast({message: '还没有启动,请先点击开始按钮'})
                  return
                }
                this.currentStatus = CurrentStatus.SELECTED;
                this.selectedAnswer = item;

                if (item === this.questions[this.currentIndex].answer) {
                  this.correctCount++;
                }

                this.passCount++;

                setTimeout(() => {
                  if (this.hasNext()) {
                    this.currentStatus = CurrentStatus.WAITING;
                    this.selectedAnswer = '';
                    this.currentIndex++;
                  } else {
                    this.stop()
                  }
                }, 500)

              })
          }, (item) => JSON.stringify(item))
        }.width('90%')
        .margin({ bottom: 15 })
      } else {
        Text('点击开始')
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#EFEFEF')
  }

  getButtonColor(currentOption: string, correctAnswer: string) {
    if (this.currentStatus === CurrentStatus.WAITING) {
      return Color.White;
    } else if (currentOption === correctAnswer) {
      return Color.Green;
    } else if (currentOption === this.selectedAnswer) {
      return Color.Red;
    } else {
      return Color.White;
    }
  }

  hasNext(): boolean {
    return this.currentIndex < this.questions.length - 1;
  }

  getQuestions(count: number) {
    this.questions = questionData.sort(() => 0.5 - Math.random()).slice(0, count)
  }

  aboutToAppear() {
    this.reset();
  }

  reset() {
    this.textTimerController.reset();
    this.currentIndex = 0;
    this.passCount = 0;
    this.correctCount = 0;
    this.getQuestions(parseInt(this.numbers[this.select]))
    this.currentStatus = CurrentStatus.WAITING;
    this.selectedAnswer = '';
  }

  stop() {
    this.dialogController.open();
    this.practiceStatus = PracticeStatus.STOPPED;
    this.reset();
  }

  start() {
    this.practiceStatus = PracticeStatus.RUNNING;
    this.textTimerController.start();
  }

  pause() {
    this.practiceStatus = PracticeStatus.PAUSED;
    this.textTimerController.pause();
  }
}