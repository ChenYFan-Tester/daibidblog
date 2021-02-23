---
layout: post
title: 给你的hexo博客接入评论系统
tags:
  - 评论
  - Twikoo
  - 博客
cover: 'https://qntemp3.bejson.com/upload/73736277580378140.png?imageView2/0/w/0/h/0/format/webp'
abbrlink: 54759
date: 2021-01-18 07:48:58
---

在Butterfly3.3版本下支持了Twikoo评论。本博客在未来均会采用这个评论。它支持邮件提醒、微信提醒等。可以说是目前最好的评论系统，并且免费。

官方文档：[点我前往](https://twikoo.js.org/)

## 浏览器支持

> 市面主流游览器均支持,除了IE

## 云函数部署

### 一键部署

1. 点击以下链接将Twikoo一键部署到云开发

[部署到云开发](https://console.cloud.tencent.com/tcb/env/index?action=CreateAndDeployCloudBaseProject&appUrl=https%3A%2F%2Fgithub.com%2Fimaegoo%2Ftwikoo&branch=dev)

![](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/%E8%85%BE%E8%AE%AF%E4%BA%911.png)

2. 进入[环境-登录授权 (opens new window)](https://console.cloud.tencent.com/tcb/env/login)，启用“匿名登录”

   ![](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/2%60OWS2%60WI%7BZX7121F46$2_P.png)

3. 进入[环境-安全配置 (opens new window)](https://console.cloud.tencent.com/tcb/env/safety)，将网站域名添加到“WEB安全域名”

   ![](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/FA3UO81L7%5BVFLYSMO$5CNZ3.png)

> 一键部署虽然方便，但是仅支持按量计费环境——也就是说，**一键部署的环境，当免费资源用尽后，将会产生费用**。且按量计费环境无法切换为包年包月环境。
>
> 大多数情况下，免费资源能够满足日访问量在 10,000 以下的站点（参考：[免费资源如何计算？](https://twikoo.js.org/faq.html#免费资源如何计算)）。
>
> 如果您希望，当免费资源用尽时，不产生费用，请参考手动部署

###  手动部署

> 如果您打算部署到一个现有的云开发环境，请直接从第 3 步开始

1. [注册云开发CloudBase](https://curl.qcloud.com/KnnJtUom)

2. 进入[云开发控制台 (opens new window)](https://console.cloud.tencent.com/tcb/)，新建环境，请按需配置环境

3. 进入[环境-登录授权 (opens new window)](https://console.cloud.tencent.com/tcb/env/login)，启用“匿名登录”

4. 进入[环境-安全配置 (opens new window)](https://console.cloud.tencent.com/tcb/env/safety)，将网站域名添加到“WEB安全域名”

5. 进入[环境-云函数 (opens new window)](https://console.cloud.tencent.com/tcb/scf/index)，点击“新建云函数”

6. 函数名称请填写：`twikoo`，创建方式请选择：`空白函数`，运行环境请选择：`Nodejs 10.15`，函数内存请选择：`128MB`，点击“下一步”

7. 复制以下代码、粘贴到“函数代码”输入框中，点击“确定”

   ```js
   exports.main = require('twikoo-func').main
   ```

8. 创建完成后，点击“twikoo"进入云函数详情页，进入“函数代码”标签，点击“文件 - 新建文件”，输入 `package.json`，回车

9. 复制以下代码、粘贴到代码框中，点击“保存并安装依赖”

   ```json
   { "dependencies": { "twikoo-func": "1.0.0" } }
   ```

   ### 主题部署

如果你是butterfly3.3以上,您可直接通过配置文件来直接启用twikoo![](https://cdn.jsdelivr.net/gh/Daibi-mua/jsdelivr@1.3/tica.png)

> 注意 这里的Twikoo的写法是 use: 
>
>   \- Twikoo    T要大写

在下面找到Twikoo的设置,输入你的环境id!![](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/tookk.png)

环境id可在你的环境总览里查看![](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/jiuzhe.png)

### 开启管理面板

进入[登陆授权](https://console.cloud.tencent.com/tcb/env/login)点击自定义登陆的`密钥下载`![](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/miyao.png)

点击评论右下角的小齿轮,输入这串密钥,如果你没有这个小齿轮,并且评论区报错,这边建议你去检查更新

 ![](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/asfafs.png)

### 进阶设定

#### 添加版本号（强烈建议）

添加版本号为张洪大佬的建议,原话:"在butterfly的3.3版本中Twikoo引入的js没有指定版本号，云开发版本和js版本不同的情况下可能会造成问题。**大多数普通用户配置成功后可能不会去追更twikoo的版本，所以添加版本号是一个非常好的习惯**"

进入[通过CDN引入](https://twikoo.js.org/quick-start.html#通过-cdn-引入)查看代码，将文档中带版本号的js链接粘贴到配置文件中。![](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/qsafasfasf.png)

![](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/wendang.png)