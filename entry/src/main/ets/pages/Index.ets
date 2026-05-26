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
  // 状态变量
  // 变量变化 + UI 自动刷新
  @State message: string = '你好';

  // UI 构建函数
  build() {
    // 相对布局容器
    // 类似 Android 中 RelativeLayout
    RelativeContainer() {
      // 文本组件
      // 引用的是状态变量
      // 以后变量变 + 界面会自动变
      Text(this.message)
      // 给组件设置唯一 id
      // 类似 Android 中 android:id="@+id/hello"
      // 测试定位
      // 查找组件
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        // 对齐规则
        .alignRules({
          // 垂直居中
          center: { anchor: '__container__', align: VerticalAlign.Center },
          // 水平居中
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
    }
    // 宽高
    // 页面占满整个屏幕
    .height('100%')
    .width('100%')
  }
}