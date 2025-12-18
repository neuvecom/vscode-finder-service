# VS Code Insiders 拡張機能整理作業記録

**実施日**: 2024-11-23
**対象プロファイル**: デフォルトプロファイル

## 概要

VS Code Insidersの拡張機能を87個から24個に整理した。
使用言語（Python、JavaScript、TypeScript、zsh、Markdown）に必要なものだけを残し、使わない言語やツールの拡張機能を削除。

## 整理前後の比較

| 項目 | 数 |
|------|-----|
| 整理前 | 87個 |
| 整理後 | 24個 |
| 削減数 | 63個 |

## 残した拡張機能（24個）

### AI/コーディングアシスタント（5個）
| 拡張機能ID | 説明 |
|------------|------|
| anthropic.claude-code | Claude Code |
| github.copilot | GitHub Copilot |
| github.copilot-chat | Copilot Chat |
| google.geminicodeassist | Gemini Code Assist |
| neuvecom.github-copilot-voice-hooks | 自作Hook |

### Python（4個）
| 拡張機能ID | 説明 |
|------------|------|
| ms-python.python | Python基本機能 |
| ms-python.vscode-pylance | 型チェック・補完 |
| ms-python.debugpy | デバッガ |
| ms-python.black-formatter | Blackフォーマッタ |

### JavaScript/Web（3個）
| 拡張機能ID | 説明 |
|------------|------|
| dbaeumer.vscode-eslint | ESLint |
| esbenp.prettier-vscode | Prettier |
| ritwickdey.liveserver | ライブサーバー |

### 設定ファイル/データ（3個）
| 拡張機能ID | 説明 |
|------------|------|
| redhat.vscode-yaml | YAML |
| tamasfe.even-better-toml | TOML |
| alexcvzz.vscode-sqlite | SQLite |

### Markdown（2個）
| 拡張機能ID | 説明 |
|------------|------|
| yzhang.markdown-all-in-one | Markdown総合 |
| bpruitt-goddard.mermaid-markdown-syntax-highlighting | Mermaid図 |

### ユーティリティ（7個）
| 拡張機能ID | 説明 |
|------------|------|
| ms-ceintl.vscode-language-pack-ja | 日本語化 |
| vscode-icons-team.vscode-icons | アイコンテーマ |
| tomoki1207.pdf | PDFビューア |
| mushan.vscode-paste-image | 画像貼り付け |
| soerenuhrbach.vscode-deepl | DeepL翻訳 |
| ms-vscode-remote.remote-containers | Devcontainer |
| amodio.tsl-problem-matcher | 問題マッチャー |

## 削除した拡張機能（63個）

### 使わない言語のシンタックス/サポート
- 13xforever.language-x86-64-assembly (x86アセンブリ)
- basdp.language-gas-x86 (GASアセンブリ)
- devkir.elixir-syntax-vscode (Elixir)
- yuce.erlang-otp (Erlang)
- justusadam.language-haskell (Haskell)
- fredrikbakke.agda-syntax (Agda)
- scala-lang.scala (Scala)
- shopify.ruby-lsp (Ruby)
- gimly81.fortran (Fortran)
- toasty-technologies.octave (Octave/MATLAB)
- jep-a.lua-plus (Lua)
- oscarcs.dart-syntax-highlighting-only (Dart)
- dtsvet.vscode-wasm (WebAssembly)
- guyskk.language-cython (Cython)
- dustypomerleau.rust-syntax (Rust)
- karunamurti.haml (HAML)
- kennethceyer.io (io言語)
- jonwolfe.language-polymer (Polymer)
- syler.sass-indented (Sass)
- radium-v.better-less (Less)
- dmitry-korobchenko.prototxt (Prototxt)
- mariomatheu.syntax-project-pbxproj (Xcode pbxproj)

### jeff-hykin.better-* シリーズ（使わない言語）
- jeff-hykin.better-c-syntax
- jeff-hykin.better-cpp-syntax
- jeff-hykin.better-go-syntax
- jeff-hykin.better-lisp-syntax
- jeff-hykin.better-objc-syntax
- jeff-hykin.better-objcpp-syntax
- jeff-hykin.better-perl-syntax
- jeff-hykin.better-prolog-syntax
- jeff-hykin.better-syntax

### シェーダー/グラフィック系
- slevesque.shader
- geforcelegend.vscode-glsl
- boyswan.glsl-literal

### ハードウェア/ゲーム開発
- geequlim.godot-tools (Godot)
- vscode-arduino.vscode-arduino-community (Arduino)
- ms-vscode.vscode-serial-monitor (シリアルモニタ)
- ms-vscode.cpptools (C/C++)

### 重複/不要なツール
- magicstack.magicpython (Pylanceで十分)
- qwtel.sqlite-viewer (vscode-sqliteと重複)
- ldez.ignore-files (gitignoreと重複)
- shd101wyy.markdown-preview-enhanced (all-in-oneで十分)
- bierner.markdown-preview-github-styles (all-in-oneで十分)
- foam.foam-vscode (使用していない)
- marp-team.marp-vscode (使用していない)
- ms-python.vscode-python-envs (基本機能で十分)
- jakebathman.mysql-syntax (使用していない)
- colton.inline-html (使用していない)
- ms-vscode.wordcount (使用していない)
- ms-windows-ai-studio.windows-ai-studio (Mac不要)
- bbenoist.nix (使用していない)
- google.gemini-cli-vscode-ide-companion (geminicodeassistで十分)
- your-publisher-name.markdown-format-checker (不明/自作)

## 整理の判断基準

### 残す基準
1. メイン言語（Python、JavaScript、TypeScript）に必要
2. 設定ファイル（YAML、TOML）の編集に必要
3. Markdownドキュメント作成に必要
4. AI支援ツール（Claude Code、Copilot、Gemini）
5. 日常的に使用するユーティリティ

### 削除する基準
1. 使わない言語のシンタックスハイライト
2. 重複する機能（複数の類似拡張機能がある場合）
3. 特殊用途（ゲーム開発、ハードウェア）で現在使用していない
4. Windows専用機能

## 整理前の拡張機能一覧

```
13xforever.language-x86-64-assembly
alexcvzz.vscode-sqlite
amodio.tsl-problem-matcher
anthropic.claude-code
basdp.language-gas-x86
bbenoist.nix
bierner.lit-html
bierner.markdown-preview-github-styles
boyswan.glsl-literal
bpruitt-goddard.mermaid-markdown-syntax-highlighting
codezombiech.gitignore
colton.inline-html
dbaeumer.vscode-eslint
devkir.elixir-syntax-vscode
dmitry-korobchenko.prototxt
dtsvet.vscode-wasm
dustypomerleau.rust-syntax
esbenp.prettier-vscode
foam.foam-vscode
fredrikbakke.agda-syntax
geequlim.godot-tools
geforcelegend.vscode-glsl
gimly81.fortran
github.copilot
github.copilot-chat
google.gemini-cli-vscode-ide-companion
google.geminicodeassist
guyskk.language-cython
idleberg.applescript
jakebathman.mysql-syntax
jeff-hykin.better-c-syntax
jeff-hykin.better-cpp-syntax
jeff-hykin.better-csv-syntax
jeff-hykin.better-dockerfile-syntax
jeff-hykin.better-go-syntax
jeff-hykin.better-js-syntax
jeff-hykin.better-lisp-syntax
jeff-hykin.better-objc-syntax
jeff-hykin.better-objcpp-syntax
jeff-hykin.better-perl-syntax
jeff-hykin.better-prolog-syntax
jeff-hykin.better-shellscript-syntax
jeff-hykin.better-syntax
jep-a.lua-plus
jonwolfe.language-polymer
justusadam.language-haskell
karunamurti.haml
kennethceyer.io
ldez.ignore-files
magicstack.magicpython
mariomatheu.syntax-project-pbxproj
marp-team.marp-vscode
ms-ceintl.vscode-language-pack-ja
ms-python.black-formatter
ms-python.debugpy
ms-python.python
ms-python.vscode-pylance
ms-python.vscode-python-envs
ms-vscode-remote.remote-containers
ms-vscode.cpptools
ms-vscode.vscode-serial-monitor
ms-vscode.wordcount
ms-windows-ai-studio.windows-ai-studio
mushan.vscode-paste-image
neuvecom.github-copilot-voice-hooks
oscarcs.dart-syntax-highlighting-only
qwtel.sqlite-viewer
radium-v.better-less
redcmd.tmlanguage-syntax-highlighter
redhat.vscode-yaml
ritwickdey.liveserver
scala-lang.scala
shd101wyy.markdown-preview-enhanced
shopify.ruby-lsp
sidneys1.gitconfig
slevesque.shader
soerenuhrbach.vscode-deepl
syler.sass-indented
tamasfe.even-better-toml
toasty-technologies.octave
tomoki1207.pdf
vscode-arduino.vscode-arduino-community
vscode-icons-team.vscode-icons
your-publisher-name.markdown-format-checker
yuce.erlang-otp
yzhang.markdown-all-in-one
```

## 整理後の拡張機能一覧

```
alexcvzz.vscode-sqlite
amodio.tsl-problem-matcher
anthropic.claude-code
bpruitt-goddard.mermaid-markdown-syntax-highlighting
dbaeumer.vscode-eslint
esbenp.prettier-vscode
github.copilot
github.copilot-chat
google.geminicodeassist
ms-ceintl.vscode-language-pack-ja
ms-python.black-formatter
ms-python.debugpy
ms-python.python
ms-python.vscode-pylance
ms-vscode-remote.remote-containers
mushan.vscode-paste-image
neuvecom.github-copilot-voice-hooks
redhat.vscode-yaml
ritwickdey.liveserver
soerenuhrbach.vscode-deepl
tamasfe.even-better-toml
tomoki1207.pdf
vscode-icons-team.vscode-icons
yzhang.markdown-all-in-one
```

## 削除コマンド（参考）

他のプロファイルでも同様の整理を行う場合のコマンド：

```bash
# プロファイル指定で削除する場合
code-insiders --profile "プロファイル名" --uninstall-extension 拡張機能ID

# 一括削除（デフォルトプロファイル）
code-insiders --uninstall-extension 13xforever.language-x86-64-assembly
code-insiders --uninstall-extension basdp.language-gas-x86
# ... 以下同様
```

## 備考

- プロファイルごとに拡張機能は独立して管理される
- 他のプロファイル（neuvecom、ss-yoshiharu-sato）でも必要に応じて同様の整理を実施可能
- 削除した拡張機能は後から再インストール可能
