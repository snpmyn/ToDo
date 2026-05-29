import { EntryPage } from './EntryPage'
import { MinePage } from './MinePage'

// 这是应用入口页面
// 启动 App 时 + 系统优先加载它
// 一个应用通常只有一个 @Entry 页面
@Entry
  // 这是一个 ArkUI 组件
  // 类似 React 或者 Android Compose
  // 这个结构体可以绘制 UI
@Component
  // 定义组件名字
struct Index {
  // // 状态变量
  // // 变量变化 + UI 自动刷新
  // @State message: string = '你好';
  //
  // // UI 构建函数
  // build() {
  //   // 相对布局容器
  //   // 类似 Android 中 RelativeLayout
  //   RelativeContainer() {
  //     // 文本组件
  //     // 引用的是状态变量
  //     // 以后变量变 + 界面会自动变
  //     Text(this.message)
  //     // 给组件设置唯一 id
  //     // 类似 Android 中 android:id="@+id/hello"
  //     // 测试定位
  //     // 查找组件
  //       .id('HelloWorld')
  //       .fontSize($r('app.float.page_text_font_size'))
  //       .fontWeight(FontWeight.Bold)
  //       // 对齐规则
  //       .alignRules({
  //         // 垂直居中
  //         center: { anchor: '__container__', align: VerticalAlign.Center },
  //         // 水平居中
  //         middle: { anchor: '__container__', align: HorizontalAlign.Center }
  //       })
  //       .onClick(() => {
  //         this.message = '欢迎回来';
  //       })
  //   }
  //   // 宽高
  //   // 页面占满整个屏幕
  //   .height('100%')
  //   .width('100%')
  // }
  private tabsController: TabsController = new TabsController()
  @State currentPosition: number = 0

  @Builder
  tabBuilder(index: number, title: string) {
    Column() {
      Text(title)
        .fontSize(18)
        .fontColor(this.currentPosition === index
          ? $r('app.color.color_primary')
          : $r('app.color.text_secondary'))
        .fontWeight(this.currentPosition === index
          ? FontWeight.Bold
          : FontWeight.Normal)

      Divider()
        .width(20)
        .height(3)
        .borderRadius(2)
        .margin({ top: 6 })
        .color(this.currentPosition === index
          ? $r('app.color.color_primary')
          : Color.Transparent)
    }
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Tabs({
        barPosition: BarPosition.End,
        controller: this.tabsController,
        index: this.currentPosition
      }) {
        // 条目
        TabContent() {
          EntryPage()
        }
        .tabBar(this.tabBuilder(0, '条目'))

        // 我的
        TabContent() {
          MinePage()
        }
        .tabBar(this.tabBuilder(1, '我的'))
      }
      // 垂直排版
      .vertical(false)
      // 允许滑动
      .scrollable(true)
      // 动画时长
      .animationDuration(300)
      // 背景颜色
      .barBackgroundColor($r('app.color.tab_bar_background_glass'))
      // 页面切换监听
      .onChange((index: number) => {
        this.currentPosition = index
        console.info('当前页面 = ' + index)
      })
    }
    .width('100%')
    .height('100%')
  }
}