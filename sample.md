## <a name="1">段落

段落は1つ以上の連続したテキストであり、空行によって分けられる。
通常の段落をスペースやタブでインデントしてはならない。

- - -

**code**

    これは段落です。2つの文があります。

    これは別の段落です。ここにも2つの文があります。

**表示**

これは段落です。2つの文があります。

これは別の段落です。ここにも2つの文があります。

## <a name="2">改行

行末に **2つ** のスペースを挿入すればよい。

- - -

**code**

    リンゴ
    ブドウ
    バナナ

**表示**

リンゴ
ブドウ
バナナ

## <a name="3">テキストの強調

- - -

**code**

    *強調* もしくは _強調_（斜体として表現されることが多い）

    **強い強調** もしくは __強い強調__（太字として表現されることが多い）

**表示**

*強調* もしくは _強調_（斜体として表現されることが多い）

**強い強調** もしくは __強い強調__（太字として表現されることが多い）

## <a name="4">コード

4つ以上のスペースを行頭に書く。
Markdownは通常、改行や連続したスペースを削除するため、インデントやコードのレイアウトを
壊す可能性があるが、この場合Markdownは空白をすべて保持する。
(GFMでは```で囲むと同様の効果がある。下記の様な表記も可能)

- - -

**code**

        1行目
        2行目
        3行目
##
    ```
    1行目
    2行目
    3行目
    ```


**表示**

    1行目
    2行目
    3行目

```
1行目
2行目
3行目
```

## <a name="5">シンタックスハイライト

\```(language)で囲む

- - -

**code**

    ```c
    #include <stdio.h>

    int main(int argc, char **argv)
    {
      printf("%s\n", "Hello, World");
      return 0;
    }
    ```

**表示**

```c
#include <stdio.h>

int main(int argc, char **argv)
{
  printf("%s\n", "Hello, World");
  return 0;
}
```
- - -

**code**

    ```python
    #!/usr/bin/env python3.2
    # -*- coding: utf-8 -*-

    print("%s" %("Hello, World"))
    ```

**表示**

```python
#!/usr/bin/env python3.2
# -*- coding: utf-8 -*-

print("%s" %("Hello, World"))
```

## <a name="6">リスト

アスタリスク(\*)やハイフン(-)プラス(+)や数字の後にスペースを1つ入れる。
サブアイテムは4つのスペースでインデントする

- - -

####順序無しリスト

**code**

    * list 1
        * list 1 - 1
            * list 1 - 1 - 1
            * list 1 - 1 - 2
        * list 1 - 2
        * list 1 - 3
    * list 2
    * list 3


**表示**

* list 1
    * list 1 - 1
        * list 1 - 1 - 1
        * list 1 - 1 - 2
    * list 1 - 2
    * list 1 - 3
* list 2
* list 3

- - -

####順序付きリスト

**code**

    1. list 1
        1. list 1 - 1
            1. list 1 - 1 - 1
            * list 1 - 1 - 2
        * list 1 - 2
        * list 1 - 3
    * list 2
    * list 3

**表示**

1. list 1
    1. list 1 - 1
        1. list 1 - 1 - 1
        * list 1 - 1 - 2
    * list 1 - 2
    * list 1 - 3
* list 2
* list 3

## <a name="7">見出し
HTMLの見出しは、テキストの前にいくつかの'#'を置くことで作ることができる。
'#'の数が見出しのレベルに対応する（HTMLは、見出しのレベルを6まで提供している）。
- - -
**code**

    #見出しレベル1

**表示**

#見出しレベル1

- - -
**code**

    ##見出しレベル2

**表示**

##見出しレベル2

- - -
**code**

    ###見出しレベル3

**表示**

###見出しレベル3

- - -
**code**

    ####見出しレベル4

**表示**

####見出しレベル4

- - -
**code**

    #####見出しレベル5#####

**表示**

#####見出しレベル5#####

- - -
**code**

    ######見出しレベル6######

**表示**

######見出しレベル6######

- - -
**code**

\#7個は無効

    #######見出しレベル7#######

**表示**

#######見出しレベル7#######

## <a name="8">引用


引用内での改行は通常の改行だと無視されるのでスペース2つを使う

- - -

####改行なし

**code**

    > "このテキストは、HTMLのblockquote要素に囲まれます。
    blockquote要素はreflowableです。テキストを好きなように
    改行することができます。改行したとしても、変換後はひとつの
    blockquote要素として扱われます。"

**表示**

> "このテキストは、HTMLのblockquote要素に囲まれます。
blockquote要素はreflowableです。テキストを好きなように
改行することができます。改行したとしても、変換後はひとつの
blockquote要素として扱われます。"

- - -

####改行あり(スペース２つ)

**code**

    > "このテキストは、HTMLのblockquote要素に囲まれます。
    blockquote要素はreflowableです。テキストを好きなように
    改行することができます。改行したとしても、変換後はひとつの
    blockquote要素として扱われます。"

**表示**

> "このテキストは、HTMLのblockquote要素に囲まれます。
blockquote要素はreflowableです。テキストを好きなように
改行することができます。改行したとしても、変換後はひとつの
blockquote要素として扱われます。"

- - -

####ネスト

**code**

    > "このテキストは、HTMLのblockquote要素に囲まれます。
    blockquote要素はreflowableです。テキストを好きなように
    改行することができます。改行したとしても、変換後はひとつの
    blockquote要素として扱われます。"

    >> "ネストブロック"

    > "終了"

**表示**

> "このテキストは、HTMLのblockquote要素に囲まれます。
blockquote要素はreflowableです。テキストを好きなように
改行することができます。改行したとしても、変換後はひとつの
blockquote要素として扱われます。"

>> "ネストブロック"

> "終了"

## <a name="9">リンク

リンクは次のように記述できる。
(GFMではURLはオートリンクされる。下記の様な表記も可能)
- - -

####普通のリンク

\[リンクのテキスト](リンクのアドレス "リンクのタイトル")

**code**

    「グーグル →  [Google](http://www.google.co.jp "link title Google")」

**表示**

「グーグル →  [Google](http://www.google.co.jp "link title Google")」

- - -

####参照リンク

参照目的のリンクとして、脚注として段落外に含めることもできる。

\[リンクのテキスト][番号]

段落外もしくは文書の最後に次のような記述があれば、それは参照リンクとして機能する。

\[番号]: リンクのアドレス "リンクのタイトル"

**code**

    「グーグル →  [Google][1]」

    [1]: http://www.google.co.jp "link title Google"

**表示**

「グーグル →  [Google][1]」

[1]: http://www.google.co.jp "link title Google"

- - -

####ページ内リンク

ページ内の好きな場所や特定の文字にアンカー名(目印)をつける。
見出しなどにも目印をつけることができる。
(例) #\<a name ="midashi">見出し1

**code**

    <a name ="pos1">Target Pos1

    〜略〜

    [Go Target Pos1](#pos1) ←(ここをクリックすると##\<a name =pos1">Target Pos1 へ飛ぶ)

    [pos1]: https://github.com/non3/markdown-memo/blob/master/makedown.md#pos1 "pos1へのリンク"

**表示**

<a name="pos1">Target Pos1

〜略〜

[Go Target Pos1](#pos1) ←(ここをクリックすると\<a name =pos1">Target Pos1 へ飛ぶ)

[pos1]: https://github.com/non3/markdown-memo/blob/master/makedown.md#pos1 "pos1へのリンク"

- - -

####他ページのページ内リンクへ飛ぶ

**code**

    README.md ↓↓

    * <a name="linkpos1">リンク

    markdown.md ↓↓

    [Go README.md リンク][linkpos1]←(ここをクリックするとREADME.mdのリンク へ飛ぶ)

    [linkpos1]: https://github.com/non3/markdown-memo/blob/master/README.md#linkpos1 "README.mdのリンクへのリンク"

**表示**

[Go README.md リンク][linkpos1]←(ここをクリックするとREADME.mdのリンク へ飛ぶ)

[linkpos1]: https://github.com/non3/markdown-memo/blob/master/README.md#linkpos1 "README.mdのリンクへのリンク"

- - -

####画像リンク

\![id]

\[id]: 画像のURL "画像のタイトル"

**code**

    ![Firefox]

    [Firefox]: http://getfirefox.jp/b/120x90_1_white  "ファイヤーフォックス"

**表示**

![Firefox]

[Firefox]: http://getfirefox.jp/b/120x90_1_white  "ファイヤーフォックス"

## <a name="10">水平線

1行の中に、3つ以上のハイフンやアスタリスク・アンダースコアだけを並べると水平線が作られる。

ハイフンやアスタリスクのあいだには空白を入れてもよい。以下の行はすべて水平線を生成する。

- - -
**code**

    - - -
    ---
    * * *
    ***
    *********
    ---------

**表示**
- - -

## <a name="11">テーブル

表組みの前に空行が必要。
パイプ(|)で要素を区切る。
2行目のパイプとパイプの間のハイフンは、最低3文字必要。
\<table>なども使える。

- - -

**code**

```
|リンゴ|ブドウ|バナナ|
|---|---|---|
|10|20|30|

<table>
    <tr>
        <td>リンゴ</td>
        <td>ブドウ</td>
        <td>バナナ</td>
    </tr>
    <tr>
        <td>10</td>
        <td>20</td>
        <td>30</td>
    </tr>
</table>
```

**表示**

|リンゴ|ブドウ|バナナ|
|---|---|---|
|10|20|30|

<table>
    <tr>
        <td>リンゴ</td>
        <td>ブドウ</td>
        <td>バナナ</td>
    </tr>
    <tr>
        <td>10</td>
        <td>20</td>
        <td>30</td>
    </tr>
</table>

- - -

## <a name="15">取り消し線

取り消したい部分を**~~**と**~~**で囲む。

**code**

    ~~取り消し線~~

**表示**

~~取り消し線~~


---
__Advertisement :)__

- __[pica](https://nodeca.github.io/pica/demo/)__ - high quality and fast image
  resize in browser.
- __[babelfish](https://github.com/nodeca/babelfish/)__ - developer friendly
  i18n with plurals support and easy syntax.

You will like those projects!

---

# h1 Heading 8-)
## h2 Heading
### h3 Heading
#### h4 Heading
##### h5 Heading
###### h6 Heading


## Horizontal Rules

___

---

***


## Typographic replacements

Enable typographer option to see result.

(c) (C) (r) (R) (tm) (TM) (p) (P) +-

test.. test... test..... test?..... test!....

!!!!!! ???? ,,  -- ---

"Smartypants, double quotes" and 'single quotes'


## Emphasis

**This is bold text**

__This is bold text__

*This is italic text*

_This is italic text_

~~Strikethrough~~


## Blockquotes


> Blockquotes can also be nested...
>> ...by using additional greater-than signs right next to each other...
> > > ...or with spaces between arrows.


## Lists

Unordered

+ Create a list by starting a line with `+`, `-`, or `*`
+ Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    * Ac tristique libero volutpat at
    + Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
+ Very easy!

Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa


1. You can use sequential numbers...
1. ...or keep all the numbers as `1.`

Start numbering with offset:

57. foo
1. bar


## Code

Inline `code`

Indented code

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code


Block code "fences"

```
Sample text here...
```

Syntax highlighting

``` js
var foo = function (bar) {
  return bar++;
};

console.log(foo(5));
```

## Tables

| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

Right aligned columns

| Option | Description |
| ------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |


## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

Autoconverted link https://github.com/nodeca/pica (enable linkify to see)


## Images

![Minion](https://octodex.github.com/images/minion.png)
![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

Like links, Images also have a footnote style syntax

![Alt text][id]

With a reference later in the document defining the URL location:

[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"


## Plugins

The killer feature of `markdown-it` is very effective support of
[syntax plugins](https://www.npmjs.org/browse/keyword/markdown-it-plugin).


### [Emojies](https://github.com/markdown-it/markdown-it-emoji)

> Classic markup: :wink: :crush: :cry: :tear: :laughing: :yum:
>
> Shortcuts (emoticons): :-) :-( 8-) ;)

see [how to change output](https://github.com/markdown-it/markdown-it-emoji#change-output) with twemoji.


### [Subscript](https://github.com/markdown-it/markdown-it-sub) / [Superscript](https://github.com/markdown-it/markdown-it-sup)

- 19^th^
- H~2~O


### [\<ins>](https://github.com/markdown-it/markdown-it-ins)

++Inserted text++


### [\<mark>](https://github.com/markdown-it/markdown-it-mark)

==Marked text==


### [Footnotes](https://github.com/markdown-it/markdown-it-footnote)

Footnote 1 link[^first].

Footnote 2 link[^second].

Inline footnote^[Text of inline footnote] definition.

Duplicated footnote reference[^second].

[^first]: Footnote **can have markup**

    and multiple paragraphs.

[^second]: Footnote text.


### [Definition lists](https://github.com/markdown-it/markdown-it-deflist)

Term 1

:   Definition 1
with lazy continuation.

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

_Compact style:_

Term 1
  ~ Definition 1

Term 2
  ~ Definition 2a
  ~ Definition 2b


### [Abbreviations](https://github.com/markdown-it/markdown-it-abbr)

This is HTML abbreviation example.

It converts "HTML", but keep intact partial entries like "xxxHTMLyyy" and so on.

*[HTML]: Hyper Text Markup Language

### [Custom containers](https://github.com/markdown-it/markdown-it-container)

::: warning
*here be dragons*
:::
