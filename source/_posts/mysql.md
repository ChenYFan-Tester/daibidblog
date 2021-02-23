---
layout: post
title: 将myqsl的utf8转为utf8mb4
tags:
  - Mysql
  - utf8
  - utf8mb4
  - bug
cover: 'https://cdn.jsdelivr.net/gh/Daibi-mua/cdn@main/jiuzheabuhuiba.png'
abbrlink: 57437
date: 2021-01-13 09:46:40
---

# 原因

今天使用typecho，发现不支持Emoji，去查了查原因，因为utf8在mysql里面不是真正的utf8，这个只能保存3个字节，而utf8mb4是后面更新的，能保存四个字节，而且官方也没有更新这个的说明。

# 解决方案

我是使用的phpmyadmin去连接Mysql,出现的问题是连接不上，解决方法就是换php版本，把php换到7.4，然后去phpmyadmin设置里面更换php版本。

## 更改Mysql排序规则

- 进入Mysql，更改所有文件的排序规则

![](https://cdn.jsdelivr.net/gh/Daibi-mua/jsdelivr@1.3/slq.png)

- 当然你也可以进入数据库，直接运行下列语句

```
alter table typecho_comments convert to character set utf8mb4 collate utf8mb4_general_ci;
alter table typecho_contents convert to character set utf8mb4 collate utf8mb4_general_ci;
alter table typecho_fields convert to character set utf8mb4 collate utf8mb4_general_ci;
alter table typecho_metas convert to character set utf8mb4 collate utf8mb4_general_ci;
alter table typecho_options convert to character set utf8mb4 collate utf8mb4_general_ci;
alter table typecho_relationships convert to character set utf8mb4 collate utf8mb4_general_ci;
alter table typecho_users convert to character set utf8mb4 collate utf8mb4_general_ci;
```

## 修改数据库的配置文件

网站根目录数据库配置文件`config.inc.php`，大约在60行

```
/** 定义数据库参数 */
$db = new Typecho_Db('Pdo_Mysql', 'typecho_');
$db->addServer(array (
  ...
  'charset' => 'utf8mb4',  // 将原来的utf8修改为 utf8mb4
  ...
), Typecho_Db::READ | Typecho_Db::WRITE);
Typecho_Db::set($db);
```

然后重载Mysql服务就ok了