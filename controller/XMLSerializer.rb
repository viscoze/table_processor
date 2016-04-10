require 'rexml/document'

class XMLSerializer
  include REXML

  def initialize(file_name, table)
    @table = table
    @xml_table = ""
    serialize
    create_file(file_name)
  end

  def serialize
    students = ""
    @table.each do |student|
      surname = "\n\t<surname>#{student[:surname]}</surname>"
      group   = "\n\t<group>#{student[:group]}</group>"
      marks   = get_students_marks(student[:marks])
      students += "\n<student>#{surname}#{group}#{marks}</student>"
    end
    @xml_table = "<students>#{students}\n</students>"
    puts @xml_table
  end

  private

  def get_students_marks(exams)
    subjects = ""
    exams.each do |subject, mark|
      subjects += "\n\t<subject>\n\t\t<title>#{subject}</title>\n\t\t<mark>#{mark}</mark>\n\t</subject>\n"
    end
    "\n<exams>#{subjects}</exams>\n"
  end

  def create_file(file_name)
    File.delete(file_name) if File.exist?(file_name)
    @file = File.open(file_name, "w+")
    @file.syswrite @xml_table
  end
end
