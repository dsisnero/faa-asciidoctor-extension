= faa-asciidoctor-extension

home  :: https://github.com/dsisnero/faa-asciidoctor-extension
code  :: https://github.com/dsisnero/faa-asciidoctor-extension
rdoc  :: https://github.com/dsisnero/faa-asciidoctor-extension
bugs  :: https://github.com/dsisnero/faa-asciidoctor-extension
... etc ...

== DESCRIPTION:

Extensions for Asciidoctor that help in FAA projects

== FEATURES/PROBLEMS:


== SYNOPSIS:

asciidoctor-pdf -r faa-asciidoctor-extension transmittal.adoc

== REQUIREMENTS:

asciidoctor

== INSTALL:

source "https://rubygems.org"

gem "rails"

source "https://rubygems.pkg.github.com/dsisnero" do
  gem "faa-asciidoctor-extension"
end

== DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

== LICENSE:

(The MIT License)

Copyright (c) 2019 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
