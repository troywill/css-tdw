#!/usr/bin/env perl
use strict;
use warnings;

my %colors = &get_colors;
my $default_css = &get_default_css;

########## Begin Section: User defined settings ##########
my $html_file = 'application.html.erb';
my $stylesheet_file = 'style.css';

# my $header_background_color = $colors{'r1'};
my $header_background_color = '#443266';

my $header_height = '15%';
$header_height = '1.5em';
# my $sidebar_background_color = 'rgb(207,226,243)';
my $sidebar_background_color = '#C3C3E5';
my $sidebar_width = '10em';
my $sidebar_top = $header_height;
# my $main_background_color = 'rgb(255,242,204)';
my $main_background_color = '#F1F0FF';


my $footer_height = '100px';
$footer_height = '1.5em';
# my $footer_background_color = $colors{'p1'};
my $footer_background_color = '#8C489F';

########## End Section: User defined settings ##########

open ( my $out, '>', $html_file) or die "$!: Unable to open $html_file for output";
open ( my $out_stylesheet, '>', $stylesheet_file) or die "$!: Unable to open $stylesheet_file for output";

my $xml_version = &xml_version;
my $document_type = &document_type;
my $html_element = &html_element;
my $head = &head;
my $validators = &validators;
my $body = &body;

# Build the html file from individual components
my $header = <<"END";
$xml_version
$document_type
$html_element
$head
$body
</html>
END

print $out $header;

my $stylesheet = &stylesheet;  # Write stylesheet
print $out_stylesheet $stylesheet;

########## Subroutines only below this line ##########

sub body {
  my $body = <<"END";
<body>
  <div id='header'>
      <h1>header</h1>
  </div>
  <div id='sidebar'>
      <%= link_to image_tag("troywill-logo.png"), root_path %>
      <h1>navigation</h1>
      <!-- see "Lists as Navigation", page 140, HTML Dog -->
      <!-- see "Doing Away With Unwanted Padding and Margins", page 144, HTML Dog -->
      <ul>
        <li><%= link_to "root", root_path %></li>
        <li>Run rake routes >> appliation.html.erb and edit to get links</li>
      </ul>
      <hr />
      <ul>
        <li><%= link_to "root", root_path %></li>
        <li>Run rake routes >> appliation.html.erb and edit to get links</li>
      </ul>
  </div>
  <div id='main'>
  <%= yield %>
  </div>
  <div id='footer'>
    <h1>footer</h1>
      $validators
  </div>
  </body>
END
  return $body;
}

sub head {
    my $head = <<END;
    <head>
	<title>title</title>
        <%= stylesheet_link_tag    "application", :media => "all" %>
        <%= javascript_include_tag "application" %>
        <%= csrf_meta_tags %>
  </head>
END

}

sub html_element {
    return '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">';
}

sub xml_version {
    return '<?xml version="1.0" encoding="UTF-8"?>';
}

sub document_type {
  return '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">';
}

sub validators {
    my $type1 = '<p><a href="http://validator.w3.org/check?uri=referer"><img src="http://www.w3.org/Icons/valid-xhtml10-blue" alt="Valid XHTML 1.0 Strict" height="31" width="88" /></a><a href="http://jigsaw.w3.org/css-validator/check/referer"><img style="border:0;width:88px;height:31px" src="http://jigsaw.w3.org/css-validator/images/vcss-blue" alt="Valid CSS!" /></a></p>';
    my $type2 = '<p><a href="http://validator.w3.org/check?uri=referer">XHTML validator</a><a href="http://jigsaw.w3.org/css-validator/check/referer">CSS validator</a></p>';
}

sub header_css {
  my $header_css = <<END;
#header {
  position: fixed;
  width: 100%;
  height: $header_height;
  top: 0;
  right: 0;
  bottom: auto;
  left: 0;
  color: white;
  background-color: $header_background_color;
  margin: 0;
  padding: 0;
  text-align: center;
}

#header h1 {
  font-size: 1em;
  margin: 0;
  padding: 0;
}    

END
  return $header_css;
}

sub sidebar_css {
  my $sidebar_css = <<END;
#sidebar {
  position: fixed;
  width: $sidebar_width;
  height: auto;
  top: $header_height;
  right: auto;
  bottom: $footer_height;
  left: 0;
  background-color: $sidebar_background_color
}

#sidebar ul {
 margin: 0;
 padding: 0;
 padding-left: .5em;
}

#sidebar img {
display: block;
margin-left: auto;
margin-right: auto;
}

END
  return $sidebar_css;
}


sub main_css {
  my $main_css = <<END;
#main {
  position: fixed;
  width: auto;
  height: auto;
  top: $header_height;
  right: 0;
  bottom: $footer_height;
  left: $sidebar_width;
  background-color: $main_background_color;
 overflow: auto;
}
END
  return $main_css;
}

sub footer_css {
  my $footer_css = <<END;
#footer {
  position: fixed;
  width: 100%;
  height: $footer_height;
  top: auto;
  right: 0;
  bottom: 0;
  left: 0;
  color: white;
  background-color: $footer_background_color;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  
}

#footer h1 {
    font-size: 1em;
    margin: 0;
    padding: 0;
    display: inline;
}

#footer p {
    display:inline;
}
END
  return $footer_css;
}

sub stylesheet {
  my $header_css = &header_css;
  my $sidebar_css = &sidebar_css;
  my $main_css = &main_css;
  my $footer_css = &footer_css;

  # See http://www.w3.org/TR/CSS21/sample.html
  my $stylesheet = <<"END";
$default_css
$header_css
$sidebar_css
$main_css
$footer_css
END

return $stylesheet;

}

sub get_default_css {

  my $default = <<'END';
html, address,
blockquote,
body, dd, div,
dl, dt, fieldset, form,
frame, frameset,
h1, h2, h3, h4,
h5, h6, noframes,
ol, p, ul, center,
dir, hr, menu, pre   { display: block }
li              { display: list-item }
head            { display: none }
table           { display: table }
tr              { display: table-row }
thead           { display: table-header-group }
tbody           { display: table-row-group }
tfoot           { display: table-footer-group }
col             { display: table-column }
colgroup        { display: table-column-group }
td, th          { display: table-cell }
caption         { display: table-caption }
th              { font-weight: bolder; text-align: center }
caption         { text-align: center }
body            { margin: 8px }
h1              { font-size: 2em; margin: .67em 0 }
h2              { font-size: 1.5em; margin: .75em 0 }
h3              { font-size: 1.17em; margin: .83em 0 }
h4, p,
blockquote, ul,
fieldset, form,
ol, dl, dir,
menu            { margin: 1.12em 0 }
h5              { font-size: .83em; margin: 1.5em 0 }
h6              { font-size: .75em; margin: 1.67em 0 }
h1, h2, h3, h4,
h5, h6, b,
strong          { font-weight: bolder }
blockquote      { margin-left: 40px; margin-right: 40px }
i, cite, em,
var, address    { font-style: italic }
pre, tt, code,
kbd, samp       { font-family: monospace }
pre             { white-space: pre }
button, textarea,
input, select   { display: inline-block }
big             { font-size: 1.17em }
small, sub, sup { font-size: .83em }
sub             { vertical-align: sub }
sup             { vertical-align: super }
table           { border-spacing: 2px; }
thead, tbody,
tfoot           { vertical-align: middle }
td, th, tr      { vertical-align: inherit }
s, strike, del  { text-decoration: line-through }
hr              { border: 1px inset }
ol, ul, dir,
menu, dd        { margin-left: 40px }
ol              { list-style-type: decimal }
ol ul, ul ol,
ul ul, ol ol    { margin-top: 0; margin-bottom: 0 }
u, ins          { text-decoration: underline }
br:before       { content: "\A"; white-space: pre-line }
center          { text-align: center }
:link, :visited { text-decoration: underline }
:focus          { outline: thin dotted invert }

/* Begin bidirectionality settings (do not change) */
BDO[DIR="ltr"]  { direction: ltr; unicode-bidi: bidi-override }
BDO[DIR="rtl"]  { direction: rtl; unicode-bidi: bidi-override }

*[DIR="ltr"]    { direction: ltr; unicode-bidi: embed }
*[DIR="rtl"]    { direction: rtl; unicode-bidi: embed }

@media print {
    h1            { page-break-before: always }
    h1, h2, h3,
    h4, h5, h6    { page-break-after: avoid }
    ul, ol, dl    { page-break-before: avoid }
}

/* http://www.htmldog.com/examples/inputcheckboxes.html June 10, 2008 */

fieldset {
    padding: 0 1em 1em 1em;
}

legend {
    padding: 1em;
}

label {
    float: left;
    width: 6em;
}
END

  return $default;
}

sub get_colors {
    my %colors = (
	'r1' => 'rgb(244,204,204)',
	'p1' => 'rgb(234,209,220)'
	);
    return %colors;
}
