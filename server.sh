#!/bin/bash
echo "Start"
hexo clean
#hexo bangumi -u
hexo generate
hexo server
hexo clean
echo "Finish"
#exit 0
read -n 1