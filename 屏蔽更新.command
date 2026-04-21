#!/bin/bash
echo "==================================="
echo "    一键屏蔽系统更新 (macOS 26.4)"
echo "==================================="

# 屏蔽更新服务器（最有效）
echo "127.0.0.1 swscan.apple.com" | sudo tee -a /etc/hosts
echo "127.0.0.1 swquery.apple.com" | sudo tee -a /etc/hosts
echo "127.0.0.1 swcdn.apple.com" | sudo tee -a /etc/hosts
echo "127.0.0.1 gdmf.apple.com" | sudo tee -a /etc/hosts
echo "127.0.0.1 updates.apple.com" | sudo tee -a /etc/hosts

# 关闭系统更新检查
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -bool false

# 清空更新缓存
sudo rm -rf /Library/Updates/*
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder

echo ""
echo "✅ 屏蔽完成，请重启电脑！"
echo ""
read -p "按回车退出"