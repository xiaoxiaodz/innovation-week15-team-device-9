# 创新实验第15周：团队协作与 Android 真机运行示例

本项目用于第15周课堂任务：在第14周 Flutter Hello World 和 GitHub 提交练习的基础上，小组通过 Pull Request 协作修改同一个 Flutter 项目，并把最终版本运行到真实 Android 手机上。

## 小组成员

| 角色 | 姓名 | 任务 | PR 链接 |
| --- | --- | --- | --- |
| 组长 | 邓卓 | 合并 PR、真机运行、创建仓库 | - |
| 组员 A | 车赵阳 | 修改标题、口号和小组名 | [#3](https://github.com/xiaoxiaodz/innovation-week15-team-device-9/pull/3) |
| 组员 B | 马敏楠 | 补全成员信息与分工 | [#4](https://github.com/xiaoxiaodz/innovation-week15-team-device-9/pull/4) |
| 组员 C | 林世钒 | 补充 Android 真机检查项 | [#2](https://github.com/xiaoxiaodz/innovation-week15-team-device-9/pull/2) |
| 组员 D | 谭正琪 | 补充证据规则、README 照片说明 | [#5](https://github.com/xiaoxiaodz/innovation-week15-team-device-9/pull/5), [#6](https://github.com/xiaoxiaodz/innovation-week15-team-device-9/pull/6) |

## 最终要提交什么

每组需要提交：

1. GitHub 原始仓库链接。
2. 4 名组员的 Fork、分支、commit 或 Pull Request 证据。
3. 组长合并 PR 后的最终 `main` 分支截图。
4. 真实 Android 手机运行本应用的照片。
5. README 中展示真机照片和小组分工。

## 推荐协作方式

本周统一使用 Fork + Pull Request：

```text
组长创建原始仓库
  ↓
组员 Fork 到自己的 GitHub
  ↓
组员 clone 自己的 Fork
  ↓
组员创建个人分支并修改指定区域
  ↓
组员 push 到自己的 Fork
  ↓
组员向组长仓库提交 Pull Request
  ↓
组长 Review 并合并
  ↓
主电脑运行合并后的最终版本
```

组员不要直接 push 到组长仓库的 `main` 分支。

## 小组实际分工

| 角色 | 姓名 | 修改位置 | 实际完成任务 |
| --- | --- | --- | --- |
| 组长 | 邓卓 | GitHub 仓库 | 创建仓库、维护 `main`、审核 PR、解决冲突、配置 Gradle 镜像、组织真机运行 |
| 组员 A | 车赵阳 | `lib/main.dart` | 修改 `groupName`、`projectTitle`、`projectSlogan` |
| 组员 B | 马敏楠 | `lib/main.dart` | 补全 `members` 中的小组成员姓名与分工 |
| 组员 C | 林世钒 | `lib/main.dart` | 补充 `realDeviceChecks` 中的真机检查项 |
| 组员 D | 谭正琪 | `lib/main.dart` 和 `README.md` | 补充 `evidenceRules`，提交真机照片说明 |

## 小组分工建议（原始任务分配）

| 角色 | 修改位置 | 任务 |
| --- | --- | --- |
| 组长 | GitHub 仓库 | 创建仓库、维护 `main`、审核 PR、组织真机运行 |
| 组员 A | `lib/main.dart` | 修改 `groupName`、`projectTitle`、`projectSlogan` |
| 组员 B | `lib/main.dart` | 补全 `members` 中的小组成员姓名与分工 |
| 组员 C | `lib/main.dart` | 补充 `realDeviceChecks` 中的真机检查项 |
| 组员 D | `lib/main.dart` 和 `README.md` | 补充 `evidenceRules`，提交真机照片说明 |

## 运行命令

进入项目根目录后执行：

```bash
flutter pub get
flutter test
flutter run
```

如果电脑连接了多台设备，先查看设备：

```bash
flutter devices
```

再指定真实 Android 手机运行：

```bash
flutter run -d 设备ID
```

## Android 真机检查项

| 检查项 | 要求 | 状态 |
| --- | --- | --- |
| 手机开发者模式 | 已开启 USB 调试 | √ |
| USB 连接 | 手机已通过数据线连接电脑 | √ |
| 手机授权 | 弹出"是否允许 USB 调试"时点击"允许" | √ |
| Flutter 环境 | `flutter doctor` 无报错 | √ |
| 依赖完整 | `flutter pub get` 已执行成功 | √ |
| 设备识别 | `flutter devices` 能看到你的手机 | √ |
| 应用运行 | `flutter run` 能成功安装并启动 App | √ |

连接手机后先检查：

```bash
adb devices
flutter devices
```

`adb devices` 的状态应为：

```text
device
```

如果显示 `unauthorized`，请解锁手机并允许 USB 调试。

## 真机照片要求

请把照片放到：

```text
images/android-real-device.jpg
```

并在本 README 中引用：

```markdown
![Android 真机运行照片](images/android-real-device.jpg)
```

合格照片必须满足：

- 真实 Android 手机正在运行本小组 Flutter 应用；
- 不能是 Web 截图；
- 不能是 Android 模拟器截图；
- 不能用手机本机截图代替；
- 必须由第二部手机拍摄；
- 照片中能看到手持手机；
- 不包含聊天记录、手机号、定位等隐私信息。

## 本组真机运行照片

提交照片后，下面应显示本组运行效果：

![Android 真机运行照片](images/android-real-device.jpg)

如果图片暂时无法显示，请检查 `images/android-real-device.jpg` 是否已提交，以及文件名大小写是否一致。
