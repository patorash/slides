class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "knockout.jsのcomponentの使い方")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "株式会社リゾーム @patorash")
      children << p({className:"icon"}, p({class:""}, img({src:"#{Gibier.assets_path}/images/patorash.png"}, "")))
      children << p({className:"duration"}, "30min")
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def header
  h3(nil, "目次")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "knockout-componentの概要"),
                    li(nil, "シンプルな実装"),
                    li(nil, "ViewModelとViewを分けた実装"),
                    li(nil, "共通テンプレートを使う"),
                    li(nil, "コンポーネントに引数を渡す方法")
      )
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def header
  h3(nil, "withは場合によっては使うべきではない")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "withはturbolinksとの相性が悪い"),
                    li(nil, "戻るボタンで戻った際に、以前の表示のhtmlの状態でwithブロックが評価され、foreachの評価時に予期しない表示になる")
      )
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def header
  h3(nil, "knockout-componentを使おう！")
end

def content
  [].tap do |children|
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def header
  h2(nil, "knockout-componentとは？")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "ViewModelとViewの定義をまとめたもの"),
                    li(nil, "componentとして登録されたものは、独自タグで使える"),
                    li(nil, "ViewModelとViewの定義を1つのファイルにまとめられる"),
                    li(nil, "Viewを別ファイルに定義することもできる")
      )
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def header
  h2(nil, "シンプルなコンポーネント")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "ViewModelとViewが1つになっていて見易い"),
                    li(nil, "Viewを探す手間が省ける")
      )
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10</pre></td><td class="code"><pre><span class="k">class</span> <span class="nx">AppViewModel</span>
  <span class="na">constructor</span><span class="o">:</span> <span class="p">(</span><span class="vi">@</span><span class="na">title</span> <span class="o">=</span> <span class="no">null</span><span class="p">)</span> <span class="o">-&gt;</span>
    <span class="nx">ko</span><span class="p">.</span><span class="na">track</span><span class="p">(</span><span class="k">this</span><span class="p">)</span>

<span class="nx">ko</span><span class="p">.</span><span class="na">components</span><span class="p">.</span><span class="na">register</span> <span class="s">'app'</span><span class="p">,</span> <span class="p">{</span>
  <span class="na">viewModel</span><span class="o">:</span> <span class="o">-&gt;</span> <span class="k">new</span> <span class="nx">AppViewModel</span><span class="p">()</span>
  <span class="na">template</span><span class="o">:</span> <span class="s">"""
    &lt;h1 data-bind="text: title"&gt;&lt;/h1&gt;
  """</span>
<span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def header
  h2(nil, "使うとき")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "独自タグ（カスタムエレメント）になる")
      )
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre><span class="nt">&lt;body&gt;</span>
  <span class="nt">&lt;app&gt;&lt;/app&gt;</span>
<span class="nt">&lt;/body&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def header
  h3(nil, "ViewModelとViewを1つのファイルにする方法")
end

def content
  [].tap do |children|
      children << p(nil, "メリット")
      children << ul(nil,
                    li(nil, "ファイルが散らばらないので探す手間が省ける")
      )
      children << p(nil, "デメリット")
      children << ul(nil,
                    li(nil, "素のHTMLを書かなければならない"),
                    li(nil, "Railsのヘルパーメソッド類が使えない")
      )
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def header
  h3(nil, "ViewModelとViewを分離する(ViewModel側)")
end

def content
  [].tap do |children|
      children << p(nil, "templateに、template要素のidを指定する。")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8</pre></td><td class="code"><pre><span class="k">class</span> <span class="nx">AppViewModel</span>
  <span class="na">constructor</span><span class="o">:</span> <span class="p">(</span><span class="vi">@</span><span class="na">title</span> <span class="o">=</span> <span class="no">null</span><span class="p">)</span> <span class="o">-&gt;</span>
    <span class="nx">ko</span><span class="p">.</span><span class="na">track</span><span class="p">(</span><span class="k">this</span><span class="p">)</span>

<span class="nx">ko</span><span class="p">.</span><span class="na">components</span><span class="p">.</span><span class="na">register</span> <span class="s">'app'</span><span class="p">,</span> <span class="p">{</span>
  <span class="na">viewModel</span><span class="o">:</span> <span class="o">-&gt;</span> <span class="k">new</span> <span class="nx">AppViewModel</span><span class="p">()</span>
  <span class="na">template</span><span class="o">:</span> <span class="p">{</span> <span class="na">element</span><span class="o">:</span> <span class="s">'app'</span> <span class="p">}</span>
<span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def header
  h3(nil, "ViewModelとViewを分離する(View側)")
end

def content
  [].tap do |children|
      children << p(nil, "templateタグにid=\"app\"をつける。
こちらはRailsのViewに定義できるのでヘルパーも使える。")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre><span class="nt">&lt;template</span> <span class="na">id=</span><span class="s">"app"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;h1</span> <span class="na">data-bind=</span><span class="s">"text: title"</span><span class="nt">&gt;&lt;/h1&gt;</span>
<span class="nt">&lt;/template&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def header
  h3(nil, "使うとき")
end

def content
  [].tap do |children|
      children << p(nil, "コンポーネントを使うときには、テンプレートも書き出しておく。")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6</pre></td><td class="code"><pre><span class="nt">&lt;body&gt;</span>
  <span class="nt">&lt;app&gt;&lt;/app&gt;</span>
  <span class="nt">&lt;template</span> <span class="na">id=</span><span class="s">"app"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;h1</span> <span class="na">data-bind=</span><span class="s">"text: title"</span><span class="nt">&gt;&lt;/h1&gt;</span>
  <span class="nt">&lt;/template&gt;</span>
<span class="nt">&lt;/body&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def header
  h3(nil, "使うとき(Rails風)")
end

def content
  [].tap do |children|
      children << p(nil, "layout")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre><span class="nt">&lt;body&gt;</span>
  <span class="cp">&lt;%=</span> <span class="k">yield</span> <span class="cp">%&gt;</span>
<span class="nt">&lt;/body&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "view(erb, slim, haml)")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2</pre></td><td class="code"><pre><span class="nt">&lt;app&gt;&lt;/app&gt;</span>
<span class="cp">&lt;%=</span> <span class="n">render</span> <span class="s1">'shared/ko-templates/app'</span> <span class="cp">%&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h3(nil, "ViewModelとViewを分ける方法")
end

def content
  [].tap do |children|
      children << p(nil, "メリット")
      children << ul(nil,
                    li(nil, "ViewをRailsの世界で扱える")
      )
      children << p(nil, "デメリット")
      children << ul(nil,
                    li(nil, "時々テンプレートをrenderし忘れる")
      )
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def header
  h2(nil, "Viewを分ける(Advance)")
end

def content
  [].tap do |children|
      children << p(nil, "共通項目が多いんだけれど、一部だけ違う場合。例えば…")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4</pre></td><td class="code"><pre><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal"</span> <span class="na">data-bind=</span><span class="s">"visible: visible"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;p</span> <span class="na">data-bind=</span><span class="s">"text: message"</span><span class="nt">&gt;&lt;/p&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">data-bind=</span><span class="s">"click: close"</span><span class="nt">&gt;</span>閉じる<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/div&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "と")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5</pre></td><td class="code"><pre><span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal"</span> <span class="na">data-bind=</span><span class="s">"visible: visible"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;h1</span> <span class="na">data-bind=</span><span class="s">"text: title"</span><span class="nt">&gt;&lt;/h1&gt;</span>
  <span class="nt">&lt;p</span> <span class="na">data-bind=</span><span class="s">"text: message"</span><span class="nt">&gt;&lt;/p&gt;</span>
  <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">data-bind=</span><span class="s">"click: hide"</span><span class="nt">&gt;</span>閉じる<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;/div&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def header
  h2(nil, "共通テンプレートを定義する")
end

def content
  [].tap do |children|
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def header
  h2(nil, "共通テンプレートを定義する")
end

def content
  [].tap do |children|
      children << p(nil, "base-articleテンプレートを定義する。")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7</pre></td><td class="code"><pre><span class="nt">&lt;template</span> <span class="na">id=</span><span class="s">"base-modal"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"modal"</span> <span class="na">data-bind=</span><span class="s">"visible: visible"</span><span class="nt">&gt;</span>
    <span class="c">&lt;!-- ko template: { nodes: $componentTemplateNodes } --&gt;</span>
    <span class="c">&lt;!-- /ko --&gt;</span>
    <span class="nt">&lt;button</span> <span class="na">type=</span><span class="s">"button"</span> <span class="na">data-bind=</span><span class="s">"click: hide"</span><span class="nt">&gt;</span>閉じる<span class="nt">&lt;/button&gt;</span>
  <span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/template&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def header
  h2(nil, "各々のViewModelを定義する")
end

def content
  [].tap do |children|
      children << p(nil, "まずベースクラスを定義")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6</pre></td><td class="code"><pre><span class="k">class</span> <span class="vi">@</span><span class="na">BaseModal</span>
  <span class="na">constructor</span><span class="o">:</span> <span class="o">-&gt;</span>
    <span class="vi">@</span><span class="na">visible</span> <span class="o">=</span> <span class="no">false</span>
    <span class="nx">ko</span><span class="p">.</span><span class="na">track</span><span class="p">(</span><span class="k">this</span><span class="p">)</span>
  <span class="na">show</span><span class="o">:</span> <span class="o">-&gt;</span> <span class="vi">@</span><span class="na">visible</span> <span class="o">=</span> <span class="no">true</span>
  <span class="na">hide</span><span class="o">:</span> <span class="o">-&gt;</span> <span class="vi">@</span><span class="na">visible</span> <span class="o">=</span> <span class="no">false</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def header
  h2(nil, "ベースクラスを継承したクラスを定義")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17</pre></td><td class="code"><pre><span class="k">class</span> <span class="nx">SimpleAlertModal</span> <span class="k">extends</span> <span class="nx">BaseModal</span>
  <span class="na">constructor</span><span class="o">:</span> <span class="p">(</span><span class="vi">@</span><span class="na">message</span> <span class="o">=</span> <span class="no">null</span><span class="p">)</span> <span class="o">-&gt;</span>
    <span class="k">super</span><span class="p">()</span>

<span class="nx">ko</span><span class="p">.</span><span class="na">components</span><span class="p">.</span><span class="na">register</span> <span class="s">'simple-alert-modal'</span><span class="p">,</span> <span class="p">{</span>
  <span class="na">viewModel</span><span class="o">:</span> <span class="o">-&gt;</span> <span class="k">new</span> <span class="nx">SimpleAlertModal</span><span class="p">()</span>
  <span class="na">template</span><span class="o">:</span> <span class="p">{</span> <span class="na">element</span><span class="o">:</span> <span class="s">'base-modal'</span> <span class="p">}</span>
<span class="p">}</span>

<span class="k">class</span> <span class="nx">DetailAlertModal</span> <span class="k">extends</span> <span class="nx">BaseModal</span>
  <span class="na">constructor</span><span class="o">:</span> <span class="p">(</span><span class="vi">@</span><span class="na">title</span> <span class="o">=</span> <span class="no">null</span><span class="p">,</span> <span class="vi">@</span><span class="na">message</span> <span class="o">=</span> <span class="no">null</span><span class="p">)</span> <span class="o">-&gt;</span>
    <span class="k">super</span><span class="p">()</span>

<span class="nx">ko</span><span class="p">.</span><span class="na">components</span><span class="p">.</span><span class="na">register</span> <span class="s">'detail-alert-modal'</span><span class="p">,</span> <span class="p">{</span>
  <span class="na">viewModel</span><span class="o">:</span> <span class="o">-&gt;</span> <span class="k">new</span> <span class="nx">DetailAlertModal</span><span class="p">()</span>
  <span class="na">template</span><span class="o">:</span> <span class="p">{</span> <span class="na">element</span><span class="o">:</span> <span class="s">'base-modal'</span> <span class="p">}</span>
<span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def header
  h3(nil, "共通テンプレートを使う")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8</pre></td><td class="code"><pre><span class="nt">&lt;simple-alert-modal&gt;</span>
  <span class="nt">&lt;p</span> <span class="na">data-bind=</span><span class="s">"text: message"</span><span class="nt">&gt;&lt;/p&gt;</span>
<span class="nt">&lt;/simple-alert-modal&gt;</span>

<span class="nt">&lt;detail-alert-modal&gt;</span>
  <span class="nt">&lt;h1</span> <span class="na">data-bind=</span><span class="s">"text: title"</span><span class="nt">&gt;&lt;/h1&gt;</span>
  <span class="nt">&lt;p</span> <span class="na">data-bind=</span><span class="s">"text: message"</span><span class="nt">&gt;&lt;/p&gt;</span>
<span class="nt">&lt;/detail-alert-modal&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def header
  h2(nil, "コンポーネントに引数を渡す")
end

def content
  [].tap do |children|
      children << p(nil, "昔は、以下のようにgonを経由してしていた。",Hyalite.create_element('br'),"
gon経由は、gonの存在チェックが面倒😫
かつgonのスコープがglobalなのがよくない👎")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10</pre></td><td class="code"><pre><span class="k">class</span> <span class="nx">AppViewModel</span>
  <span class="na">constructor</span><span class="o">:</span> <span class="p">(</span><span class="vi">@</span><span class="na">title</span> <span class="o">=</span> <span class="no">null</span><span class="p">)</span> <span class="o">-&gt;</span>
    <span class="nx">ko</span><span class="p">.</span><span class="na">track</span><span class="p">(</span><span class="k">this</span><span class="p">)</span>

<span class="nx">$</span> <span class="o">-&gt;</span>
  <span class="nx">app_view</span> <span class="o">=</span> <span class="k">if</span> <span class="nx">gon</span><span class="o">?</span>
    <span class="k">new</span> <span class="nx">AppViewModel</span><span class="p">(</span><span class="nx">gon</span><span class="p">.</span><span class="na">title</span><span class="p">)</span>
  <span class="k">else</span>
    <span class="k">new</span> <span class="nx">AppViewModel</span><span class="p">()</span>
  <span class="nx">ko</span><span class="p">.</span><span class="na">appryBindings</span><span class="p">(</span><span class="nx">app_view</span><span class="p">)</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page20 < Gibier::PageBase
def header
  h2(nil, "コンポーネントに引数を渡す")
end

def content
  [].tap do |children|
      children << p(nil, "もしくは、data attributeを使っていた。",Hyalite.create_element('br'),"
この方法も、idまたはclassを指定するのがよくない👎")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5</pre></td><td class="code"><pre><span class="nx">$</span> <span class="o">-&gt;</span>
  <span class="c1"># div.target data-title="タイトル" からデータ取得</span>
  <span class="nx">title</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="s">'.target'</span><span class="p">).</span><span class="na">data</span><span class="p">(</span><span class="s">'title'</span><span class="p">)</span>
  <span class="nx">app_view</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">AppViewModel</span><span class="p">(</span><span class="nx">title</span><span class="p">)</span>
  <span class="nx">ko</span><span class="p">.</span><span class="na">appryBindings</span><span class="p">(</span><span class="nx">app_view</span><span class="p">)</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page21 < Gibier::PageBase
def header
  h2(nil, "コンポーネントに引数を渡す")
end

def content
  [].tap do |children|
      children << p(nil, "knockout-componentなら、直接渡すことができる😂",Hyalite.create_element('br'),"
引数の変数スコープもコンポーネント定義箇所に絞られる👍")
      children << p(nil, "View")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2</pre></td><td class="code"><pre><span class="nt">&lt;app</span> <span class="na">params=</span><span class="s">"title: 'タイトル'"</span><span class="nt">&gt;</span>
<span class="nt">&lt;/app&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "コンポーネント定義")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4</pre></td><td class="code"><pre><span class="nx">ko</span><span class="p">.</span><span class="na">components</span><span class="p">.</span><span class="na">register</span> <span class="s">'app'</span><span class="p">,</span> <span class="p">{</span>
  <span class="na">viewModel</span><span class="o">:</span> <span class="p">(</span><span class="nx">params</span><span class="p">)</span> <span class="o">-&gt;</span> <span class="k">new</span> <span class="nx">AppViewModel</span><span class="p">(</span><span class="nx">params</span><span class="p">.</span><span class="na">title</span><span class="p">)</span>
  <span class="na">template</span><span class="o">:</span> <span class="p">{</span> <span class="na">element</span><span class="o">:</span> <span class="s">'app'</span> <span class="p">}</span>
<span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page22 < Gibier::PageBase
def header
  h2(nil, "実用的な例①")
end

def content
  [].tap do |children|
      children << p(nil, "View")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5</pre></td><td class="code"><pre><span class="cp">&lt;%</span> <span class="n">regions</span> <span class="o">=</span> <span class="no">Region</span><span class="p">.</span><span class="nf">eager_load</span><span class="p">(</span><span class="ss">:prefs</span><span class="p">).</span><span class="nf">to_json</span><span class="p">(</span><span class="ss">only: </span><span class="p">[</span><span class="ss">:name</span><span class="p">],</span>
                                               <span class="ss">include: </span><span class="p">{</span><span class="ss">prefs: </span><span class="p">{</span><span class="ss">only: </span><span class="p">[</span><span class="ss">:name</span><span class="p">]}}</span> <span class="cp">%&gt;</span>
<span class="nt">&lt;search-by-prefs</span> <span class="na">params=</span><span class="s">"regions: #{regions},
                         selected_prefs: #{params[:prefs]&amp;.to_json || []}"</span><span class="nt">&gt;</span>
<span class="nt">&lt;/search-by-prefs&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "コンポーネント定義")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4</pre></td><td class="code"><pre><span class="nx">ko</span><span class="p">.</span><span class="na">components</span><span class="p">.</span><span class="na">register</span> <span class="s">'search-by-prefs'</span><span class="p">,</span> <span class="p">{</span>
  <span class="na">viewModel</span><span class="o">:</span> <span class="p">(</span><span class="nx">params</span><span class="p">)</span> <span class="o">-&gt;</span> <span class="k">new</span> <span class="nx">SearchPrefs</span><span class="p">(</span><span class="nx">params</span><span class="p">.</span><span class="na">regions</span><span class="p">,</span> <span class="nx">params</span><span class="p">.</span><span class="na">selected_prefs</span><span class="p">)</span>
  <span class="na">template</span><span class="o">:</span> <span class="p">{</span> <span class="na">element</span><span class="o">:</span> <span class="s">'search-by-prefs'</span> <span class="p">}</span>
<span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page23 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, "View(template)")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21</pre></td><td class="code"><pre><span class="nt">&lt;template</span> <span class="na">id=</span><span class="s">"search-by-prefs"</span><span class="nt">&gt;</span>
  <span class="cp">&lt;%=</span> <span class="n">form_with</span> <span class="ss">url: </span><span class="n">addresses_path</span><span class="p">,</span> <span class="ss">local: </span><span class="kp">true</span> <span class="k">do</span> <span class="cp">%&gt;</span>
    <span class="nt">&lt;dl</span> <span class="na">data-bind=</span><span class="s">"foreach: { data: regions, as: 'region' }"</span><span class="nt">&gt;</span>
      <span class="nt">&lt;dt&gt;</span>
        <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">data-bind=</span><span class="s">"value: region.name,
          checked: $parent.selected_regions,
          click: $parent.toggleRegion"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;span</span> <span class="na">data-bind=</span><span class="s">"text: region.name"</span><span class="nt">&gt;&lt;/span&gt;</span>
      <span class="nt">&lt;/dt&gt;</span>
      <span class="nt">&lt;dd&gt;</span>
        <span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">"inline"</span> <span class="na">data-bind=</span><span class="s">"foreach: { data: region.prefs, as: 'pref' }"</span><span class="nt">&gt;</span>
          <span class="nt">&lt;li&gt;</span>
            <span class="nt">&lt;input</span> <span class="na">type=</span><span class="s">"checkbox"</span> <span class="na">name=</span><span class="s">"prefs[]"</span> <span class="na">data-bind=</span><span class="s">"value: pref.name,
              checked: $parents[1].select_prefs"</span><span class="nt">&gt;</span>
            <span class="nt">&lt;span</span> <span class="na">data-bind=</span><span class="s">"text: pref.name"</span><span class="nt">&gt;&lt;/span&gt;</span>
          <span class="nt">&lt;/li&gt;</span>
        <span class="nt">&lt;/ul&gt;</span>
      <span class="nt">&lt;/dd&gt;</span>
    <span class="nt">&lt;/dl&gt;</span>
  <span class="cp">&lt;%</span> <span class="k">end</span> <span class="cp">%&gt;</span>
<span class="nt">&lt;/template&gt;</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page24 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, "ViewModel")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11
12</pre></td><td class="code"><pre><span class="k">class</span> <span class="nx">SearchPrefs</span>
  <span class="na">constructor</span><span class="o">:</span> <span class="p">(</span><span class="vi">@</span><span class="na">regions</span><span class="p">,</span> <span class="vi">@</span><span class="na">selected_prefs</span><span class="p">)</span> <span class="o">-&gt;</span>
    <span class="vi">@</span><span class="na">selected_regions</span> <span class="o">=</span> <span class="p">[]</span>
    <span class="nx">ko</span><span class="p">.</span><span class="na">track</span><span class="p">(</span><span class="k">this</span><span class="p">,</span> <span class="p">[</span><span class="s">'selected_regions'</span><span class="p">,</span> <span class="s">'selected_prefs'</span><span class="p">])</span>

  <span class="na">toggleRegion</span><span class="o">:</span> <span class="p">(</span><span class="nx">region</span><span class="p">)</span> <span class="o">=&gt;</span>
    <span class="nx">pref_names</span> <span class="o">=</span> <span class="nx">_</span><span class="p">.</span><span class="na">pluck</span><span class="p">(</span><span class="nx">region</span><span class="p">.</span><span class="na">prefs</span><span class="p">,</span> <span class="s">'name'</span><span class="p">)</span>
    <span class="vi">@</span><span class="na">selected_prefs</span> <span class="o">=</span> <span class="k">if</span> <span class="nx">_</span><span class="p">.</span><span class="na">includes</span><span class="p">(</span><span class="vi">@</span><span class="na">selected_regions</span><span class="p">,</span> <span class="nx">region</span><span class="p">.</span><span class="na">name</span><span class="p">)</span>
      <span class="nx">_</span><span class="p">.</span><span class="na">union</span><span class="p">(</span><span class="vi">@</span><span class="na">selected_prefs</span><span class="p">,</span> <span class="nx">pref_names</span><span class="p">)</span>
    <span class="k">else</span>
      <span class="nx">_</span><span class="p">.</span><span class="na">difference</span><span class="p">(</span><span class="vi">@</span><span class="na">selected_prefs</span><span class="p">,</span> <span class="nx">pref_names</span><span class="p">)</span>
    <span class="no">true</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page25 < Gibier::PageBase
def header
  h2(nil, "knockout-component化することで…")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "ViewからJSのViewModelにJSON形式で直接値を渡せる  
（橋渡し役が不要に）"),
                    li(nil, "フォーム絡みのViewModelでクエリパラメータ経由の値の復元が楽になる（地味にすごくありがたい🙏）"),
                    li(nil, "再利用可能になる😀😀😀")
      )
  end
end
end

Gibier.page_count = 26
Gibier.title = "knockout.jsのcomponentの使い方"
