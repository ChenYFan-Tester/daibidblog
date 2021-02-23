---
layout: post
title: 把win10默认的图片保存格式由“jfif”格式转化为其他格式
abbrlink: 48467
date: 2021-01-24 15:36:05
tage:
  - win10
  - 图片格式
  - jfif
cover: https://cdn.keepdai.cn//72170214092267710.webp
---

# 原因

今天在逛大佬们的博客,突然看到一个天气之子的壁纸![image-20210124153806479](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn2@ee4423e6b367300d9bba8b89502e40b9564bc2a6/2021/01/24/10e207018e0f0c3bfe5176030d9e56d8.png)

要西,这么好看,真是歪瑞碧藕底否啊!下载下载,放到我的随机图片api上,下载下来发现大小居然6m,这可不行,加载速度会慢,然后我就打开了我的bejson准备进行压缩,下载下来发现默认格式是jfif,wc?这是个什么格式,我赶紧打开百度一查,熬~缘来是图片存储格式之一，由[JPEG](https://baike.baidu.com/item/JPEG)格式衍生而来，后缀为".jfif"。

我寻思着行吧,那我就直接用吧,结果发现好多软件都不认他,啊真是个小可怜啊,那我就把他转换为wedp吧,继续打开我的bejson[bejson永远的神],选择转换wedp,卧槽?bejson也不认他 啊这....百度娘问我,刘老师,发生甚么事了,我给它看了截图,它说熬,不就是这个嘛 我教你怎么改默认格式

# 教程

首先按键盘的“Win键+R键”，弹出“运行”对话框，输入“regedit”，然后点回车进入注册表编辑器。![image-20210124154733325](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn2@9ec308df98458ccdc596b728b5e50579ee8d8906/2021/01/24/437d377afa66254b7800bc927f7775b6.png)

然后，按照下面的路径一步步进入相应的项目，也可以直接把下面的路径粘贴地址栏里:HKEY_CLASSES_ROOT\MIME\Database\Content Type\image/jpeg

![image-20210124154821727](https://cdn.jsdelivr.net/gh/Daibi-mua/cdn2@1d7da97d5556c9ccd43b59a51b9310eb0e705c30/2021/01/24/eb0c7499df9cc5f93fe23cb2b876502e.png)

双击这一行点开，在“编辑字符串”对话框中，把jfif改为“jpg，最后点确定就可以了。

好嘛,文章又水完了,枕开信啊,溜了溜了。