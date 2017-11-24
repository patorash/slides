# knockout.jsのcomponentの使い方

%author: 株式会社リゾーム @patorash

%icon: ![](patorash.png)

%duration: 30min

### 目次

* knockout-componentの概要
* シンプルな実装
* ViewModelとViewを分けた実装
* 共通テンプレートを使う
* コンポーネントに引数を渡す方法

### withは場合によっては使うべきではない

* withはturbolinksとの相性が悪い
* 戻るボタンで戻った際に、以前の表示のhtmlの状態でwithブロックが評価され、foreachの評価時に予期しない表示になる


### knockout-componentを使おう！

## knockout-componentとは？

* ViewModelとViewの定義をまとめたもの
* componentとして登録されたものは、独自タグで使える
* ViewModelとViewの定義を1つのファイルにまとめられる
* Viewを別ファイルに定義することもできる

## シンプルなコンポーネント

* ViewModelとViewが1つになっていて見易い
* Viewを探す手間が省ける

```coffee
class AppViewModel
  constructor: (@title = null) ->
    ko.track(this)

ko.components.register 'app', {
  viewModel: -> new AppViewModel()
  template: """
    <h1 data-bind="text: title"></h1>
  """
}
```

## 使うとき

* 独自タグ（カスタムエレメント）になる

```html
<body>
  <app></app>
</body>
```

### ViewModelとViewを1つのファイルにする方法

メリット

* ファイルが散らばらないので探す手間が省ける

デメリット

* 素のHTMLを書かなければならない
* Railsのヘルパーメソッド類が使えない

### ViewModelとViewを分離する(ViewModel側)

templateに、template要素のidを指定する。

```coffee
class AppViewModel
  constructor: (@title = null) ->
    ko.track(this)

ko.components.register 'app', {
  viewModel: -> new AppViewModel()
  template: { element: 'app' }
}
```

### ViewModelとViewを分離する(View側)

templateタグにid="app"をつける。
こちらはRailsのViewに定義できるのでヘルパーも使える。

```html
<template id="app">
  <h1 data-bind="text: title"></h1>
</template>
```

### 使うとき

コンポーネントを使うときには、テンプレートも書き出しておく。

```html
<body>
  <app></app>
  <template id="app">
    <h1 data-bind="text: title"></h1>
  </template>
</body>
```

### 使うとき(Rails風)

layout

```erb
<body>
  <%= yield %>
</body>
```

view(erb, slim, haml)

```erb
<app></app>
<%= render 'shared/ko-templates/app' %>
```

### ViewModelとViewを分ける方法

メリット

* ViewをRailsの世界で扱える

デメリット

* 時々テンプレートをrenderし忘れる


## Viewを分ける(Advance)

共通項目が多いんだけれど、一部だけ違う場合。例えば…

```html
<div class="modal" data-bind="visible: visible">
  <p data-bind="text: message"></p>
  <button type="button" data-bind="click: close">閉じる</button>
</div>
```

と

```html
<div class="modal" data-bind="visible: visible">
  <h1 data-bind="text: title"></h1>
  <p data-bind="text: message"></p>
  <button type="button" data-bind="click: hide">閉じる</button>
</div>
```

## 共通テンプレートを定義する

## 共通テンプレートを定義する

base-articleテンプレートを定義する。

```html
<template id="base-modal">
  <div class="modal" data-bind="visible: visible">
    <!-- ko template: { nodes: $componentTemplateNodes } -->
    <!-- /ko -->
    <button type="button" data-bind="click: hide">閉じる</button>
  </div>
</template>
```

## 各々のViewModelを定義する

まずベースクラスを定義

```coffee
class @BaseModal
  constructor: ->
    @visible = false
    ko.track(this)
  show: -> @visible = true
  hide: -> @visible = false
```

## ベースクラスを継承したクラスを定義

```coffee
class SimpleAlertModal extends BaseModal
  constructor: (@message = null) ->
    super()

ko.components.register 'simple-alert-modal', {
  viewModel: -> new SimpleAlertModal()
  template: { element: 'base-modal' }
}

class DetailAlertModal extends BaseModal
  constructor: (@title = null, @message = null) ->
    super()

ko.components.register 'detail-alert-modal', {
  viewModel: -> new DetailAlertModal()
  template: { element: 'base-modal' }
}
```

### 共通テンプレートを使う

```html
<simple-alert-modal>
  <p data-bind="text: message"></p>
</simple-alert-modal>

<detail-alert-modal>
  <h1 data-bind="text: title"></h1>
  <p data-bind="text: message"></p>
</detail-alert-modal>
```

## コンポーネントに引数を渡す

昔は、以下のようにgonを経由してしていた。  
gon経由は、gonの存在チェックが面倒😫
かつgonのスコープがglobalなのがよくない👎

```coffee
class AppViewModel
  constructor: (@title = null) ->
    ko.track(this)

$ ->
  app_view = if gon?
    new AppViewModel(gon.title)
  else
    new AppViewModel()
  ko.appryBindings(app_view)
```

## コンポーネントに引数を渡す

もしくは、data attributeを使っていた。  
この方法も、idまたはclassを指定するのがよくない👎

```coffee
$ ->
  # div.target data-title="タイトル" からデータ取得
  title = $('.target').data('title')
  app_view = new AppViewModel(title)
  ko.appryBindings(app_view)
```

## コンポーネントに引数を渡す

knockout-componentなら、直接渡すことができる😂  
引数の変数スコープもコンポーネント定義箇所に絞られる👍

View

```html
<app params="title: 'タイトル'">
</app>
```

コンポーネント定義

```coffee
ko.components.register 'app', {
  viewModel: (params) -> new AppViewModel(params.title)
  template: { element: 'app' }
}
```

## 実用的な例①

View

```erb
<% regions = Region.eager_load(:prefs).to_json(only: [:name],
                                               include: {prefs: {only: [:name]}} %>
<search-by-prefs params="regions: #{regions},
                         selected_prefs: #{params[:prefs]&.to_json || []}">
</search-by-prefs>
```

コンポーネント定義

```coffee
ko.components.register 'search-by-prefs', {
  viewModel: (params) -> new SearchPrefs(params.regions, params.selected_prefs)
  template: { element: 'search-by-prefs' }
}
```

----

View(template)

```erb
<template id="search-by-prefs">
  <%= form_with url: addresses_path, local: true do %>
    <dl data-bind="foreach: { data: regions, as: 'region' }">
      <dt>
        <input type="checkbox" data-bind="value: region.name,
          checked: $parent.selected_regions,
          click: $parent.toggleRegion">
        <span data-bind="text: region.name"></span>
      </dt>
      <dd>
        <ul class="inline" data-bind="foreach: { data: region.prefs, as: 'pref' }">
          <li>
            <input type="checkbox" name="prefs[]" data-bind="value: pref.name,
              checked: $parents[1].select_prefs">
            <span data-bind="text: pref.name"></span>
          </li>
        </ul>
      </dd>
    </dl>
  <% end %>
</template>
```

----

ViewModel

```coffee
class SearchPrefs
  constructor: (@regions, @selected_prefs) ->
    @selected_regions = []
    ko.track(this, ['selected_regions', 'selected_prefs'])

  toggleRegion: (region) =>
    pref_names = _.pluck(region.prefs, 'name')
    @selected_prefs = if _.includes(@selected_regions, region.name)
      _.union(@selected_prefs, pref_names)
    else
      _.difference(@selected_prefs, pref_names)
    true
```

## knockout-component化することで…

* ViewからJSのViewModelにJSON形式で直接値を渡せる  
（橋渡し役が不要に）
* フォーム絡みのViewModelでクエリパラメータ経由の値の復元が楽になる（地味にすごくありがたい🙏）
* 再利用可能になる😀😀😀