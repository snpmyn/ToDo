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
  private tabsController: TabsController = new TabsController()
  // 状态变量
  // 变量变化 + UI 自动刷新
  @State currentPosition: number = 0

  @Builder
  tabBuilder(index: number, title: string) {
    Column() {
      Text(title)
        .fontSize($r('app.float.font_18'))
        .fontColor(this.currentPosition === index
          ? $r('app.color.color_primary')
          : $r('app.color.text_secondary'))
        .fontWeight(this.currentPosition === index
          ? FontWeight.Bold
          : FontWeight.Normal)

      Divider()
        .width($r('app.float.space_20'))
        .height($r('app.float.space_3'))
        .borderRadius($r('app.float.space_2'))
        .margin({ top: $r('app.float.space_6') })
        .color(this.currentPosition === index
          ? $r('app.color.color_primary')
          : Color.Transparent)
    }
    .justifyContent(FlexAlign.Center)
  }

  // UI 构建函数
  build() {
    // 导航组件
    Navigation() {
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
    // 宽占满整个屏幕
    .width('100%')
    // 高占满整个屏幕
    .height('100%')
    // 隐藏工具栏
    .hideToolBar(true)
    // 顶内边距
    .padding({ top: $r('app.float.space_14') })
  }
}