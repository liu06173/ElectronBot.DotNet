# 电子脑壳

<a href="https://www.microsoft.com/store/productId/9NQWDB4MQV0C"><img src="https://cdn.jsdelivr.net/gh/qishibo/img/microsoft-store.png" height="58" width="180" alt="get from microsoft store"></a>

---

电子脑壳是一个为开源桌面机器人ElectronBot和瀚文键盘（HelloWord-Keyboard）提供软件功能的桌面程序项目，使用了微软的WASDK框架和C#语言。

新版本页面

![电子脑壳AI交互版本](/Images/new_version.png)

旧版本页面

![电子脑壳截图](/Images/home1.png)

电子的控制界面

![电子脑壳界面](/Images/HomePage.png)

瀚文键盘的控制
![瀚文界面](/Images/helloworld-%20keyboard.PNG)
## 功能

- 多彩表盘：可以显示时间和自定义文字，也有表盘可以专门显示当前电脑资源占用情况。
![Clock](/Images/clock.png)
- 手势识别语音交互：手势识别结合语音识别进行语音对话交流，可以通过图灵机器人API或ChatGPT对话API进行天气状况询问、简单的笑话回复或智能聊天。（注：需要自己解决网络问题）

- 量子纠缠：此功能可以识别出用户的表情，也可以将用户的面部数据同步到机器人的面部进行播放。
![量子纠缠页](/Images/face.png)

- 表情列表：用户可以自定义自己喜欢的表情数据，然后指定对应的动作文件，可以结合表情和动作进行播放。也可以将制作好的表情进行导出、分享给别人或导入别人分享的表情。
![emojis](/Images/emojis.png)

- 手柄控制：用户连接xbox手柄之后，可以在手柄控制器页面进行电子的控制，可以同时操作底部旋转、手臂旋转、手臂单个展开和头部总共五个舵机。
![xbox](/Images/xbox-controller.png)

- 电子仿真：可以在没有机器人的情况下进行表情的随机播放，进行效果展示。
![ElectronBotModelLoad](/Images/ElectronBotModelLoad.gif)


## 安装

1. 安装Visual Studio 2022，并选择安装WASDK开发组件。
2. 克隆或下载本项目到本地。
3. 打开ElectronBot.Braincase.sln文件，并编译运行。
4. 重点设置启动项目为ElectronBot.Braincase不然会导致运行不了。

## 使用

1. 在首页选择想要使用的功能模块，并点击进入。
2. 根据不同模块的提示操作或设置参数。
3. 点击返回按钮返回首页或退出程序。

## 配置

在设置页面，你可以配置以下参数：

- 串口号：选择与ElectronBot硬件设备连接的串口号。
- 图灵机器人API密钥：输入你申请到的图灵机器人API密钥，用于实现语音交互功能。
- ChatGPT对话API地址：输入你搭建或访问到的ChatGPT对话API地址，用于实现智能聊天功能。

## 参考项目及依赖

本项目参考的项目和依赖：

+ [项目模板——TemplateStudio](https://github.com/microsoft/TemplateStudio)
+ [表盘参考项目——一个番茄钟](https://github.com/DinoChan/OnePomodoro)
+ [社区工具集——CommunityToolkit](https://github.com/CommunityToolkit/WindowsCommunityToolkit)
+ [控件库展示demo——WinUI-Gallery](https://github.com/microsoft/WinUI-Gallery)
+ [图像处理库——opencvsharp](https://github.com/shimat/opencvsharp)
+ [Emoji8 表情识别例子](https://github.com/microsoft/Windows-Machine-Learning/tree/master/Samples/Emoji8/UWP/cs)
+ [helix-toolkit](https://github.com/helix-toolkit/helix-toolkit)
+ [Semantic Kernel](https://github.com/microsoft/semantic-kernel)

## 许可证

本项目采用MIT许可证发布。

树莓派连接ElectronBot项目介绍

![封面](/Images/videoCar.jpg)
