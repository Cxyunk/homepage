#!/usr/bin/env bash
# 用法: bash deploy.sh <GitHub用户名> [仓库名,默认 homepage]
# 需要本机已安装 git,并已登录 GitHub(HTTPS 令牌或 SSH 均可)。
set -e
U="${1:?请传入 GitHub 用户名}"; R="${2:-homepage}"
git init -q -b main
git add index.html resume.pdf .nojekyll README.md
git commit -qm "Add personal homepage"
git remote add origin "https://github.com/$U/$R.git"
echo "请先在 https://github.com/new 建好空仓库 $R (Public),然后继续..."
git push -u origin main
echo "接着在仓库 Settings → Pages → Branch 选 main / (root) → Save"
echo "约 1 分钟后访问: https://$U.github.io/$R/"
