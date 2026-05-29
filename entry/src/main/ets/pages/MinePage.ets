@Component
export struct MinePage {
  build() {
    Column() {
      Text('我的')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Text('Mine Content')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.start_window_background'))
  }
}