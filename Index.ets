@Entry
@Component
struct Home{
  build() {
    Column(){

      Row(){//顶部栏
        Text("理  论  街  道")
          .fontSize('32').layoutWeight(8)

        Image('/pictures/search.jpg')
          .layoutWeight(2)
      }
      .width('100%').height('10%')
      .border({
        width: {bottom: '1lpx' },
        color: '#6C6666',
      })

      //-------需要一个边框现来区分顶部与内容部

      Column(){//内容区域
        Row(){
          Row(){
            Button('刷词条', { type: ButtonType.Capsule, stateEffect: true })//两个按钮之间需要保持距离
              .backgroundColor('#FFFFFF').width('60%').height('5%').fontColor('#000000').align(Alignment.Center)
          }.width('50%').backgroundColor('red')
          Row(){
            Button('抽词条', { type: ButtonType.Capsule, stateEffect: true })
              .backgroundColor('#FFFFFF').width('60%').height('5%').fontColor('#000000').align()
          }.width('50%')
        }.margin({top:'2%'}).width('100%')

        Row(){//--------抽奖机逻辑

        }
      }.backgroundColor('#EFC8E0').width('100%').height('70%')


      Row(){
        Text("首页")
          .layoutWeight(1).backgroundColor('#B3B5C0')
        Text("主页")
          .layoutWeight(1)
        Text("个人")
          .layoutWeight(1)
      }.backgroundColor('#777EA9').width('100%').height('20%')
    }.height('100%')
  }
}
