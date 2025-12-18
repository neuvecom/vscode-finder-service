#!/bin/bash

# VS Code および VS Code Insiders用のFinderサービスをインストールするスクリプト

# カラー設定
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# VS Codeコマンドのパスを確認
echo -e "${YELLOW}VS Codeコマンドのパスを確認中...${NC}"

# VS Codeの実行可能ファイルのパスを見つける
VS_CODE_PATH=""
VS_CODE_INSIDERS_PATH=""

# 一般的な場所をチェック
if [ -f "/usr/local/bin/code" ]; then
    VS_CODE_PATH="/usr/local/bin/code"
elif [ -f "/opt/homebrew/bin/code" ]; then
    VS_CODE_PATH="/opt/homebrew/bin/code"
elif [ -f "$HOME/.local/bin/code" ]; then
    VS_CODE_PATH="$HOME/.local/bin/code"
elif command -v code &> /dev/null; then
    VS_CODE_PATH=$(which code)
fi

# VS Code Insidersの実行可能ファイルのパスを見つける
if [ -f "/usr/local/bin/code-insiders" ]; then
    VS_CODE_INSIDERS_PATH="/usr/local/bin/code-insiders"
elif [ -f "/opt/homebrew/bin/code-insiders" ]; then
    VS_CODE_INSIDERS_PATH="/opt/homebrew/bin/code-insiders"
elif [ -f "$HOME/.local/bin/code-insiders" ]; then
    VS_CODE_INSIDERS_PATH="$HOME/.local/bin/code-insiders"
elif command -v code-insiders &> /dev/null; then
    VS_CODE_INSIDERS_PATH=$(which code-insiders)
fi

echo -e "${GREEN}VS Code パス: ${VS_CODE_PATH:-'見つかりません'}${NC}"
echo -e "${GREEN}VS Code Insiders パス: ${VS_CODE_INSIDERS_PATH:-'見つかりません'}${NC}"

# Servicesディレクトリの作成
SERVICES_DIR="$HOME/Library/Services"
mkdir -p "$SERVICES_DIR"

# VS Code サービスの作成とインストール
if [ -n "$VS_CODE_PATH" ]; then
    echo -e "${YELLOW}VS Code サービスをインストール中...${NC}"
    
    # ワークフローディレクトリの作成
    VS_CODE_WORKFLOW="$SERVICES_DIR/Open with VS Code.workflow"
    mkdir -p "$VS_CODE_WORKFLOW/Contents"
    
    # Info.plistファイルをコピー
    cp "VSCode-Info.plist" "$VS_CODE_WORKFLOW/Contents/Info.plist"
    
    # document.wflowファイルをコピーして、パスを修正
    sed "s|/usr/local/bin/code|$VS_CODE_PATH|g" "VSCode-document.wflow" > "$VS_CODE_WORKFLOW/Contents/document.wflow"
    
    echo -e "${GREEN}✓ VS Code サービスがインストールされました${NC}"

    # VS Code (neuvecom プロファイル) サービスの作成
    echo -e "${YELLOW}VS Code (neuvecom) サービスをインストール中...${NC}"

    VS_CODE_NEUVECOM_WORKFLOW="$SERVICES_DIR/Open with VS Code (neuvecom).workflow"
    mkdir -p "$VS_CODE_NEUVECOM_WORKFLOW/Contents"

    cp "VSCode-neuvecom-Info.plist" "$VS_CODE_NEUVECOM_WORKFLOW/Contents/Info.plist"
    sed "s|/usr/local/bin/code|$VS_CODE_PATH|g" "VSCode-neuvecom-document.wflow" > "$VS_CODE_NEUVECOM_WORKFLOW/Contents/document.wflow"

    echo -e "${GREEN}✓ VS Code (neuvecom) サービスがインストールされました${NC}"

    # VS Code (ss-yoshiharu-sato プロファイル) サービスの作成
    echo -e "${YELLOW}VS Code (ss-yoshiharu-sato) サービスをインストール中...${NC}"

    VS_CODE_SS_WORKFLOW="$SERVICES_DIR/Open with VS Code (ss-yoshiharu-sato).workflow"
    mkdir -p "$VS_CODE_SS_WORKFLOW/Contents"

    cp "VSCode-ss-yoshiharu-sato-Info.plist" "$VS_CODE_SS_WORKFLOW/Contents/Info.plist"
    sed "s|/usr/local/bin/code|$VS_CODE_PATH|g" "VSCode-ss-yoshiharu-sato-document.wflow" > "$VS_CODE_SS_WORKFLOW/Contents/document.wflow"

    echo -e "${GREEN}✓ VS Code (ss-yoshiharu-sato) サービスがインストールされました${NC}"
else
    echo -e "${RED}✗ VS Code が見つからないため、スキップします${NC}"
    echo -e "${YELLOW}  VS Codeをインストールするか、シンボリックリンクを作成してください：${NC}"
    echo -e "${YELLOW}  sudo ln -sf '/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' /usr/local/bin/code${NC}"
fi

# VS Code Insiders サービスの作成とインストール
if [ -n "$VS_CODE_INSIDERS_PATH" ]; then
    echo -e "${YELLOW}VS Code Insiders サービスをインストール中...${NC}"
    
    # ワークフローディレクトリの作成
    VS_CODE_INSIDERS_WORKFLOW="$SERVICES_DIR/Open with VS Code Insiders.workflow"
    mkdir -p "$VS_CODE_INSIDERS_WORKFLOW/Contents"
    
    # Info.plistファイルをコピー
    cp "VSCodeInsiders-Info.plist" "$VS_CODE_INSIDERS_WORKFLOW/Contents/Info.plist"
    
    # document.wflowファイルをコピーして、パスを修正
    sed "s|/usr/local/bin/code-insiders|$VS_CODE_INSIDERS_PATH|g" "VSCodeInsiders-document.wflow" > "$VS_CODE_INSIDERS_WORKFLOW/Contents/document.wflow"
    
    echo -e "${GREEN}✓ VS Code Insiders サービスがインストールされました${NC}"
else
    echo -e "${RED}✗ VS Code Insiders が見つからないため、スキップします${NC}"
    echo -e "${YELLOW}  VS Code Insidersをインストールするか、シンボリックリンクを作成してください：${NC}"
    echo -e "${YELLOW}  sudo ln -sf '/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code' /usr/local/bin/code-insiders${NC}"
fi

# サービスキャッシュの更新
echo -e "${YELLOW}サービスキャッシュを更新中...${NC}"
/System/Library/CoreServices/pbs -flush

# Finderの再起動
echo -e "${YELLOW}Finderを再起動中...${NC}"
killall Finder

echo -e "${GREEN}インストール完了！${NC}"
echo -e "${YELLOW}使用方法：${NC}"
echo -e "1. Finderでフォルダを右クリック"
echo -e "2. 'サービス' メニューから以下のいずれかを選択："
echo -e "   - 'Open with VS Code'"
echo -e "   - 'Open with VS Code (neuvecom)'"
echo -e "   - 'Open with VS Code (ss-yoshiharu-sato)'"
echo -e "   - 'Open with VS Code Insiders'"
echo -e ""
echo -e "${YELLOW}注意：${NC}"
echo -e "サービスが表示されない場合は、以下を確認してください："
echo -e "1. システム環境設定 > キーボード > ショートカット > サービス"
echo -e "2. 該当するサービスにチェックが入っているか確認"
