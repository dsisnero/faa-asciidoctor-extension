require "asciidoctor"
require "asciidoctor/extensions"
# require 'pdf_block_macro'
module Faa
  module Asciidoctor
    include ::Asciidoctor
    class CwpMacro < Extensions::InlineMacroProcessor
      use_dsl

      named :cwp
      name_positional_attributes "text"

      def process(parent, target, attrs)
        doc = parent.document
        jcn = target
        url = %(https://corporateworkplan.faa.gov:7011/CWPPortal/faces/projects?pageId=null&searchString=null&jcn=#{jcn})
        text = attrs["text"] || "CWP: #{jcn}"
        doc.register :links, target
        (create_anchor parent, text, type: :link, target: url, attributes: {"title" => jcn}).render
      end
    end

    class OrmpMacro < Extensions::InlineMacroProcessor
      use_dsl

      named :ormp

      def process(parent, target, attrs)
        doc = parent.document
        url = %(https://ormp.faa.gov)
        text = "ORMP Search Form"
        doc.register :links, url
        (create_anchor parent, text, type: :link, target: url).render
      end
    end
  end
end

Asciidoctor::Extensions.register do
  inline_macro Faa::Asciidoctor::CwpMacro
  inline_macro Faa::Asciidoctor::OrmpMacro
end
