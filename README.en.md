# Electronic Braincase

<a href="https://www.microsoft.com/store/productId/9NQWDB4MQV0C"><img src="https://cdn.jsdelivr.net/gh/qishibo/img/microsoft-store.png" height="58" width="180" alt="get from microsoft store"></a>

---

Electronic Braincase is a desktop program project that provides software functions for the open-source desktop robot ElectronBot and Hanwen Keyboard (HelloWord-Keyboard), using Microsoft's WASDK framework and C# language.

## Prerequisites

- Windows 10 (19041+) or Windows 11
- Visual Studio 2022 with "Windows application development" workload
- .NET 9 SDK
- Windows App SDK 1.7+

## Quick Start

1. Clone the repo: `git clone https://github.com/liu06173/ElectronBot.DotNet.git`
2. Open `ElectronBot.Braincase.sln` in Visual Studio 2022
3. Select x64 platform, set `Verdure.Braincase` as startup project
4. Press F5 to run

new version Page

![Electronic Braincase AI Interaction Version](/Images/new_version.png)

old version Page

![Electronic Braincase Screenshot](/Images/home1.png)

Electronic control interface

![Electronic Braincase Interface](/Images/HomePage.png)

Hanwen keyboard control
![Hanwen Interface](/Images/helloworld-%20keyboard.PNG)
## Features

- Colorful dial: Can display time and custom text, and there is a dial that can specifically display the current computer resource usage.
![Clock](/Images/clock.png)
- Gesture recognition voice interaction: Gesture recognition combined with voice recognition for voice dialogue, can ask about weather conditions, simple joke replies or intelligent chat through Turing Robot API or ChatGPT dialogue API. (Note: You need to solve the network problem yourself)

- Quantum entanglement: This function can recognize the user's expression, and can also play the user's facial data on the robot's face.
![Quantum entanglement page](/Images/face.png)

- Expression list: Users can customize their favorite expression data, and then specify the corresponding action file, which can be played in combination with expressions and actions. You can also export, share with others or import others' shared expressions.
![emojis](/Images/emojis.png)

- Joystick control: After the user connects the xbox joystick, you can control the electronics on the joystick controller page, and you can operate the bottom rotation, arm rotation, single arm expansion and head total five servos at the same time.
![xbox](/Images/xbox-controller.png)

- Electronic simulation: You can randomly play expressions without a robot to show the effect.
![ElectronBotModelLoad](/Images/ElectronBotModelLoad.gif)


## Installation

1. Install Visual Studio 2022 and choose to install the WASDK development component.
2. Clone or download this project locally.
3. Open the ElectronBot.Braincase.sln file and compile and run.
4. The key is to set the startup project to ElectronBot.Braincase otherwise it will not run.

## Usage

1. Select the function module you want to use on the homepage and click to enter.
2. Operate or set parameters according to the prompts of different modules.
3. Click the return button to return to the homepage or exit the program.

## Configuration

On the settings page, you can configure the following parameters:

- Serial port number: Select the serial port number connected to the ElectronBot hardware device.
- Turing Robot API Key: Enter the Turing Robot API key you applied for to implement the voice interaction function.
- ChatGPT dialogue API address: Enter the ChatGPT dialogue API address you built or accessed to implement the intelligent chat function.

## Reference Projects and Dependencies

The projects and dependencies referenced by this project:

+ [Project template - TemplateStudio](https://github.com/microsoft/TemplateStudio)
+ [Dial reference project - A Pomodoro](https://github.com/DinoChan/OnePomodoro)
+ [Community Toolkit - CommunityToolkit](https://github.com/CommunityToolkit/WindowsCommunityToolkit)
+ [Control library demo - WinUI-Gallery](https://github.com/microsoft/WinUI-Gallery)
+ [Image processing library - opencvsharp](https://github.com/shimat/opencvsharp)
+ [Emoji8 Expression Recognition Example](https://github.com/microsoft/Windows-Machine-Learning/tree/master/Samples/Emoji8/UWP/cs)
+ [helix-toolkit](https://github.com/helix-toolkit/helix-toolkit)
+ [Semantic Kernel](https://github.com/microsoft/semantic-kernel)

## License

This project is released under the MIT license.

Introduction to the Raspberry Pi connection ElectronBot project

![Cover](/Images/videoCar.jpg)
