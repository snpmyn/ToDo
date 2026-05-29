import App from "@system.app"

@Component
export struct EntryPage {
  build() {
    Column() {
      Text('条目')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Text('Home Content')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.start_window_background'))
  }
}