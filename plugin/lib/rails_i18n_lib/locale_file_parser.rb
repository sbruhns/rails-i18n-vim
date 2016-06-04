class LocaleFileParser
  attr_accessor :parsed_content

  def initialize(locale_file)
    handler = LineNumberHandler.new
    parser =  Psych::Parser.new(handler)
    handler.parser = parser

    parser.parse locale_file
    @parsed_content = handler.root.to_ruby.first
  end

private
  class Psych::Nodes::Node
    attr_accessor :line
  end

  class LineNumberHandler < Psych::TreeBuilder

    attr_accessor :parser

    def scalar value, anchor, tag, plain, quoted, style
      mark = parser.mark
      s = super
      s.line = mark.line
      s
    end
  end

  class Psych::Visitors::ToRuby

    def revive_hash hash, o
      o.children.each_slice(2) { |k,v|
        key = accept(k)
        val = accept(v)

        if v.is_a? ::Psych::Nodes::Scalar
          val = { "value" => val, "line" => v.line + 1}
        end

        hash[key] = val
      }
      hash
    end
  end
end
