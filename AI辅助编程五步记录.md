# AI辅助编程五步记录

## 姓名：邓卓 | 学号后四位：0168 | 小组：第9组 | 角色：组长

---

## 一、第14周：Flutter HelloWorld 个性化修改与 GitHub 提交

### 第1步：提示（Prompt）

**原始需求描述：**

> 学习讲义并完成创新实验第14周个人任务。按照示例程序对 Flutter HelloWorld 进行至少4处个性化修改，本地运行 `flutter run`，将代码提交到 GitHub 小组仓库。

**对 AI 的具体提示：**

- 我的姓名是邓卓，学号后四位是0168，第9组，GitHub 用户名 xiaoxiaodz
- 帮我在 Flutter Hello World 示例基础上做个性化修改
- Flutter SDK 请安装到 D 盘
- 帮我创建小组仓库并推送代码

---

### 第2步：理解（Understand）

**AI 对任务的理解与分析：**

1. **核心目标**：在 Flutter 默认 HelloWorld 项目基础上，修改 `lib/main.dart`，至少做 4 处明显个性化修改
2. **技术栈**：Flutter SDK + Dart 语言 + Git/GitHub
3. **约束条件**：
   - 需要安装 Flutter SDK（Windows 环境，D 盘）
   - 中国网络环境需要配置镜像源
   - GitHub 提交邮箱需与账号绑定，否则 Contributors 不显示
4. **验收标准**：
   - Flutter App 能运行
   - 至少 4 处个性化修改
   - 页面含本人或小组识别信息
   - 至少一个按钮点击后有可见变化
   - 有运行截图
   - 有 GitHub 提交记录

---

### 第3步：实现（Implement）

**3.1 Flutter SDK 安装**

- 从中国镜像 `storage.flutter-io.cn` 下载 Flutter 3.29.3 SDK
- 解压到 `D:\flutter_sdk\flutter\`
- 配置环境变量：
  - `PUB_HOSTED_URL=https://pub.flutter-io.cn`
  - `FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn`
  - `PUB_CACHE=D:\flutter_pub_cache`

**3.2 个性化修改（共8处）**

对 `lib/main.dart` 做了以下修改：

| 序号 | 修改位置 | 原始内容 | 修改后内容 |
|------|---------|---------|-----------|
| 1 | AppBar 标题 | `'Flutter Demo Home Page'` | `'邓卓 的创新实验 Flutter 首页'` |
| 2 | 主题色 | `Colors.blue` / `seedColor: Colors.blue` | `Colors.teal` |
| 3 | 页面图标 | `Icon(Icons.add)` | `Icon(Icons.school, size: 72)` |
| 4 | 页面文字 | `'You have pushed the button this many times:'` | `'邓卓 正在完成第14周 Flutter 入门任务！'` |
| 5 | 个人信息 | 无 | 新增 `Card` 组件显示"姓名：邓卓 | 学号后四位：0168 | 第9组" |
| 6 | 计数含义 | `'counter'` / `'_counter'` | `'completedTasks'` / `'已完成任务次数'` |
| 7 | 按钮图标 | `Icons.add` | `Icons.check` |
| 8 | 按钮文字 | 无（仅图标按钮） | `FloatingActionButton.extended`，文字"完成一次打卡" |

**3.3 项目配置修改**

- `pubspec.yaml`：SDK 约束改为 `>=3.7.0 <4.0.0`
- `pubspec.yaml`：`flutter_lints` 版本降为 `^5.0.0`（`^6.0.0` 不存在）

**3.4 GitHub 提交**

- 创建小组仓库 `innovation-flutter-team-9`
- 创建个人分支 `0168-dengzhuo-hello`
- 修复 Contributors 不显示问题：将提交邮箱从 `dengzhuo@example.com` 改为真实邮箱 `3238900384@qq.com`

```bash
git config user.name "邓卓"
git config user.email "3238900384@qq.com"
git reset --soft HEAD~N
git commit -m "..."
git push -f origin main
```

---

### 第4步：测试（Test）

**4.1 Web 模式运行测试**

```bash
flutter build web --release
```

构建成功，在 localhost:9090 上启动 HTTP 服务器，浏览器中正常显示 App 页面。

**4.2 功能验证**

| 检查项 | 结果 |
|--------|------|
| 页面无红屏 | ✅ |
| 能看到个性化标题"邓卓 的创新实验 Flutter 首页" | ✅ |
| 能看到个人信息（姓名、学号、小组） | ✅ |
| 点击按钮后数字从 0 变为 1 | ✅ |
| 主题色为 teal | ✅ |

**4.3 GitHub 验证**

| 检查项 | 结果 |
|--------|------|
| 仓库可访问 | ✅ |
| Contributors 显示邓卓 | ✅（修复邮箱后） |
| 有提交记录 | ✅ |

---

### 第5步：代码解释（Code Explanation）

**核心代码结构：**

```dart
void main() {
  runApp(const InnovationHelloApp());  // 入口函数，启动App
}

class InnovationHelloApp extends StatelessWidget {
  // StatelessWidget: 不可变组件，只构建一次
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '创新实验 Flutter 入门',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),  // 主题色
        useMaterial3: true,
      ),
      home: const HelloHomePage(),  // 首页
    );
  }
}

class HelloHomePage extends StatefulWidget {
  // StatefulWidget: 有状态的组件，可以通过setState刷新
  @override
  State<HelloHomePage> createState() => _HelloHomePageState();
}

class _HelloHomePageState extends State<HelloHomePage> {
  int completedTasks = 0;  // 状态变量：已完成任务次数

  void finishOneTask() {
    setState(() {           // setState通知Flutter重新构建UI
      completedTasks += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(        // Material页面的基本结构
      appBar: AppBar(...),  // 顶部标题栏
      body: Center(         // 页面主体，居中布局
        child: Column(      // 垂直排列子组件
          children: [
            Icon(Icons.school),     // 学校图标
            Text('邓卓 正在完成...'),  // 说明文字
            Card(...),              // 个人信息卡片
            Text('已完成任务：$completedTasks 次'),  // 动态计数
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: finishOneTask,    // 点击按钮触发状态更新
        icon: Icon(Icons.check),
        label: Text('完成一次打卡'),
      ),
    );
  }
}
```

**关键概念解释：**

- **StatelessWidget vs StatefulWidget**：StatelessWidget 一旦构建就不变；StatefulWidget 可以通过 `setState()` 触发重建，适合有交互的页面
- **setState()**：告诉 Flutter "状态变了，请重新调用 build() 方法刷新UI"，不调用则页面不会更新
- **Scaffold**：Material Design 的页面脚手架，提供 AppBar、body、FloatingActionButton 等区域
- **`$completedTasks`**：Dart 的字符串插值语法，在字符串中嵌入变量值

---

## 二、第15周：团队协作与 Android 真机运行

### 第1步：提示（Prompt）

**原始需求描述：**

> 完成创新实验第15周团队协作与Android真机运行任务。我是组长，需要创建小组仓库、推送示例程序代码、合并组员PR、Android真机运行。

**对 AI 的具体提示：**

- 我是组长，帮我完成组长任务
- 使用提供的示例程序，不要自定义代码
- 帮我创建仓库 innovation-week15-team-device-9
- 帮我解决 PR 冲突并合并
- 帮我配置 Android 真机运行环境

---

### 第2步：理解（Understand）

**AI 对任务的理解与分析：**

1. **核心目标**：小组通过 Fork + PR 协作修改同一 Flutter 项目，组长合并后在 Android 真机上运行
2. **角色分工**：
   - 组长（邓卓）：创建仓库、合并 PR、真机运行
   - 组员 A（车赵阳）：修改标题、口号和小组名
   - 组员 B（马敏楠）：补全成员信息与分工
   - 组员 C（林世钒）：补充 Android 真机检查项
   - 组员 D（谭正琪）：补充证据规则、README 照片说明
3. **技术挑战**：
   - Android 真机运行需要 Android SDK + Gradle + USB 调试
   - 中国网络环境下 Gradle 下载超时，需配置国内镜像
   - PR 冲突需要手动解决
4. **验收标准**：
   - GitHub 原始仓库可访问
   - 至少 4 名组员有 commit 或 PR 记录
   - App 在真实 Android 手机上运行
   - README 中显示真机照片

---

### 第3步：实现（Implement）

**3.1 创建小组仓库并推送示例程序**

```bash
git init
git add .
git commit -m "init week15 team device demo"
git branch -M main
git remote add origin https://github.com/xiaoxiaodz/innovation-week15-team-device-9.git
git push -u origin main
```

**3.2 合并组员 PR（解决冲突）**

收到 PR #4（组员 B 马敏楠），存在冲突。通过 GitHub ref 拉取 PR 代码并在本地解决：

```bash
git fetch origin pull/4/head:pr-4
git merge pr-4
# 手动解决 lib/main.dart 冲突
git add lib/main.dart
git commit -m "Merge PR #4: 补全第9组成员姓名与分工 (resolved conflicts)"
git push origin main
```

冲突原因：PR #4 大幅改写了 main.dart，与 main 分支的结构有重叠。解决策略：保留 PR 中的真实数据（组员姓名与分工），恢复正确的代码结构。

**3.3 配置 Android 真机运行环境**

1. 安装 Android Studio 到 `D:\anzhuo\`
2. Android SDK 自动安装到 `C:\Users\32389\AppData\Local\Android\Sdk\`
3. 手机（vivo V2509A, Android 16）连接 USB，开启 USB 调试
4. `adb devices` 确认设备连接成功

**3.4 配置 Gradle 国内镜像（解决编译超时）**

修改 `android/settings.gradle.kts`，添加阿里云镜像：

```kotlin
repositories {
    maven { url = uri("https://maven.aliyun.com/repository/google") }
    maven { url = uri("https://maven.aliyun.com/repository/central") }
    maven { url = uri("https://maven.aliyun.com/repository/public") }
    maven { url = uri("https://maven.aliyun.com/repository/gradle-plugin") }
    google()
    mavenCentral()
    gradlePluginPortal()
}
```

修改 `android/build.gradle.kts`，添加同样的镜像。

修改 `gradle-wrapper.properties`，将 Gradle 下载地址改为腾讯云镜像：

```properties
distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-8.10.2-bin.zip
```

**3.5 修复 Kotlin 编译错误**

问题：`app/build.gradle.kts` 中使用了 `kotlin { compilerOptions { ... } }` 语法但缺少 Kotlin 插件声明。

修复：添加 `id("org.jetbrains.kotlin.android")` 并将 `kotlin { compilerOptions }` 改为 `kotlinOptions { jvmTarget = "17" }`：

```kotlin
plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    ...
    kotlinOptions {
        jvmTarget = "17"
    }
}
```

**3.6 安装 Visual Studio Build Tools（Windows 桌面运行支持）**

```bash
winget install Microsoft.VisualStudio.2022.BuildTools \
  --override "--wait --passive --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended"
```

**3.7 添加 Windows 桌面平台支持**

```bash
flutter create --platforms=windows .
```

---

### 第4步：测试（Test）

**4.1 设备连接测试**

```bash
adb devices
# 输出：10AFA3127G002QD    device ✅

flutter devices
# 输出：V2509A (mobile) ✅
```

**4.2 Flutter 编译测试**

| 阶段 | 命令 | 结果 |
|------|------|------|
| Gradle 下载 | 自动从腾讯云镜像下载 | ✅ 成功 |
| SDK 自动安装 | NDK 26.3 + Build-Tools 34 + Platform 35 | ✅ 自动完成 |
| Kotlin 编译 | 修复后重新编译 | ✅ 通过 |
| Windows 桌面 | `flutter run -d windows` | ⏳ 需要 Visual Studio Build Tools（已安装） |

**4.3 GitHub PR 合并验证**

| PR | 组员 | 状态 |
|----|------|------|
| PR #2 | 林世钒（组员 C） | ✅ 已合并 |
| PR #3 | 车赵阳（组员 A） | ✅ 已合并 |
| PR #4 | 马敏楠（组员 B） | ✅ 已合并（解决冲突后） |

---

### 第5步：代码解释（Code Explanation）

**第15周示例程序核心结构：**

```dart
class TeamDeviceHomePage extends StatefulWidget {
  // 第15周的主页面，展示团队协作成果

  // 以下4个区域分别由4名组员通过PR修改
  static const String groupName = '第9组 创新实验团队';     // 组员A修改
  static const String projectTitle = 'Flutter Android 真机验收看板'; // 组员A修改
  static const String projectSlogan = '用 GitHub 协作...';   // 组员A修改

  static const List<TeamMember> members = [                  // 组员B修改
    TeamMember(role: '组长', name: '邓卓', task: '合并PR、真机运行、创建仓库'),
    TeamMember(role: '组员 A', name: '车赵阳', task: '修改标题、口号和小组名'),
    TeamMember(role: '组员 B', name: '马敏楠', task: '补全成员信息与分工'),
    TeamMember(role: '组员 C', name: '林世钒', task: '补充Android真机检查项'),
    TeamMember(role: '组员 D', name: '谭正琪', task: '补充证据规则、README照片说明'),
  ];

  static const List<String> realDeviceChecks = [...];        // 组员C修改
  static const List<String> evidenceRules = [...];           // 组员D修改
}
```

**关键概念解释：**

- **Fork + PR 协作模式**：组员 Fork 组长仓库到自己的账号，在个人分支上修改后提交 Pull Request，组长 Review 后合并到 main 分支。这种模式避免了直接在主仓库上操作的风险
- **Git 冲突解决**：当多个 PR 修改同一文件的同一区域时，Git 无法自动合并，需要手动选择保留哪些代码。本项目中 PR #4 改了整个 main.dart，与 main 分支结构重叠导致冲突
- **`static const`**：Dart 的编译时常量，在类级别定义，所有实例共享同一份内存，适合定义不会变化的数据
- **Android 真机运行原理**：Flutter 通过 Gradle 构建系统将 Dart 代码编译为原生 ARM 机器码，通过 adb 安装到 Android 设备上运行
- **Gradle 镜像配置**：Gradle 默认从 Google/Maven Central 下载依赖，中国网络可能超时。配置阿里云/腾讯云镜像后，依赖从国内服务器下载，速度大幅提升
- **`kotlinOptions` vs `kotlin { compilerOptions }`**：前者是传统的 Kotlin JVM 编译选项配置方式，后者是 Kotlin 2.0+ 的新语法。需要与 AGP 版本和 Gradle 版本匹配使用

---

## 三、总结

### AI 辅助编程五步法在本项目中的应用

| 步骤 | 第14周实践 | 第15周实践 |
|------|-----------|-----------|
| **提示** | 描述个人信息和个性化需求 | 描述组长职责和团队协作流程 |
| **理解** | 分析 Flutter 项目结构和修改点 | 分析 Fork+PR 工作流和 Android 真机要求 |
| **实现** | 8处个性化修改、SDK安装、Git推送 | 创建仓库、合并PR（解决冲突）、配置Android环境 |
| **测试** | Web模式运行验证、GitHub Contributors确认 | adb设备连接、Gradle编译、PR合并状态检查 |
| **代码解释** | StatelessWidget/StatefulWidget/setState原理 | Fork+PR协作/Gradle镜像/Android真机编译原理 |

### 遇到的主要问题与解决

| 问题 | 解决方案 |
|------|---------|
| Flutter SDK 下载慢 | 使用中国镜像 storage.flutter-io.cn |
| Gradle 下载超时 | 配置阿里云 Maven 镜像 + 腾讯云 Gradle 镜像 |
| Kotlin 编译错误 | 添加 Kotlin 插件声明，改用 kotlinOptions 语法 |
| GitHub Contributors 不显示 | 修复提交邮箱为与 GitHub 账号绑定的真实邮箱 |
| PR 冲突 | 通过 git fetch pull/N/head 本地拉取并手动解决 |
| Windows 桌面不支持 | 安装 VS Build Tools + flutter create --platforms=windows |
