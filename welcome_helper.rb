module WelcomeHelper

  def sidebar_list
    array = ( 0 .. 100 ).to_a
    string = "<ul class='sidebar'>\n"
    array.each do | i |
      string = string + '<li>' + i.to_s + '</li>' + "\n"
    end
    string = string + "</ul>\n";
    return string
  end

  def sidebar
    return "<h1>Sidebar</h1>\n#{self.sidebar_list}".html_safe
  end

  def header
    return '<h1>Header</h1>'.html_safe
  end

  def main
    return "<h1>main</h1>\n<ul>\n<li><a href=""></a></li>\n<li><a href=""></a></li>\n</ul>\n".html_safe
  end

  def footer
    return "<p><a href='http://validator.w3.org/check?uri=referer'>XHTML validator</a> <a href='http://jigsaw.w3.org/css-validator/check/referer'>CSS validator</a></p>".html_safe
  end
  
end
