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

      Column(){//内容区域
        Row(){
          Row(){
            Butn({ButnCol:'#FFFFFF'})
          }.width('50%')
          Row(){
            Butn({ButnCol:'#FFFFFF'})
          }.width('50%')
        }.margin({top:'2%'}).width('100%')

        Row(){//--------抽奖机逻辑

        }
      }.backgroundColor('#AFADAD').width('100%').height('80%')


      Row(){
        Text("首页")
          .layoutWeight(1).fontSize(23)
        Text("主页")
          .layoutWeight(1).fontSize(23)
        Text("个人")
          .layoutWeight(1).fontSize(23)
      }.width('100%').height('10%')
    }.height('100%')
  }
}

@Component
struct Butn{//按钮组件,使用prop进行单项数据绑定,便于每个组件成为不一样的自己,有共同的地方,又有可以改变为单独的地方
  @Prop ButnCol:string
  build(){
    Button('刷词条', { type: ButtonType.Capsule, stateEffect: true })//----------子组件的居中我并没有找到方法,虽然不用了,但是我需要学会
      .backgroundColor(this.ButnCol).width('80%').height('4%').fontColor('#000000').margin({left:'10%'})//两个按钮的横向布局我直接使用了margin使其根据父组件的位置进行调整
      .onClick(() =>{
        this.ButnCol = '#D0CACA'//-------这种方法属于双向数据绑定,一个动,全部动,所以我希望每个数据都是独立的,但是结构又是共同的
      })
  }
}
