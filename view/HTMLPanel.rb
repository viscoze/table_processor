include Java

import javax.swing.JLabel
import javax.swing.JPanel

class HTMLPanel < JPanel
  attr_accessor :html_table

  def initialize
    super
    @html_table = JLabel.new
    self.add @html_table
  end

  def init
    @html_table.set_text()
  end


end
