require_relative "../../test_helper"

class Faa::Asciidoctor::ExtensionTest < Minitest::Test
  def setup
    @doc = Asciidoctor::Document.new
  end

  def test_cwp_macro_renders_correct_link
    cwp_macro = Faa::Asciidoctor::CwpMacro.new
    parent = @doc
    target = "12345"
    attrs = {"text" => "Test CWP"}
    result = cwp_macro.process(parent, target, attrs)
    puts result

    assert result.include?("Test CWP")
    assert result.include?("https://corporateworkplan.faa.gov:7011/CWPPortal/faces/projects?pageId=null&searchString=null&jcn=12345")
  end

  def test_ormp_macro_renders_correct_link
    ormp_macro = Faa::Asciidoctor::OrmpMacro.new
    parent = @doc
    target = nil
    attrs = {}
    result = ormp_macro.process(parent, target, attrs)

    assert result.include?("ORMP Search Form")
    assert result.include?("https://ormp.faa.gov")
  end

  def test_document_conversion_includes_macros
    asciidoc_content = <<~DOC
      = Test Document

      This is a test document using CWP and ORMP macros.

      == CWP Macro Example

      To link to a CWP project, use the CWP macro like this: cwp:12345[text=Test CWP].

      == ORMP Macro Example

      To link to the ORMP search form, use the ORMP macro like this: ormp:12345[].
    DOC

    doc = Asciidoctor.load(asciidoc_content, header_footer: true)
    result = doc.convert
    puts "result\n#{result}"

    assert result.include?("Test CWP")
    assert result.include?("https://corporateworkplan.faa.gov:7011/CWPPortal/faces/projects?pageId=null&searchString=null&jcn=12345")
    assert result.include?("ORMP Search Form")
    assert result.include?("https://ormp.faa.gov")
  end
end
