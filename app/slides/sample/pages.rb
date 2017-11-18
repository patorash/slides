class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "Hello Gibier")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "youchan")
      children << p({className:"icon"}, p({class:""}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
      children << p({className:"duration"}, "1min")
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def content
  [].tap do |children|
      children << h4(nil, "Press 's' then start race of the hunter and the rabbit.")
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def content
  [].tap do |children|
      children << h4(nil, "Press right key then go next page!")
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def header
  h2(nil, "Listing")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2</pre></td><td class="code"><pre>* Listing item
* ...
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "render as shown on the next page")
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def header
  h2(nil, "Listing")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Listing item"),
                    li(nil, "...")
      )
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def header
  h2(nil, "Font size")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5</pre></td><td class="code"><pre>### H3

#### H4

default font
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "render as shown on the next page")
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def header
  h3(nil, "H3")
end

def content
  [].tap do |children|
      children << h4(nil, "H4")
      children << p(nil, "default font")
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def header
  h2(nil, "Image")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>%large: ![](gibier.jpg)
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def header
  h2(nil, "Image")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/gibier.jpg"}, "")))
  end
end
end

Gibier.page_count = 9
Gibier.title = "Hello Gibier"
