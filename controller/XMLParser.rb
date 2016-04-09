require 'rexml/document'

class XMLParser
  include REXML

  attr_reader :table

  def initialize(file_name)
    @table  = []
    @xmldoc = Document.new File.new file_name
  end

  def parse
    @xmldoc.elements.each("students/student") do |student|
      student_info = {}
      puts student.elements("surname")
    end
  end


end
