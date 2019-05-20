# Block Elements

## Headers 見出し

先頭に`#`をレベルの数だけ記述します。

# 見出し1
## 見出し2
### 見出し3
#### 見出し4
##### 見出し5
###### 見出し6

## ライン強調
==Marked text==

## [Block] 段落

空白行を挟むことで段落となります。

段落1

段落2

## Br 改行

改行の前に半角スペース`  `を2つ記述します。

  hoge
  fuga
  piyo

## Blockquotes 引用

先頭に`>`を記述します。ネストは`>`を多重に記述します。

> 引用
> 引用
>> 多重引用

## Code コード

`` `バッククオート` `` 3つ、あるいはダッシュ`~`３つで囲みます。

```
print 'hoge'
```


### インラインコード

`` `バッククオート` `` で単語を囲むとインラインコードになります。

これは `インラインコード`です。

## pre 整形済みテキスト

半角スペース4個もしくはタブで、コードブロックをpre表示できます

    class Hoge
        def hoge
            print 'hoge'
        end
    end

## Hr 水平線

アンダースコア`_` 、アスタリスク`*`、ハイフン`-`などを3つ以上連続して記述します。

***

___

---

# Lists

## Ul 箇条書きリスト

ハイフン`-`、プラス`+`、アスタリスク`*`のいずれかを先頭に記述します。
ネストはタブで表現します。

- リスト1
    - リスト1_1
        - リスト1_1_1
        - リスト1_1_2
    - リスト1_2
- リスト2
- リスト3

## Ol 番号付きリスト

`番号.`を先頭に記述します。ネストはタブで表現します。
番号は自動的に採番されるため、すべての行を1.と記述するのがお勧めです。

1. 番号付きリスト1
    1. 番号付きリスト1-1
    1. 番号付きリスト1-2
1. 番号付きリスト2
1. 番号付きリスト3

# Span Elements

## Link リンク

`[表示文字](URL)`でリンクに変換されます。

[Google](https://www.google.co.jp/)


### 外部参照リンク

URLが長くて読みづらくなる場合や同じリンクを何度も使用する場合は、リンク先への参照を定義できます。

[Googleを見る][Google]
[Google]: http://www.yahoo.co.jp

## 強調
### em

アスタリスク`*`もしくはアンダースコア`_`1個で文字列を囲みます。

これは *イタリック* です
これは _イタリック_ です

### strong

アスタリスク`*`もしくはアンダースコア`_`2個で文字列を囲みます。

これは **ボールド** です
これは __ボールド__ です

### em + strong

アスタリスク`*`もしくはアンダースコア`_`3個で文字列を囲みます。

これは ***イタリック＆ボールド*** です
これは ___イタリック＆ボールド___ です

## Images 画像

先頭の`!`で画像の<img>と認識されます。画像の大きさなどの指定をする場合はimgタグを使用します。

```
![alt](画像URL)
![代替文字列](URL "タイトル")
```
![Alt text][id]

[id]: https://octodex.github.com/images/dojocat.jpg



# Table 表

`-`と`|`を使ってtableを作成します。

| TH1 | TH2 |
----|----
| TD1 | TD3 |
| TD2 | TD4 |


| 左揃え | 中央揃え | 右揃え |
|:---|:---:|---:|
|1 |2 |3 |
|4 |5 |6 |



## Blockquotes


> Blockquotes can also be nested...
>> ...by using additional greater-than signs right next to each other...
> > > ...or with spaces between arrows.



## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

Autoconverted link https://github.com/nodeca/pica (enable linkify to see)


