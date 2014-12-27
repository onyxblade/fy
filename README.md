# Fy

A translate tool in your command line, inspired by [Fanyi](https://github.com/afc163/fanyi).

![](http://dd-personal.qiniudn.com/Screenshot from 2014-11-25 17:21:23.png)

---

## Installation
```bash
$ gem install fy
```

## Usage

Translation data is fetched from [fanyi.youdao.com](http://fanyi.youdao.com),
and only support translation between Chinese and English.

Translate one word.

```bash
$ fy love
```

```
 love  [ lʌv ]

 - n. 恋爱；亲爱的；酷爱；喜爱的事物；爱情，爱意；疼爱；热爱；爱人，所爱之物
 - v. 爱，热爱；爱戴；赞美，称赞；喜爱；喜好；喜欢；爱慕
 - n. （英）洛夫（人名）

 1. Love
    爱,爱情,恋爱
 2. Endless Love
    无尽的爱,不了情,蓝色生死恋
 3. puppy love
    早恋,青春期恋爱,初恋
```

More words.

```bash
$ fy make love
```

~~More more words.~~  Loop mode, CTRL+C to exit.
```bash
$ fy
> words
> to
> translate
```


Support Chinese, even sentence.

```bash
$ fy 和谐
```

```bash
$ fy 子非鱼焉知鱼之乐
```

## LICENSE

MIT.
