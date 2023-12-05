
interface MessageItem {
  id: number;
  user: {
    id: number;
    avatar: string;
    name: string;
  };
  content: string;
  image?: string;
  video?: string;
}

@Builder function Item (item: MessageItem) {
  Row() {
    Flex({ direction: FlexDirection.Row }) {
      Image(item.user.avatar)
        .width('40vp')
        .height('40vp')
        .objectFit(ImageFit.Fill)
      Flex({ direction: FlexDirection.Column }) {
        Text(item.user.name)
          .fontSize('15vp')
          .fontColor('#5e698f')
        Text(item.content)
          .fontSize('15vp')
          .fontColor('#000000')
          .margin({
            top: '5vp',
            bottom: '10vp'
          })
        Image(item.image)
          .height('180vp')
          .width('180vp')
        Flex({direction: FlexDirection.Row, alignItems: ItemAlign.Center}) {
          Image($r('app.media.star_selected'))
            .width('20vp')
            .height('20vp')
          Text('5')
            .margin({left: '5vp'})
            .fontSize('15vp')
            .fontColor('#333333')
        }
        .height('20vp')
        .width('100%')
        .margin({top: '5vp'})
      }
      .width('100%')
      .margin({
        left: '15vp',
        // top: '5vp'
      })

    }
    .height('100%')
    .width('100%')
    .padding('10vp')
    // .backgroundColor('#cccccc')
  }
  .height('250vp')
  // .padding('10vp')
}


@Entry
@Component
struct GroupPage {

  @State MessageListModel: MessageItem[] = [
    {
      id: 1,
      user: {
        id: 1,
        avatar: 'https://img1.baidu.com/it/u=4247449131,2076857309&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500',
        name: 'AA'
      },
      content: 'AABBCCDDEE',
      image: 'https://t7.baidu.com/it/u=2604797219,1573897854&fm=193&f=GIF'
    },
    {
      id: 2,
      user: {
        id: 3,
        avatar: 'https://img1.baidu.com/it/u=4247449131,2076857309&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500',
        name: 'BB'
      },
      content: 'AABBCCDDEE',
      image: 'https://t7.baidu.com/it/u=2604797219,1573897854&fm=193&f=GIF'
    },
    {
      id: 3,
      user: {
        id: 3,
        avatar: 'https://img1.baidu.com/it/u=4247449131,2076857309&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500',
        name: 'BB'
      },
      content: 'AABBCCDDEE',
      image: 'https://t7.baidu.com/it/u=2604797219,1573897854&fm=193&f=GIF'
    },
    {
      id: 4,
      user: {
        id: 3,
        avatar: 'https://img1.baidu.com/it/u=4247449131,2076857309&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500',
        name: 'WW'
      },
      content: 'AABBCCDDEE',
      image: 'https://t7.baidu.com/it/u=2604797219,1573897854&fm=193&f=GIF'
    },

    {
      id: 5,
      user: {
        id: 3,
        avatar: 'https://img1.baidu.com/it/u=4247449131,2076857309&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500',
        name: 'EE'
      },
      content: 'AABBCCDDEE',
      image: 'https://t7.baidu.com/it/u=2604797219,1573897854&fm=193&f=GIF'
    }
  ]


  build() {

    Column(){
      Navigation()
        .title('健康圈子')
        .height('50vp')
        .titleMode(NavigationTitleMode.Mini)
        .hideBackButton(true)

      List(){
        ForEach(this.MessageListModel, (item) => {
          Item(item)
        })
      }
      .padding('10vp')
      .width('100%')
      // .height('100%')
    }
      .height('100%')
  }
}