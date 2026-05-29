@Component
export struct EntryPage {
  // UI 构建函数
  build() {
    Column() {
      Text('条目')
        .fontSize($r('app.float.font_30'))
        .fontWeight(FontWeight.Bold)
      Text('Home Content')
        .margin({ top: $r('app.float.space_20') })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.start_window_background'))
  }
}