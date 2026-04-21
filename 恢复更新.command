#!/bin/bash
echo "==================================="
echo "    一键恢复系统更新 (macOS 26.4)"
echo "==================================="

# 恢复hosts
sudo cp /etc/hosts.bak /etc/hosts

# 恢复更新设置
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -bool false

# 刷新DNS缓存
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder

echo ""
echo "✅ 恢复完成，请重启电脑！"
echo ""
read -p "按回车退出"