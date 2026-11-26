#!/bin/bash
# SPDX-FileCopyrightText: 2026 YOUR NAME
# SPDX-License-Identifier: BSD-3-Clause

if command -v python3 >/dev/null 2>&1; then
    PYTHON=python3
else
    PYTHON=python
fi

ng () {
    echo "テスト失敗: ${1}行目" >&2
    res=1
}

res=0

# 基本的な集計
out=$(printf 'apple\nbanana\napple\norange\nbanana\napple\n' | $PYTHON linefreq)
expected=$(printf '3\tapple\n2\tbanana\n1\torange')
[ "$out" = "$expected" ] || ng "$LINENO"

# 同じ文字列だけ
out=$(printf 'hello\nhello\nhello\n' | $PYTHON linefreq)
expected=$(printf '3\thello')
[ "$out" = "$expected" ] || ng "$LINENO"

# 同数なら文字列順
out=$(printf 'zebra\napple\nbanana\napple\nbanana\nzebra\n' | $PYTHON linefreq)
expected=$(printf '2\tapple\n2\tbanana\n2\tzebra')
[ "$out" = "$expected" ] || ng "$LINENO"

# 空行を無視する
out=$(printf 'apple\n\nbanana\n\napple\n' | $PYTHON linefreq)
expected=$(printf '2\tapple\n1\tbanana')
[ "$out" = "$expected" ] || ng "$LINENO"

# 空入力
out=$(printf '' | $PYTHON linefreq)
expected=''
[ "$out" = "$expected" ] || ng "$LINENO"

[ "$res" = 0 ] && echo "OK"
exit "$res"