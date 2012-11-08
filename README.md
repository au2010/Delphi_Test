Delphi_Test
===========
テスト用コード置き場

## StreamReader
TStreamReaderの検証用コード

WindowsXP SP3では、読み込むテキストのマルチバイトである場合、
TStreamReaderのバッファの境界でマルチバイト文字が分断された時
その文字が化ける。

Vista以降では問題無し。
