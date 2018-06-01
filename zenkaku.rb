#!/usr/bin/ruby
# -*- coding: utf-8 -*-
# 文字種の変換

class UTFClass
    attr :ranges
    attr :charClass
    def initialize(data)
      @ranges = []
      @charClass = []
      for t in data
          c1, c2, cc = t
          @ranges.push(Range.new(c1.to_i,c2.to_i))
          @charClass.push(cc)
      end
    end
    def type(c)
      n = c.ord
      for i in 1..(@ranges.size)
        if @ranges[i].include?(n) then
          return @charClass[i]
        end
      end
      return nil
    end
end

charclass_table = [
    [0,31,"CONTROL"],
    [32,47,"ASCII_SYMBOL"],
    [48,57,"ASCII_DIGIT"],
    [58,64,"ASCII_SYMBOL"],
    [65,90,"ASCII_ALPHA"],
    [91,96,"ASCII_SYMBOL"],
    [97,122,"ASCII_ALPHA"],
    [123,126,"ASCII_SYMBOL"],
    [127,127,"CONTROL"],
    [161,191,"SYMBOL"],
    [192,214,"ALPHA_ADDITIONAL"],
    [215,215,"SYMBOL"],
    [216,246,"ALPHA_ADDITIONAL"],
    [247,247,"SYMBOL"],
    [248,383,"ALPHA_ADDITIONAL"],
    [461,476,"ALPHA_ADDITIONAL"],
    [505,511,"ALPHA_ADDITIONAL"],
    [592,680,"IPA"],
    [910,987,"ALPHA_GREEK"],
    [1025,1116,"ALPHA_CYRILLIC"],
    [1488,1514,"HEBREW"],
    [1536,1969,"ARABIC"],
    [2308,2801,"HINDI"],
    [9312,9331,"DIGIT_CIRCLE"],
    [9332,9351,"DIGIT_PAREN"],
    [9352,9371,"DIGIT_DOT"],
    [9372,9397,"ALPHA_PAREN"],
    [9398,9449,"ALPHA_CIRCLE"],
    [9450,9450,"DIGIT_CIRCLE"],
    [9451,9460,"DIGIT_CIRCLE_BLACK"],
    [9461,9470,"DIGIT_CIRCLE_GRAY"],
    [9471,9471,"DIGIT_CIRCLE_BLACK"],
    [9472,9616,"LINE_BLOCK"],
    [9617,9619,"HATCH"],
    [9620,10101,"SYMBOL"],
    [10102,10111,"DIGIT_CIRCLE_BLACK"],
    [10112,10121,"DIGIT_CIRCLE"],
    [10122,10131,"DIGIT_CIRCLE_BLACK"],
    [10132,10239,"SYMBOL"],
    [10240,10495,"BRAISE"],
    [10497,11247,"SYMBOL"],
    [11904,12245,"KANJI"],
    [12288,12320,"SYMBOL"],
    [12334,12352,"SYMBOL"],
    [12353,12438,"HIRAGANA"],
    [12439,12448,"SYMBOL"],
    [12449,12542,"KATAKANA"],
    [12543,12543,"SYMBOL"],
    [12549,12589,"KANJI"],
    [12593,12684,"HANGUL"],
    [12688,12703,"KANJI"],
    [12736,12771,"PINYIN"],
    [12784,12799,"KATAKANA_SMALL"],
    [12800,12830,"HANGUL_PAREN"],
    [12832,12867,"KANJI_PAREN"],
    [12868,12895,"SYMBOL_DIGIT"],
    [12896,12927,"HANGUL_CIRCLE"],
    [12928,12976,"KANJI_CIRCLE"],
    [12977,12991,"DIGIT_CIRCLE"],
    [12992,13003,"MONTH_NAME"],
    [13004,13007,"SYMBOL"],
    [13008,13054,"KATAKANA_CIRCLE"],
    [13056,13143,"KATAKANA_UNIT"],
    [13144,13168,"DIGIT_TEN"],
    [13168,13279,"SYMBOL_UNIT"],
    [13280,13310,"DIGIT_DAY"],
    [13311,13311,"SYMBOL_UNIT"],
    [13312,20100,"KANJI_KOREAN"],
    [20101,40917,"KANJI"],
    [40960,42182,"YI"],
    [42192,42231,"ALPHA_FRASER"],
    [42232,42239,"SYMBOL"],
    [42240,42539,"VAI"],
    [42560,42655,"SLAVIC"],
    [42786,42935,"LIGATURE"],
    [43072,43127,"TIBETAN"],
    [43360,43388,"HANGUL"],
    [43392,43481,"JAVANESE"],
    [43486,43518,"MYANMAR"],
    [43616,43647,"MYANMAR"],
    [43777,43822,"ETHIOPIC"],
    [43888,43967,"CHEROKEE"],
    [44032,55291,"HANGUL"],
    [57344,58110,"SYMBOL"],
    [63744,64109,"KANJI"],
    [64275,65276,"SYMBOL"],
    [65279,65295,"WIDE_SYMBOL"],
    [65296,65305,"WIDE_DIGIT"],
    [65306,65312,"WIDE_SYMBOL"],
    [65313,65338,"WIDE_ALPHA"],
    [65339,65344,"WIDE_SYMBOL"],
    [65345,65370,"WIDE_ALPHA"],
    [65371,65374,"WIDE_SYMBOL"],
    [65375,65381,"WIDE_SYMBOL"],
    [65382,65439,"HALF_KATAKANA"],
    [65441,65500,"HALF_HANGUL"],
    [65504,65519,"SYMBOL"],
]

$h2z_tbl = {
    " " => "　",
    "!" => "！",
    "\"" => "＂",
    "#" => "＃",
    "$" => "＄",
    "%" => "％",
    "&" => "＆",
    "'" => "＇",
    "(" => "（",
    ")" => "）",
    "*" => "＊",
    "+" => "＋",
    "," => "，",
    "-" => "－",
    "." => "．",
    "/" => "／",
    "0" => "０",
    "1" => "１",
    "2" => "２",
    "3" => "３",
    "4" => "４",
    "5" => "５",
    "6" => "６",
    "7" => "７",
    "8" => "８",
    "9" => "９",
    ":" => "：",
    ";" => "；",
    "<" => "＜",
    "=" => "＝",
    ">" => "＞",
    "?" => "？",
    "@" => "＠",
    "A" => "Ａ",
    "B" => "Ｂ",
    "C" => "Ｃ",
    "D" => "Ｄ",
    "E" => "Ｅ",
    "F" => "Ｆ",
    "G" => "Ｇ",
    "H" => "Ｈ",
    "I" => "Ｉ",
    "J" => "Ｊ",
    "K" => "Ｋ",
    "L" => "Ｌ",
    "M" => "Ｍ",
    "N" => "Ｎ",
    "O" => "Ｏ",
    "P" => "Ｐ",
    "Q" => "Ｑ",
    "R" => "Ｒ",
    "S" => "Ｓ",
    "T" => "Ｔ",
    "U" => "Ｕ",
    "V" => "Ｖ",
    "W" => "Ｗ",
    "X" => "Ｘ",
    "Y" => "Ｙ",
    "Z" => "Ｚ",
    "[" => "［",
    "\\" => "＼",
    "]" => "］",
    "^" => "＾",
    "_" => "＿",
    "`" => "｀",
    "a" => "ａ",
    "b" => "ｂ",
    "c" => "ｃ",
    "d" => "ｄ",
    "e" => "ｅ",
    "f" => "ｆ",
    "g" => "ｇ",
    "h" => "ｈ",
    "i" => "ｉ",
    "j" => "ｊ",
    "k" => "ｋ",
    "l" => "ｌ",
    "m" => "ｍ",
    "n" => "ｎ",
    "o" => "ｏ",
    "p" => "ｐ",
    "q" => "ｑ",
    "r" => "ｒ",
    "s" => "ｓ",
    "t" => "ｔ",
    "u" => "ｕ",
    "v" => "ｖ",
    "w" => "ｗ",
    "x" => "ｘ",
    "y" => "ｙ",
    "z" => "ｚ",
    "{" => "｛",
    "|" => "｜",
    "}" => "｝",
    "~" => "～",
}

def to_Zenkaku(x)
  res = ""
  x.each_char do |c|
    z = $h2z_tbl[c]
    if z.nil? then
      res += c
    else
      res += z
    end
  end
  res
end

ANUM_INDEX=["０","１","２","３","４","５","６","７","８","９"]
NUM_INDEX=["〇","一","二","三","四","五","六","七","八","九"]
KURAI_INDEX=["十","百","千","万","億","兆","京"]
KURAI_NUM = {"十"=>10,"百"=>100,"千"=>1000,"万"=>10000,"億"=>100000000,
             "兆" => 1000000000000, "京" => 10000000000000000}

def chr2num(c)
  n = ANUM_INDEX.index(c)
  return n if n
  NUM_INDEX.index(c)
end

class SimpleMorpheme
  attr "word",true
  attr "yomi",true
  attr "org", true
  attr "pos1",true
  attr "pos2",true
  attr "pos3",true
  def initialize(line)
    @word,@yomi,@org,@pos1,@pos2,@pos3 = line
  end
end

class NumberMorpheme < SimpleMorpheme
  def initialize(line)
    super
    @num = chr2num(word)
    if @num.nil? then
      raise "morph is not a number"
    end
  end
  def to_i
    @num
  end
end

class NumberPool
  YOMI_RULE = {
    "〇" => ["レイ"],
    "一" => ["イチ",{"千"=>"イッ","兆"=>"イッ","京"=>"イッ"}],
    "二" => ["ニ"],
    "三" => ["サン"],
    "四" => ["ヨン"],
    "五" => ["ゴ"],
    "六" => ["ロク",{"百"=>"ロッ","京"=>"ロッ"}],
    "七" => ["ナナ"],
    "八" => ["ハチ",{"百"=>"ハッ", "千"=>"ハッ","兆" => "ハッ","京" => "ハッ"}],
    "九" => ["キュウ"],
    "十" => ["ジュウ",{"兆"=>"ジュッ","京" => "ハッ"}],
    "百" => ["ヒャク",{"京" => "ヒャッ"},{"三" => "ビャク", "六" => "ピャク", "八" => "ピャク","何"=>"ビャク"}],
    "千" => ["セン",nil,{"三" => "ゼン","何"=>"ゼン"}],
    "万" => ["マン"],
    "億" => ["オク"],
    "兆" => ["チョウ"],
    "京" => ["ケイ"],
    "何" => ["ナン"],
    "．" => ["テン"],
    "数" => ["スウ"],
    "０" => ["ゼロ"],
    "１" => ["イチ"],
    "２" => ["ニ"],
    "３" => ["サン"],
    "４" => ["ヨン"],
    "５" => ["ゴ"],
    "６" => ["ロク"],
    "７" => ["ナナ"],
    "８" => ["ハチ"],
    "９" => ["キュウ"],
  }
  def NumberPool.one
    NumberPool.new(1)
  end
  def initialize(morph)
    if morph.nil? then
      @pool = []
      @current_num = 0
    else
      @pool = [morph]
      @current_num = morph.to_i
    end
  end
  def <<(morph)
    @pool.push(morph)
    @current_num = 10*@current_num+morph.to_i
  end
  def push(morph)
    @pool.push(morph)
    @current_num += morph.to_i
  end
  def size
    @pool.size
  end
  def to_i
    @current_num
  end
  def times(num)
    @current_num *= num
  end
  def kansuuji1000(num,app1000)
    k = []
    if num >= 10000 then
      raise "argument of kansuuji1000 should be less than 10000"
    end
    if num >= 1000 then
      if app1000 or num/1000 > 1 then
        k << NUM_INDEX[num/1000] 
      end
      k << "千"
      num = num%1000
    end
    if num >= 100 then
      if num/100 > 1 then
        k << NUM_INDEX[num/100]
      end
      k << "百"
      num = num%100
    end
    if num >= 10 then
      if num/10 > 1 then
        k << NUM_INDEX[num/10] 
      end
      k << "十"
      num = num%10
    end
    if num > 0 then
      k << NUM_INDEX[num]
    end
    k
  end

  def kansuuji
    if @current_num == 0 then
      return ["〇"]
    end
    k = []
    x = @current_num
    if @pool.size > 10 or x >= 100000000000000000000 then
      # 数が大きすぎるので、読み下さずに数字の羅列として表記
      while x > 0
        k.unshift(ANUM_INDEX[x%10])
        x /= 10
      end
      return k
    end
    if x >= 10000000000000000 then
      k.concat(kansuuji1000(x/10000000000000000,true)) << "京"
      x = x%10000000000000000
    end
    if x >= 1000000000000 then
      k.concat(kansuuji1000(x/1000000000000,true)) << "兆"
      x = x%1000000000000
    end
    if x >= 100000000 then
      k.concat(kansuuji1000(x/100000000,true)) << "億"
      x = x%100000000
    end
    if x >= 10000 then
      k.concat(kansuuji1000(x/10000,true)) << "万"
      x = x%10000
    end
    k.concat(kansuuji1000(x,false))
    k
  end

  def yomiary(suuji_ary)
    k = []
    suuji_ary.each_index do |i|
      r = YOMI_RULE[suuji_ary[i]]
      if r.nil? then
        STDERR.print "Can't read "+i.to_s+" "+suuji_ary.join(" ")+"\n"
        return suuji_ary
      end
      if !r[1].nil? and r[1][suuji_ary[i+1]] then
        k << r[1][suuji_ary[i+1]]
      elsif !r[2].nil? and i > 0 and r[2][suuji_ary[i-1]] then
        k << r[2][suuji_ary[i-1]]
      else
        k << r[0]
      end
    end
    k
  end

  def yomi(suuji_ary)
    yomiary(suuji_ary).join("")
  end
end

# 算用数字を漢数字に変換する
#
# status の説明
# 0: 数字でない文字を読み込み中
# 1: 算用数字を読んで蓄積中
# 2: 算用数字を読んでも蓄積しない状態（・．の後）
# 3: 漢数字を読んでいるが位取りするかどうか不明
# 4: 漢数字を読んで位取り中
# 5: 漢数字を読んでも蓄積しない状態（・と．の後）
# 6: 蓄積しないことは判っているが算用数字かどうかわからない（〒の後）
# 動作記述
#  [次の状態, 動作]
#  動作：
#    0以上の整数： 現在の数字に10を掛けて、この数字を足す
#    -1: 現在の数字を吐き出し、今見ている文字も出力
#    -2: 現在見ている文字を無視


$num_autom = [
# 0
  {"０"=>[2,-1],"１"=>[1,1] ,"２"=>[1,2] ,"３"=>[1,3] ,"４"=>[1,4] ,
   "５"=>[1,5] ,"６"=>[1,6] ,"７"=>[1,7] ,"８"=>[1,8] ,"９"=>[1,9] ,
   "〇"=>[5,-1],"一"=>[3,1] ,"二"=>[3,2] ,"三"=>[3,3] ,"四"=>[3,4] ,
   "五"=>[3,5] ,"六"=>[3,6] ,"七"=>[3,7] ,"八"=>[3,8] ,"九"=>[3,9] ,
   "十"=>[0,-1],"百"=>[0,-1],"千"=>[0,-1],"万"=>[0,-1],"億"=>[0,-1],
   "兆"=>[0,-1],"京"=>[0,-1],"・"=>[0,-1],"．"=>[0,-1],"〒"=>[6,-1],
   "default"=>[0,-1],
  },
# 1
  {"０"=>[1,0], "１"=>[1,1] ,"２"=>[1,2] ,"３"=>[1,3] ,"４"=>[1,4] ,
   "５"=>[1,5] ,"６"=>[1,6] ,"７"=>[1,7] ,"８"=>[1,8] ,"９"=>[1,9] ,
   "・"=>[2,-1],"．"=>[2,-1],"〒"=>[6,-1],"，"=>[1,-2],
   "default"=>[0,-1],
  },
# 2
  {"０"=>[2,-1],"１"=>[2,-1],"２"=>[2,-1],"３"=>[2,-1],"４"=>[2,-1] ,
   "５"=>[2,-1],"６"=>[2,-1],"７"=>[2,-1],"８"=>[2,-1],"９"=>[2,-1] ,
   "−"=>[2,-1],
   "default"=>[0,-1],
  },
# 3
  {"〇"=>[4,0] ,"一"=>[4,1] ,"二"=>[4,2] ,"三"=>[4,3] ,"四"=>[4,4] ,
   "五"=>[4,5] ,"六"=>[4,6] ,"七"=>[4,7] ,"八"=>[4,8] ,"九"=>[4,9] ,
   "十"=>[0,-1],"百"=>[0,-1],"千"=>[0,-1],"万"=>[0,-1],"億"=>[0,-1],
   "兆"=>[0,-1],"京"=>[0,-1],"・"=>[5,-1],"．"=>[5,-1],"〒"=>[6,-1],
   "default"=>[0,-1],
  },
#4
  {"〇"=>[4,0] ,"一"=>[4,1] ,"二"=>[4,2] ,"三"=>[4,3] ,"四"=>[4,4] ,
   "五"=>[4,5] ,"六"=>[4,6] ,"七"=>[4,7] ,"八"=>[4,8] ,"九"=>[4,9] ,
   "十"=>[0,-1],"百"=>[0,-1],"千"=>[0,-1],"万"=>[0,-1],"億"=>[0,-1],
   "兆"=>[0,-1],"京"=>[0,-1],"・"=>[5,-1],"．"=>[5,-1],"〒"=>[6,-1],
   "default"=>[0,-1],
  },
# 5
  {"〇"=>[5,-1],"一"=>[5,-1],"二"=>[5,-1],"三"=>[5,-1],"四"=>[5,-1] ,
   "五"=>[5,-1],"六"=>[5,-1],"七"=>[5,-1],"八"=>[5,-1],"九"=>[5,-1] ,
   "−"=>[5,-1],
   "default"=>[0,-1],
  },
#6
  {"０"=>[2,-1],"１"=>[2,-1],"２"=>[2,-1],"３"=>[2,-1],"４"=>[2,-1] ,
   "５"=>[2,-1],"６"=>[2,-1],"７"=>[2,-1],"８"=>[2,-1],"９"=>[2,-1] ,
   "〇"=>[5,-1],"一"=>[5,-1],"二"=>[5,-1],"三"=>[5,-1],"四"=>[5,-1] ,
   "五"=>[5,-1],"六"=>[5,-1],"七"=>[5,-1],"八"=>[5,-1],"九"=>[5,-1] ,
   "default"=>[0,-1],
  },
]

def convert_num(str)
  i = 0
  status = 0
  np = NumberPool.new(nil)
  res = ''
  while i < str.size
    begin
      c = str[i]
      a = $num_autom[status][c]
      if a.nil? then
        a = $num_autom[status]["default"]
      end
      if a[1] >= 0 then
        np << a[1]
      elsif a[1] == -1 then
        if np.size > 0 then
          res << np.kansuuji.join("")
          np = NumberPool.new(nil)
        end
        res << c
      elsif a[1] == 2
        # do nothing
      end
      status = a[0]
    ensure
      i += 2
    end
  end
  if np.size > 0 then
    res << np.kansuuji.join('')
  end
  res
end

$mojiclass = UTFClass.new(charclass_table)

class CharChunk
  attr :chunk,true
  attr :mclass,true
  HALFWIDTH = ["ASCII_SYMBOL","ASCII_DIGIT","ASCII_ALPHA"]
  def initialize(str)
    @chunk = str
    @mclass = $mojiclass.type(str[0])
  end
  def add!(x)
    if x.class == CharChunk then
      x = x.chunk
    end
    @chunk += x
  end
  def to_s
    "("+@chunk+", "+@mclass+")"
  end
  def to_kansuuji!
    @chunk = convert_num(to_Zenkaku(@chunk))
  end
  def halfwidth?
    HALFWIDTH.include?(@mclass)
  end
  def to_Zenkaku!
    @chunk = to_Zenkaku(@chunk)
  end
end

def strChunk(str)
  res = []
  currentChunk = nil
  str.each_char do |c|
    t = $mojiclass.type(c)
    if t.nil? then
      if !currentChunk.nil? then
        res.push(currentChunk)
        currentChunk = nil
      end
    elsif currentChunk.nil? then
      currentChunk = CharChunk.new(c)
    elsif t == currentChunk.mclass then
      currentChunk.add!(c)
    else
      res.push(currentChunk)
      currentChunk = CharChunk.new(c)
    end
  end
  unless currentChunk.nil? then
    res.push(currentChunk)
  end
  res
end
      

while gets
  chunk = strChunk($_.chop)
  i = 0
  res = []
  while i < chunk.size
    if i > 0 and res[-1].mclass == "ASCII_DIGIT" and
      (chunk[i].mclass == "ASCII_DIGIT" or chunk[i].chunk == ".") then
      res[-1].add!(chunk[i])
    else
      res.push(chunk[i])
    end
    i += 1
  end
  for c in res
    if c.mclass == "ASCII_DIGIT" then
      c.to_kansuuji!
    elsif c.halfwidth? then
      c.to_Zenkaku!
    end
  end
  print res.collect{|x| x.chunk}.join("")+"\n"
end


