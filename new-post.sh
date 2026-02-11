#!/bin/bash
# 快速创建新博客文章
# 自动将北京时间转换为 UTC 时间

if [ -z "$1" ]; then
    echo "用法: ./new-post.sh '文章标题'"
    exit 1
fi

TITLE="$1"
# 将标题转换为 slug（小写，空格替换为连字符）
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -d '[:punct:]')
# 获取当前北京时间，然后转换为 UTC（减去8小时）
PUB_TIME=$(date -u '+%Y-%m-%dT%H:%M:%SZ')
# 文件名
FILE="src/data/blog/$(date '+%Y-%m-%d')-${SLUG}.md"

cat > "$FILE" << EOF
---
author: Yy
pubDatetime: $PUB_TIME
modDatetime: $PUB_TIME
title: $TITLE
slug: $SLUG
featured: false
draft: true
tags:
  - 未分类
description:
  $TITLE
---

## $TITLE

EOF

echo "✅ 文章已创建: $FILE"
echo "📅 发布时间 (UTC): $PUB_TIME"
echo "📝 请编辑文件内容"
