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
10</pre></td><td class="code"><pre>class AppViewModel
  constructor: (@title = null) -&gt;
    ko.track(this)

ko.components.register 'app', {
  viewModel: -&gt; new AppViewModel()
  template: """
    &lt;h1 data-bind="text: title"&gt;&lt;/h1&gt;
  """
}
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
3</pre></td><td class="code"><pre>&lt;body&gt;
  &lt;app&gt;&lt;/app&gt;
&lt;/body&gt;
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
8</pre></td><td class="code"><pre>class AppViewModel
  constructor: (@title = null) -&gt;　
    ko.track(this)

ko.components.register 'app', {
  viewModel: -&gt; new AppViewModel()
  template: { element: 'app' }
}
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
3</pre></td><td class="code"><pre>&lt;template id="app"&gt;
  &lt;h1 data-bind="text: title"&gt;&lt;/h1&gt;
&lt;/template&gt;
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
6</pre></td><td class="code"><pre>&lt;body&gt;
  &lt;app&gt;&lt;/app&gt;
  &lt;template id="app"&gt;
    &lt;h1 data-bind="text: title"&gt;&lt;/h1&gt;
  &lt;/template&gt;
&lt;/body&gt;
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
3</pre></td><td class="code"><pre>&lt;body&gt;
  &lt;%= yield %&gt;
&lt;/body&gt;
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "view(erb, slim, haml)")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2</pre></td><td class="code"><pre>&lt;app&gt;&lt;/app&gt;
&lt;%= render 'shared/ko-templates/app' %&gt;
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
4</pre></td><td class="code"><pre>&lt;div class="modal" data-bind="visible: visible"&gt;
  &lt;p data-bind="text: message"&gt;&lt;/p&gt;
  &lt;button type="button" data-bind="click: close"&gt;閉じる&lt;/button&gt;
&lt;/div&gt;
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "と")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5</pre></td><td class="code"><pre>&lt;div class="modal" data-bind="visible: visible"&gt;
  &lt;h1 data-bind="text: title"&gt;&lt;/h1&gt;
  &lt;p data-bind="text: message"&gt;&lt;/p&gt;
  &lt;button type="button" data-bind="click: hide"&gt;閉じる&lt;/button&gt;
&lt;/div&gt;
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
7</pre></td><td class="code"><pre>&lt;template id="base-modal"&gt;
  &lt;div class="modal" data-bind="visible: visible"&gt;
    &lt;!-- ko template: { nodes: $componentTemplateNodes } --&gt;
    &lt;!-- /ko --&gt;
    &lt;button type="button" data-bind="click: hide"&gt;閉じる&lt;/button&gt;
  &lt;/div&gt;
&lt;/template&gt;
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
6</pre></td><td class="code"><pre>class @BaseModal
  constructor: -&gt;
    @vislble = false
    ko.track(this)
  show: -&gt; @vislble = true
  hide: -&gt; @visible = false
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
17</pre></td><td class="code"><pre>class SimpleAlertModal extends BaseModal
  constructor: (@message = null) -&gt;
    super()

ko.components.register 'simple-alert-modal', {
  viewModel: -&gt; new SimpleAlertModal()
  template: { element: 'base-modal' }
}

class DetailAlertModal extends BaseModal
  constructor: (@title = null, @message = null) -&gt;
    super()

ko.components.register 'detail-alert-modal', {
  viewModel: -&gt; new DetailAlertModal()
  template: { element: 'base-modal' }
}
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
8</pre></td><td class="code"><pre>&lt;simple-alert-modal&gt;
  &lt;p data-bind="text: message"&gt;&lt;/p&gt;
&lt;/simple-alert-modal&gt;

&lt;detail-alert-modal&gt;
  &lt;h1 data-bind="text: title"&gt;&lt;/h1&gt;
  &lt;p data-bind="text: message"&gt;&lt;/p&gt;
&lt;/detail-alert-modal&gt;
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
10</pre></td><td class="code"><pre>class AppViewModel
  constructor: (@title = null) -&gt;
    ko.track(this)

$ -&gt;
  app_view = if gon?
    new AppViewModel(gon.title)
  else
    new AppViewModel()
  ko.appryBindings(app_view)
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
5</pre></td><td class="code"><pre>$ -&gt;
  # div.target data-title="タイトル" からデータ取得
  title = $('.target').data('title')
  app_view = new AppViewModel(title)
  ko.appryBindings(app_view)
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
2</pre></td><td class="code"><pre>&lt;app params="title: 'タイトル'"&gt;
&lt;/app&gt;
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "コンポーネント定義")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4</pre></td><td class="code"><pre>ko.components.register 'app', {
  viewModel: (params) -&gt; new AppViewModel(params.title)
  template: { element: 'app' }
}
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
5</pre></td><td class="code"><pre>&lt;% regions = Region.eager_load(:prefs).to_json(only: [:name],
                                               include: {prefs: {only: [:name]}} %&gt;
&lt;search-by-prefs params="regions: #{regions},
                         selected_prefs: #{params[:prefs]&amp;.to_json || []}"&gt;
&lt;/search-by-prefs&gt;
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "コンポーネント定義")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4</pre></td><td class="code"><pre>ko.components.register 'search-by-prefs', {
  viewModel: (params) -&gt; new SearchPrefs(params.regions, params.selected_prefs)
  template: { element: 'search-by-prefs' }
}
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
21</pre></td><td class="code"><pre>&lt;template id="search-by-prefs"&gt;
  &lt;%= form_with url: addresses_path, local: true do %&gt;
    &lt;dl data-bind="foreach: { data: regions, as: 'region' }"&gt;
      &lt;dt&gt;
        &lt;input type="checkbox" data-bind="value: region.name,
          checked: $parent.selected_regions,
          click: $parent.toggleRegion"&gt;
        &lt;span data-bind="text: region.name"&gt;&lt;/span&gt;
      &lt;/dt&gt;
      &lt;dd&gt;
        &lt;ul class="inline" data-bind="foreach: { data: region.prefs, as: 'pref' }"&gt;
          &lt;li&gt;
            &lt;input type="checkbox" name="prefs[]" data-bind="value: pref.name,
              checked: $parents[1].select_prefs"&gt;
            &lt;span data-bind="text: pref.name"&gt;&lt;/span&gt;
          &lt;/li&gt;
        &lt;/ul&gt;
      &lt;/dd&gt;
    &lt;/dl&gt;
  &lt;% end %&gt;
&lt;/template&gt;
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
12</pre></td><td class="code"><pre>class SearchPrefs
  constructor: (@regions, @selected_prefs) -&gt;
    @selected_regions = []
    ko.track(this, ['selected_regions', 'selected_prefs'])

  toggleRegion: (region) =&gt;
    pref_names = _.pluck(region.prefs, 'name')
    @selected_prefs = if _.includes(@selected_regions, region.name)
      _.union(@selected_prefs, pref_names)
    else
      _.difference(@selected_prefs, pref_names)
    true
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
