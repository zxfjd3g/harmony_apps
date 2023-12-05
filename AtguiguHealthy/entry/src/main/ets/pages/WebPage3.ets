import web_webview from '@ohos.web.webview';

@Entry
@Component
struct WebComponent {
  webviewController: web_webview.WebviewController = new web_webview.WebviewController();

  build() {
    Column() {
      Button('loadUrl')
        .onClick(() => {
          try {
            // 点击按钮时，通过loadUrl，跳转到www.example1.com
            this.webviewController.loadUrl('www.baidu.com');
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
      // 组件创建时，加载www.example.com
      Web({ src: 'www.sina.com', controller: this.webviewController})
    }
  }
}