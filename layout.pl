#!/usr/bin/env perl
use strict;
use warnings;

my %colors = &get_colors;

########## Begin Section: User defined settings ##########
my $html_file = 'css.html';
my $stylesheet_file = 'style.css';
my $header_background_color = $colors{'r1'};

my $header_height = '15%';
$header_height = '1.5em';
my $sidebar_background_color = 'rgb(207,226,243)';
my $sidebar_width = '10em';
my $sidebar_top = $header_height;
my $main_background_color = 'rgb(255,242,204)';

my $footer_height = '100px';
$footer_height = '50px';
my $footer_background_color = $colors{'p1'};

########## End Section: User defined settings ##########

open(OUT, ">$html_file");

my $xml_version = &xml_version;
my $document_type = &document_type;
my $html_element = &html_element;
my $head = &head;
my $validators = &validators;
my $body = &body;


my $header = <<"END";
$xml_version
$document_type
$html_element
$head
$body
</html>
END

print OUT $header;
&stylesheet;

########## Subroutines only below this line ##########

sub validators {
    return '<p><a href="http://validator.w3.org/check?uri=referer"><img src="http://www.w3.org/Icons/valid-xhtml10-blue" alt="Valid XHTML 1.0 Strict" height="31" width="88" /></a><a href="http://jigsaw.w3.org/css-validator/check/referer"><img style="border:0;width:88px;height:31px" src="http://jigsaw.w3.org/css-validator/images/vcss-blue" alt="Valid CSS!" /></a></p>';
}

sub body {
  my $body = <<"END";
<body>
  <div id='header'>
      <h1>header</h1>
  </div>
  <div id='sidebar'>
      <h1>sidebar</h1>
  </div>
  <div id='main'>
      <h1>main</h1>
      <ul>
      <li>http://troywill.com/i4y/css/css.html</li>
      <li>http://troywill.com/i4y/css/style.css</li>
      <li>http://losangeles.craigslist.org/sfv/cpg/1191803929.html</li>
      <li><a href='http://losangeles.craigslist.org/sfv/cpg/1191366011.html'>RoR Developer (Burbank)</a></li>
      <li><a href='http://www.smashingmagazine.com/2007/01/12/free-css-layouts-and-templates/'>Free CSS layouts</a></li>
      </ul>
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
    return '<head><link href="style.css" rel="stylesheet" type="text/css" /><title>Title</title></head>';
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
  background-color: $header_background_color;

  margin: 0;
  padding: 0;
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
  background-color: $footer_background_color;
}

#footer h1 {
/*   font-size: 1em; */
/*   display:inline; */
    float: left;
}

#footer p {
/*     display:inline; */
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
  open(STYLESHEET, '>style.css');
  my $stylesheet = <<"END";
html, address, blockquote, body,
dd, div, dl, dt,
fieldset, form, frame, frameset,
h1, h2, h3, h4, h5, h6,
noframes, ol, p, ul, center,
dir, hr, menu, pre   { display: block }
body { height: 8.5in }
$header_css
$sidebar_css
$main_css
$footer_css
END
  print STYLESHEET $stylesheet;
  close STYLESHEET;
}

sub get_colors {
    my %colors = (
	'r1' => 'rgb(244,204,204)',
	'p1' => 'rgb(234,209,220)'
	);
    return %colors;
}
