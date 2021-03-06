require 'asciidoctor'
require 'asciidoctor/extensions'
# require 'pdf_block_macro'
# require 'pry'
module Faa
  module Asciidoctor

    include ::Asciidoctor
    class CwpMacro < Extensions::InlineMacroProcessor
      use_dsl

      named :cwp
      name_positional_attributes 'jcn'

      def process(parent, target, _attributes)
        jcn = target || attrs['jcn'] || parent.document.attr('jcn', '')
        text = "jcn: #{jcn}"
        target = %(https://corporateworkplan.faa.gov:7011/CWPPortal/faces/projects?pageId=null&searchString=null&jcn=1103807)
        parent.document.register :links, target
        (create_anchor parent, text, type: :link, target: target).render.to_s
      end
    end
  end
end
