#!/bin/bash

# VS Code および VS Code Insiders用のFinderサービスをアンインストールするスクリプト

# カラー設定
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}VS Code Finderサービスをアンインストール中...${NC}"

# Servicesディレクトリ
SERVICES_DIR="$HOME/Library/Services"

# VS Code関連のサービスを削除
SERVICES_TO_REMOVE=(
    "Open with VS Code.workflow"
    "Open with VS Code Insiders.workflow"
    "Open with VS Code Insiders (neuvecom).workflow"
    "Open with VS Code Insiders (ss-yoshiharu-sato).workflow"
    "Open with VS Code (neuvecom).workflow"
    "Open with VS Code (ss-yoshiharu-sato).workflow"
    "VS Codeで開く.workflow"
)

for service in "${SERVICES_TO_REMOVE[@]}"; do
    SERVICE_PATH="$SERVICES_DIR/$service"
    if [ -d "$SERVICE_PATH" ]; then
        echo -e "${YELLOW}削除中: $service${NC}"
        rm -rf "$SERVICE_PATH"
        echo -e "${GREEN}✓ $service が削除されました${NC}"
    else
        echo -e "${RED}✗ $service は見つかりませんでした${NC}"
    fi
done

# サービスキャッシュの更新
echo -e "${YELLOW}サービスキャッシュを更新中...${NC}"
/System/Library/CoreServices/pbs -flush

# Finderの再起動
echo -e "${YELLOW}Finderを再起動中...${NC}"
killall Finder

echo -e "${GREEN}アンインストール完了！${NC}"
