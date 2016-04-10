require './view/UserInterface'
require './controller/TableProcessor'
require './model/Table'

class Main
  def main
    UserInterface.new TableProcessor.new Table.new
  end
end

Main.new.main
