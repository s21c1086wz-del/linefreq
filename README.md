# linefreq

`linefreq` は、標準入力から読み込んだ行の出現回数を集計するコマンドです。

ログやアンケート回答など、同じ内容が何度出現するか調べるときに利用できます。

## 機能

- 標準入力から行を読み込む。
- 各行の出現回数を集計する。
- 出現回数の多い順に表示する。
- 出現回数が同じ場合は文字列の昇順に表示する。
- 空行と空白のみの行は無視する。

## 必要環境

- Python 3.10 以上

## インストール

GitHubからリポジトリを取得します。

```bash
$ git clone https://github.com/s21c1086wz-del/linefreq.git
$ cd linefreq
```

## 使用方法

### Windows（PowerShell）

```powershell
python linefreq
```

コマンドを実行したあと、集計したい文字列を1行ずつ入力します。

入力を終了するには `Ctrl + Z` を押してから Enter を押します。

### Linux

ファイルから入力する場合:

```bash
$ python3 linefreq < input.txt
```

パイプを使う場合:

```bash
$ cat input.txt | python3 linefreq
```

## 実行例

入力:

```text
apple
banana
apple
orange
banana
apple
```

出力:

```text
3	apple
2	banana
1	orange
```

## テスト

テストスクリプトを実行します。

```bash
$ bash test.bash
```

すべてのテストが成功すると `OK` と表示されます。

## ライセンス

BSD-3-Clause

## 著作権

Copyright (c) 2026 Masaki Naoe