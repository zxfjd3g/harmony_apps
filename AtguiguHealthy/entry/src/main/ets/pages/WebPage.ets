// xxx.ets
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
            // 点击按钮时，通过loadUrl，跳转到local1.html
            this.webviewController.loadUrl($rawfile("local2.html"));
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
      Button('runJavaScript')
        .onClick(() => {
          this.webviewController.runJavaScript('htmlTest()');
        })
      // 组件创建时，通过$rawfile加载本地文件local.html
      Web({ src: $rawfile("local.html"), controller: this.webviewController })


    }
  }
}