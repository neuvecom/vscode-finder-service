# VS Code Finder Service

[English](#english) | [日本語](#japanese)

## English

A macOS Finder service that adds "Open with VS Code" and "Open with VS Code Insiders" options to the right-click context menu for folders.

### Features

- **Open with VS Code**: Open selected folder in VS Code
- **Open with VS Code Insiders**: Open selected folder in VS Code Insiders
- **Open with VS Code Insiders (neuvecom)**: Open with VS Code Insiders using the "neuvecom" profile
- **Open with VS Code Insiders (ss-yoshiharu-sato)**: Open with VS Code Insiders using the "ss-yoshiharu-sato" profile

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/neuvecom/vscode-finder-service.git
   cd vscode-finder-service
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

### Usage

1. Right-click on a folder in Finder
2. Select "Services" menu
3. Choose one of:
   - "Open with VS Code"
   - "Open with VS Code Insiders"
   - "Open with VS Code Insiders (neuvecom)"
   - "Open with VS Code Insiders (ss-yoshiharu-sato)"

### Requirements

- macOS 10.5 or later
- VS Code and/or VS Code Insiders installed
- VS Code command line tools installed

### Troubleshooting

#### Services don't appear in the menu

1. **Check System Preferences**:
   - System Preferences > Keyboard > Shortcuts > Services
   - Ensure "Open with VS Code" and "Open with VS Code Insiders" are checked

2. **Check VS Code command line tools**:
   ```bash
   which code
   which code-insiders
   ```
   
   If commands are not found, create symbolic links:
   ```bash
   # VS Code
   sudo ln -sf '/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' /usr/local/bin/code
   
   # VS Code Insiders
   sudo ln -sf '/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code' /usr/local/bin/code-insiders
   ```

3. **Refresh services cache**:
   ```bash
   /System/Library/CoreServices/pbs -flush
   killall Finder
   ```

### Uninstallation

```bash
./uninstall.sh
```

---

## Japanese

## VS Code Finder サービス

Finderでディレクトリを選択した状態で、右クリックメニューから「VS Codeで開く」「VS Code Insidersで開く」を選択できるようにするサービスです。

## 機能

- **Open with VS Code**: 選択したフォルダをVS Codeで開く
- **Open with VS Code Insiders**: 選択したフォルダをVS Code Insidersで開く
- **Open with VS Code Insiders (neuvecom)**: 「neuvecom」プロファイルでVS Code Insidersを開く
- **Open with VS Code Insiders (ss-yoshiharu-sato)**: 「ss-yoshiharu-sato」プロファイルでVS Code Insidersを開く

## インストール

1. リポジトリをクローン:
   ```bash
   git clone https://github.com/neuvecom/vscode-finder-service.git
   cd vscode-finder-service
   ```

2. インストールスクリプトを実行:
   ```bash
   ./install.sh
   ```

## 使用方法

1. Finderでフォルダを右クリック
2. 「サービス」メニューを選択
3. 以下のいずれかを選択：
   - 「Open with VS Code」
   - 「Open with VS Code Insiders」
   - 「Open with VS Code Insiders (neuvecom)」
   - 「Open with VS Code Insiders (ss-yoshiharu-sato)」

## トラブルシューティング

### サービスが表示されない場合

1. **システム環境設定での確認**:
   - システム環境設定 > キーボード > ショートカット > サービス
   - 「Open with VS Code」と「Open with VS Code Insiders」にチェックが入っているか確認

2. **VS Codeコマンドの確認**:
   ```bash
   which code
   which code-insiders
   ```
   
   コマンドが見つからない場合は、シンボリックリンクを作成:
   ```bash
   # VS Code
   sudo ln -sf '/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' /usr/local/bin/code
   
   # VS Code Insiders
   sudo ln -sf '/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code' /usr/local/bin/code-insiders
   ```

3. **サービスキャッシュの更新**:
   ```bash
   /System/Library/CoreServices/pbs -flush
   killall Finder
   ```

### 動作しない場合

1. **ログの確認**:
   ```bash
   # Console.appでFinderのログを確認
   # または、ターミナルで:
   log stream --predicate 'process == "Finder"' --level debug
   ```

2. **権限の確認**:
   ```bash
   ls -la ~/Library/Services/
   ```

## アンインストール

```bash
./uninstall.sh
```

## ファイル構成

- `install.sh`: インストールスクリプト
- `uninstall.sh`: アンインストールスクリプト
- `VSCode-Info.plist`: VS Code サービス設定ファイル
- `VSCode-document.wflow`: VS Code ワークフロー定義
- `VSCodeInsiders-Info.plist`: VS Code Insiders サービス設定ファイル
- `VSCodeInsiders-document.wflow`: VS Code Insiders ワークフロー定義
- `VSCodeInsiders-neuvecom-Info.plist`: VS Code Insiders (neuvecom) サービス設定ファイル
- `VSCodeInsiders-neuvecom-document.wflow`: VS Code Insiders (neuvecom) ワークフロー定義
- `VSCodeInsiders-ss-yoshiharu-sato-Info.plist`: VS Code Insiders (ss-yoshiharu-sato) サービス設定ファイル
- `VSCodeInsiders-ss-yoshiharu-sato-document.wflow`: VS Code Insiders (ss-yoshiharu-sato) ワークフロー定義

## 技術詳細

このサービスは、macOSのAutomatorワークフローとして実装されています：

- **入力**: フォルダまたはディレクトリ
- **処理**: シェルスクリプトでVS Codeコマンドを実行
- **出力**: なし（VS Codeでフォルダが開かれる）

ワークフローは`~/Library/Services/`に配置され、Finderのコンテキストメニューに自動的に表示されます。
