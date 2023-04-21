//问题记录：console.log（）无法传数字，那么什么能输出数字呢
//两个UI组件，可以共同调用用一个组件结构，但是它们之间也有联系，一个被触发时，另一个也要重新构建一下。
@Entry
@Component
struct Home{
  @State ColLeft:string = '#D41616'
  @State ColRight:string = '#D41616'
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
            Butn({Btnlabel:'刷词条',BtnLeftCol:$ColLeft,BtnRightCol:$ColRight,BtnPoi: 1,BtnColOne:'#F2C9C9'})//使用了组件，并且传入Prop值,分别标志着名字，颜色，12代表左右位置，1左，2右
          }.width('50%')
          Row(){
            Butn({Btnlabel:'抽词条',BtnLeftCol:$ColLeft,BtnRightCol:$ColRight,BtnPoi: 2,BtnColOne:'#F2C9C9'})
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

@Component//组件中的每个Link都必须有值
struct Butn{//按钮组件,使用prop进行单项数据绑定,便于每个组件成为不一样的自己,有共同的地方,又有可以改变为单独的地方
  @Link BtnLeftCol:string//按钮颜色
  @Link BtnRightCol:string//按钮颜色
  @Prop BtnColOne: string
  @Prop Btnlabel:string//按钮文字
  @Prop BtnPoi: number//标志左右按钮
  build(){
      Button(this.Btnlabel, { type: ButtonType.Capsule, stateEffect: true })//----------子组件的居中我并没有找到方法,虽然不用了,但是我需要学会
        .backgroundColor(this.BtnColOne).width('80%').height('4%').fontColor('#000000').margin({left:'10%'})//两个按钮的横向布局我直接使用了margin使其根据父组件的位置进行调整
        .onClick(() =>{
          if(this.BtnPoi == 1){//点击左侧
            this.BtnColOne = this.BtnLeftCol//做按钮改颜色
            //this.BtnRightCol = '#F2C9C9'
          }else if(this.BtnPoi == 2){
            this.BtnColOne = this.BtnRightCol//做按钮改颜色
            this.BtnLeftCol = '#F2C9C9'//此处需要重新构建未被激发的Btn组件才可以成功
          }
        })
  }
}
