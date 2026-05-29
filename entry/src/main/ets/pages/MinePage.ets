@Component
export struct MinePage {
  // UI 构建函数
  build() {
    Column() {
      Text('我的')
        .fontSize($r('app.float.font_30'))
        .fontWeight(FontWeight.Bold)
      Text('Mine Content')
        .margin({ top: $r('app.float.space_20') })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.start_window_background'))
  }
}