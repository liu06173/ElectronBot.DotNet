# ElectronBot.DotNet 项目标注 Prompt 列表

---

**1.** `[中等] [Bug 修复]` | 模块: `src/Verdure.Braincase/ViewModels/HomeViewModel.cs` | 技术栈: C#, WinUI 3 | 功能模块: 操作日志

> HomeViewModel 的 OnNavigatedFrom 方法中第260-262行有一个定时器事件泄漏bug：当页面离开时，代码写的是 `_dispatcherTimer.Tick += DispatcherTimer_Tick`，应该是 `-=` 才能正确取消订阅。这导致每次导航离开 HomePage 再返回时，定时器事件处理程序会被重复订阅，造成内存泄漏和重复执行。请修复这个 bug。

**2.** `[中等] [Bug 修复]` | 模块: `src/Verdure.ElectronBot.GrpcService/EmojiPlayHelper.cs` | 技术栈: C#, gRPC | 功能模块: 下载引擎

> EmojiPlayHelper 的播放循环存在并发缺陷：RunPlayAsync 方法在 lock 语句块内调用 Thread.Sleep，阻塞了其他需要获取同一锁的 Enqueue 调用。同时 Enqueue 方法（第91行）完全没有加锁保护，在高并发场景下可能导致数据竞争和队列损坏。请修复这些并发问题，确保线程安全且不阻塞入队操作。

**3.** `[中等] [Bug 修复]` | 模块: `src/Devices/ElectronBot.DotNet.WinUsb/WinUsbElectronLowLevel.cs` | 技术栈: C#, LibUsbDotNet | 功能模块: 下载引擎

> WinUsbElectronLowLevel 的 _wholeUsbDevice 字段在构造函数中被设置为 null，但在 Connect() 方法中从未被重新赋值，导致设备查找失败。相比之下 LibUsbElectronLowLevel 的实现是正确的。请修复 WinUsbElectronLowLevel 的 Connect() 方法，使其能正确查找和连接 USB 设备。

**4.** `[简单] [Bug 修复]` | 模块: `src/Modules/Verdure.Braincase.Copilot.Plugin/Functions/ControlTheLightsFn.cs` | 技术栈: C#, BotSharp | 功能模块: API 调用

> ControlTheLightsFn 目前返回的是披萨价格的模拟数据而非灯光控制数据，这是一个明显的占位符实现。请修改此函数，使其返回合理的灯光控制相关模拟数据（如亮度、颜色、开关状态等），或者如果该功能尚不可用，至少返回有意义的错误消息而不是无关数据。

**5.** `[中等] [功能迭代]` | 模块: `src/Verdure.ElectronBot.GrpcService/Services/ElectronBotActionService.cs` | 技术栈: C#, gRPC | 功能模块: 下载引擎

> PlayEmoitonActions 批处理方法（第44-74行）使用 Task.Run 对每个批处理项进行 fire-and-forget 处理，没有速率限制和错误处理。在高并发请求下可能导致线程池泛滥。请为重放逻辑添加适当的速率限制（如 SemaphoreSlim 控制并发度）和错误处理（捕获单个帧失败的异常并记录日志），确保服务稳定性。

**6.** `[困难] [代码重构]` | 模块: `src/Verdure.Braincase/Services/CameraEmojis/`, `src/Verdure.Braincase/Services/ElectronBot/VisionService.cs` | 技术栈: C#, WinML, MediaPipe | 功能模块: 编解码

> 项目中存在三条独立且相互重叠的摄像头帧处理路径：CameraFrameService + IntelligenceService、CameraService（旧版）、VisionService。这三条路径中帧到BGR的转换逻辑和Softmax实现各有重复，而且大部分MediaPipe+OpenCV管道代码已被注释掉。请进行重构：抽取公共的帧处理和推理逻辑到共享服务中，明确标记或移除已弃用的代码路径，保留一条统一的人脸情绪识别管道。

**7.** `[中等] [功能迭代]` | 模块: `src/Modules/Verdure.Braincase.Copilot/ViewModels/Chat/ChatViewModel.Command.cs` | 技术栈: C#, WinUI 3, BotSharp | 功能模块: API 调用

> ChatViewModel 的 StartChatAsync 方法（第96-101行）目前是一个空实现，直接返回 Task.CompletedTask。这个方法应该初始化一个新的对话会话。请实现此方法：调用 IConversationService 创建新对话、清空当前消息列表、并更新 UI 状态以反映新对话已开始。

**8.** `[简单] [测试]` | 模块: `src/Verdure.ElectronBot.GrpcService/EmojiPlayHelper.cs` | 技术栈: C#, xUnit/MSTest | 功能模块: 单元测试

> 请为 EmojiPlayHelper 类编写单元测试，覆盖以下场景：(1) Enqueue 和播放循环的基本流程，(2) 并发 Enqueue 调用的线程安全性，(3) 队列为空时 CanPlay 状态为 false，(4) 队列超过阈值时 CanPlay 状态为 true。测试文件放在 src/ElectronBot.Braincase.Tests.MSTest/ 目录下。

**9.** `[中等] [测试]` | 模块: `src/Common/Verdure.Braincase.DataStorage/Services/LiteDBEmojisFileService.cs` | 技术栈: C#, LiteDB | 功能模块: 单元测试

> LiteDBEmojisFileService 负责表情数据的 CRUD 和 ZIP 导出功能，目前没有任何测试覆盖。请为它编写集成测试，覆盖：(1) 保存和读取表情数据，(2) 导出表情为 ZIP 文件，(3) 删除表情并验证级联清理，(4) 列出所有表情。使用 LiteDB 的内存模式（in-memory）以避免测试间的文件系统依赖。

**10.** `[困难] [功能迭代]` | 模块: `src/Verdure.Braincase/Services/AppNotificationService.cs` | 技术栈: C#, WinUI 3 | 功能模块: 操作日志

> AppNotificationService 目前是一个存根实现：NotificationReceived 事件的处理程序（第32-43行）只有一个 TODO 注释，没有实际的 toast 交互处理逻辑。请完善此服务：实现 toast 点击后的导航处理（如点击通知后跳转到对应的设置页面或表情页面），添加 toast 展示的历史记录管理，并支持 toast 的优先级分类。

**11.** `[简单] [代码理解与分析]` | 模块: `src/Devices/ElectronBot.DotNet.LibUsb/LibUsbElectronLowLevel.cs`, `src/Devices/ElectronBot.DotNet.WinUsb/WinUsbElectronLowLevel.cs` | 技术栈: C#, LibUsbDotNet, USB | 功能模块: API 调用

> 分析 ElectronBot 与上位机之间的 USB 通信协议，输出文档到 `docs/analysis/usb-protocol.md`。文档需包含以下章节：(1) 概述——通信目标与硬件标识，(2) USB 枚举——VID/PID 与端点配置，(3) 数据包格式——帧数据包（512字节×84个包）的结构，(4) 控制数据包——关节角度编码方式（224字节），(5) 握手协议——Sync() 4 次迭代的时序图，(6) 两种实现（LibUsb vs WinUsb）的差异对比。

**12.** `[中等] [代码理解与分析]` | 模块: `src/Verdure.Braincase/Services/CameraEmojis/IntelligenceService.cs`, `src/Verdure.Braincase/Services/ElectronBot/VisionService.cs` | 技术栈: C#, WinML, ONNX | 功能模块: 编解码

> 分析项目中的人脸情绪识别推理管道，输出文档到 `docs/analysis/emotion-classification-pipeline.md`。文档需包含以下章节：(1) 整体架构——从摄像头帧到情绪结果的完整数据流，(2) ONNX 模型加载与配置——模型路径、输入输出张量规格，(3) 人脸检测与裁剪——FaceDetector 的使用方式，(4) 预处理管道——帧格式转换、尺寸调整、归一化，(5) Softmax 后处理——概率计算方法，(6) 与 MediaPipe 姿态估计的协调——FaceAndPoseService 中的并发控制机制，(7) 已知问题——三种并行处理路径的冗余分析。

**13.** `[中等] [调试]` | 模块: `src/Verdure.Braincase/Services/GestureClassificationService.cs`, `src/Verdure.Braincase/Services/PoseRecognitionService.cs` | 技术栈: C#, MediaPipe, OpenCV | 功能模块: 编解码

> GestureClassificationService 和 PoseRecognitionService 中的手势识别和姿态识别管道代码被大量注释掉（约200行关键逻辑）。请调查这些代码被注释的原因：检查 git log 中相关的提交历史，分析代码依赖是否可用（MediaPipe 原生库、OpenCV 包装器等），确认在当前 .NET 9 环境下这些管道是否可以恢复运行，并给出恢复方案或明确弃用建议。

**14.** `[简单] [工程化]` | 模块: `项目根目录` | 技术栈: .editorconfig, MSBuild | 功能模块: 工程配置

> 项目缺少 .editorconfig 文件来统一代码风格。请为这个 .NET 9 + WinUI 3 项目创建合适的 .editorconfig 文件，配置以下规则：(1) C# 代码缩进和括号风格，(2) 命名约定（PascalCase 用于公共成员，camelCase 用于私有字段，接口以 I 开头），(3) using 语句排序和不需要的 using 清理，(4) null 检查偏好，(5) XML 文档注释规则，(6) XAML 文件的格式化规则。

**15.** `[中等] [功能迭代]` | 模块: `src/Modules/Verdure.Braincase.Copilot.Plugin/Functions/` | 技术栈: C#, BotSharp, LLM API | 功能模块: API 调用

> 当前 BotSharp Copilot 模块支持 7 个 LLM 提供者（Azure OpenAI、MetaGLM、HuggingFace、通义千问等），但工具函数相对有限。请添加一个新的 AI 工具函数：让 ElectronBot 能够播报当前系统信息（CPU 使用率、内存使用量、系统运行时间）。该函数应作为一个新的 BotSharp Function 实现，注册到 DI 容器中，并能被 LLM agent 自动发现和调用。
