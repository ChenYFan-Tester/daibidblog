---
layout: post
title: PHP建随机图片API
tags:
  - Markdown
  - PHP
abbrlink: 46380
date: 2020-12-26 09:17:30
cover: https://cdn.jsdelivr.net/gh/Daibi-mua/jsdelivr@1.3/005ZQSyjly1gm7bn2wvddj31z4140k6x.jpg
---
>+ 前几天闲来无事 突然想找一个自己喜欢的随机图片api 但翻了半天也没找到自己喜欢的，索性干脆自己做一个
>+ 参考了网上一些文章，同时结合自己实际情况，也加上了一些解释。

## **准备**

- 一台服务器
- 已经搭建好的php环境

### 基本原理

随机图片API，主要原理其实很简单，就三步：
1.用一个文本文档存放图片的链接
2.当用户请求API时，php就去读取txt文件，然后生成随机数来随机选取一个图片链接
3.302重定向到目标图片地址

***

​    

## **实现**

下面给出最简单的实现方式，详细说明见注释

> 创建文件img.txt用于存放图片地址，如

```http
https://cdn.jsdelivr.net/gh/Daibi-mua/jsdelivr@1.3/9.jpg
https://cdn.jsdelivr.net/gh/Daibi-mua/jsdelivr@1.3/8.jpg
https://cdn.jsdelivr.net/gh/Daibi-mua/jsdelivr@1.3/3.png
https://cdn.jsdelivr.net/gh/Daibi-mua/jsdelivr@1.3/7.jpg
https://cdn.jsdelivr.net/gh/Daibi-mua/jsdelivr@1.3/5.jpg
```

> 创建index.php

```php+HTML
<?php
//存有美图链接的文件名img.txt
$filename = "img.txt";
if(!file_exists($filename)){
    die('文件不存在');
}
 
//从文本获取链接
$pics = [];
$fs = fopen($filename, "r");
while(!feof($fs)){
    $line=trim(fgets($fs));
    if($line!=''){
        array_push($pics, $line);
    }
}
 
//从数组随机获取链接
$pic = $pics[array_rand($pics)];
 
//返回指定格式
$type=$_GET['type'];
switch($type){
 
//JSON返回
case 'json':
    header('Content-type:text/json');
    die(json_encode(['pic'=>$pic]));
 
default:
    die(header("Location: $pic"));
}
 
?>
```

**将img.txt和index.php放在同一个网站目录下，通过访问域名/index.php即可**

***图床推荐：我目前就是用微博图床和GitHub+jsdelivr***

***微博因为有防盗链 这边建议使用微博图床[插件](https://chrome.google.com/webstore/detail/%E6%96%B0%E6%B5%AA%E5%BE%AE%E5%8D%9A%E5%9B%BE%E5%BA%8A/fdfdnfpdplfbbnemmmoklbfjbhecpnhf/related)***

