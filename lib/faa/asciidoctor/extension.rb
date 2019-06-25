require 'asciidoctor'
require 'asciidoctor/extensions'
# require 'pdf_block_macro'
# require 'pry'
module Faa
  module Asciidoctor
    VERSION = '0.0.6'.freeze

    include ::Asciidoctor
    class CwpMacro < Extensions::InlineMacroProcessor
      use_dsl

      named :cwp
      name_positional_attributes 'jcn'

      def process(parent, target, _attributes)
        jcn = target || attrs['jcn'] || parent.document.attr('jcn', '')
        text = "jcn: #{jcn}"
        target = %(https://corporateworkplan.faa.gov:7011/CWPPortal/faces/projects?jcn=#{jcn}&pageId=44&searchString=null)
        parent.document.register :links, target
        (create_anchor parent, text, type: :link, target: target).render.to_s
      end
    end
  end
end
