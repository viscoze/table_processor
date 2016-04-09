require './view/user_interface'
require './controller/TableProcessor'
require './controller/XMLParser'

class Main
  def main
    # UserInterface.new TableProcessor.new Table.new
    xml = XMLParser.new "XML_TEST/LIST_OF_STUDENTS.xml"
    xml.parse
  end
end

Main.new.main
