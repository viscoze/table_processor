require 'rexml/document'

class XMLParser
  include REXML

  attr_reader :table

  def initialize(file_name)
    @table = []
    set_file(file_name)
    parse
  end

  def parse
    @xmldoc.elements.each("students/student") do |student|
      surname = get_child_text(student, 'surname')
      group   = get_child_text(student, 'group')
      marks   = get_students_marks(student)
      @table.push({surname: surname,group: group, marks: marks})
    end
  end

  private

  def set_file(file_name)
    @xmldoc = Document.new File.new file_name
  end

  def get_child_text(object,category)
    object.elements[category].text
  end

  def get_students_marks(student)
    marks = {}
    student.elements.each('exams/subject') do |subject|
      title = get_child_text(subject, 'title')
      mark  = get_child_text(subject, 'mark')
      marks.merge!({title => mark})
    end
    marks
  end

end
