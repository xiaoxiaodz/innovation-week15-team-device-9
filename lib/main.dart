import 'package:flutter/material.dart';

void main() {
  runApp(const InnovationTeamDeviceApp());
}

class InnovationTeamDeviceApp extends StatelessWidget {
  const InnovationTeamDeviceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '创新实验团队真机验收',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const TeamDeviceHomePage(),
    );
  }
}

class TeamDeviceHomePage extends StatelessWidget {
  const TeamDeviceHomePage({super.key});

  /// 组员 A 修改区域：应用标题、口号和小组成员名称
  static const String groupName = '第9组 创新实验团队';
  static const String projectTitle = 'Flutter Android 真机验收看板';
  static const String projectSlogan = '用 GitHub 协作，把第14周个人 Hello World 升级成小组真机运行成果';

  /// 组员 B 修改区域：团队成员信息与分工
  static const List<TeamMember> members = [
    TeamMember(role: '组长', name: '邓卓', task: '合并 PR、真机运行、创建仓库'),
    TeamMember(role: '组员 A', name: '车赵阳', task: '修改标题、口号和小组名'),
    TeamMember(role: '组员 B', name: '马敏楠', task: '补全成员信息与分工'),
    TeamMember(role: '组员 C', name: '林世钒', task: '补充 Android 真机检查项'),
    TeamMember(role: '组员 D', name: '谭正琪', task: '补充证据规则、README 照片说明'),
  ];

  /// 组员 C 修改区域：真机运行检查项
  static const List<String> realDeviceChecks = [
    '主电脑能执行 flutter doctor，并识别 Android toolchain',
    '数据线连接正常，手机显示为文件传输模式',
    '手机已开启 USB 调试',
    'adb devices 能看到设备且状态为 device',
    'flutter devices 能识别到 Android 设备',
    'flutter run 能成功安装并运行到真机',
    '运行设备型号：V2509A',
  ];

  /// 组员 D 修改区域：证据规则和 README 说明
  static const List<String> evidenceRules = [
    '证据照片必须由第二部手机拍摄，不能用本机截图代替',
    '照片中能看到手持 Android 手机',
    'Android 手机屏幕显示本组 Flutter App',
    '画面不要出现聊天记录、手机号、定位、身份证等隐私信息',
    '文件名建议为 android-real-device.jpg',
    '放入项目 images/ 目录',
    '提交到 GitHub',
    'README 中能显示这张照片',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('创新实验第15周'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 20),
          MembersSection(),
          SizedBox(height: 20),
          RealDeviceChecksSection(),
          SizedBox(height: 20),
          EvidenceRulesSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.phone_android, size: 44, color: Colors.indigo),
            SizedBox(height: 12),
            Text(TeamDeviceHomePage.groupName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Text(TeamDeviceHomePage.projectTitle, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(TeamDeviceHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('小组成员与 PR 分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...TeamDeviceHomePage.members.map((member) => MemberCard(member: member)),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class RealDeviceChecksSection extends StatelessWidget {
  const RealDeviceChecksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Android 真机运行检查项', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamDeviceHomePage.realDeviceChecks.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text('• $item'),
                )),
          ],
        ),
      ),
    );
  }
}

class EvidenceRulesSection extends StatelessWidget {
  const EvidenceRulesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('最终证据要求', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamDeviceHomePage.evidenceRules.map((rule) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text('• $rule'),
                )),
          ],
        ),
      ),
    );
  }
}

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task});

  final String role;
  final String name;
  final String task;
}
