# GitHub Pages セットアップ手順

このドキュメントは、VS Code Finder ServiceのGitHub Pagesを有効化して公式サイトを公開する手順を説明します。

## 前提条件

- GitHubアカウントを持っていること
- リポジトリ `neuvecom/vscode-finder-service` への書き込み権限があること
- ローカルに変更がコミットされていること

## セットアップ手順

### 1. 変更をGitHubにプッシュ

まず、ローカルでコミットした変更をGitHubにプッシュします：

```bash
# リモートの状態を確認
git remote -v

# mainブランチにプッシュ
git push origin main
```

**認証エラーが発生する場合：**

GitHub認証を設定する必要があります。以下のいずれかの方法を使用してください：

#### 方法1: GitHub CLI (推奨)
```bash
# GitHub CLIをインストール（未インストールの場合）
brew install gh

# GitHub認証
gh auth login

# プッシュ
git push origin main
```

#### 方法2: Personal Access Token
1. GitHubで Personal Access Token (PAT) を作成
   - https://github.com/settings/tokens
   - "Generate new token (classic)" をクリック
   - `repo` スコープを選択
   - トークンをコピー

2. 認証情報を更新
```bash
# HTTPSのURLを使用している場合
git remote set-url origin https://<YOUR_TOKEN>@github.com/neuvecom/vscode-finder-service.git

# または、プッシュ時にトークンを使用
git push https://<YOUR_TOKEN>@github.com/neuvecom/vscode-finder-service.git main
```

### 2. GitHub Pagesを有効化

1. GitHubリポジトリにアクセス
   - https://github.com/neuvecom/vscode-finder-service

2. リポジトリの設定ページを開く
   - "Settings" タブをクリック

3. GitHub Pagesの設定セクションに移動
   - 左サイドバーの "Pages" をクリック

4. ソースを設定
   - "Source" セクションで以下を選択：
     - **Branch**: `main`
     - **Folder**: `/docs`
   - "Save" ボタンをクリック

### 3. デプロイの確認

1. GitHub Actionsでデプロイ状況を確認
   - リポジトリの "Actions" タブをクリック
   - "pages build and deployment" ワークフローが実行中/完了していることを確認

2. デプロイ完了後、公開URLを確認
   - "Settings" > "Pages" に戻る
   - "Your site is live at" のメッセージが表示されます
   - 通常は `https://neuvecom.github.io/vscode-finder-service/` という形式

### 4. サイトの動作確認

公開URLにアクセスして、以下を確認：

- ✅ ページが正しく表示される
- ✅ CSSスタイルが適用されている
- ✅ 日本語/英語の言語切り替えが動作する
- ✅ すべてのセクション（機能、インストール、トラブルシューティング）が表示される
- ✅ リンクが正しく動作する

## カスタムドメインの設定（オプション）

独自ドメインを使用したい場合：

1. "Settings" > "Pages" > "Custom domain" に移動
2. ドメイン名を入力（例：`vscode-finder.example.com`）
3. DNSプロバイダーでCNAMEレコードを設定
   ```
   CNAME vscode-finder -> neuvecom.github.io
   ```
4. "Enforce HTTPS" をチェック（推奨）

## トラブルシューティング

### ページが404エラーになる

- GitHub Pagesの設定が正しいか確認
  - Branch: `main`
  - Folder: `/docs`
- `docs/index.html` ファイルが存在するか確認
- デプロイが完了しているか "Actions" タブで確認

### CSSが適用されない

- `docs/style.css` ファイルが存在するか確認
- `index.html` の `<link>` タグのパスが正しいか確認
  ```html
  <link rel="stylesheet" href="style.css">
  ```
- ブラウザのキャッシュをクリア（Cmd+Shift+R）

### デプロイが失敗する

1. "Actions" タブでエラーログを確認
2. HTMLファイルの構文エラーをチェック
3. ファイルパスが正しいか確認

### 変更が反映されない

- GitHub Pagesのキャッシュは最大10分かかる場合があります
- ブラウザのキャッシュをクリア
- 強制リロード（Cmd+Shift+R）

## メンテナンス

### サイトの更新方法

1. ローカルで `docs/index.html` や `docs/style.css` を編集
2. 変更をコミット
   ```bash
   git add docs/
   git commit -m "[docs] サイトの内容を更新"
   git push origin main
   ```
3. GitHub Actionsが自動的に再デプロイ
4. 数分後に変更が反映される

### サイトの無効化

GitHub Pagesを無効化する場合：

1. "Settings" > "Pages" に移動
2. "Source" で "None" を選択
3. "Save" をクリック

## 参考リンク

- [GitHub Pages 公式ドキュメント](https://docs.github.com/ja/pages)
- [GitHub Pages のトラブルシューティング](https://docs.github.com/ja/pages/getting-started-with-github-pages/troubleshooting-404-errors-for-github-pages-sites)
- [カスタムドメインの設定](https://docs.github.com/ja/pages/configuring-a-custom-domain-for-your-github-pages-site)
