include Java

import java.awt.BorderLayout
import java.awt.CardLayout
import javax.swing.JDialog
import javax.swing.JButton
import javax.swing.JTabbedPane
import javax.swing.JTextField
import javax.swing.BorderFactory
import javax.swing.JOptionPane

require './view/dialogs/SearchOption'

class SearchDialog < JDialog
  def initialize(frame, table_processor)
    super frame, "Search", false
    @table_processor = table_processor

    initialize_dialog
    initialize_dialog_interface
  end

  def get_search_dialog
    self.set_visible true
    self
  end

  private

  def initialize_dialog
    self.set_size 900,600
    self.set_location_relative_to nil
    self.set_default_close_operation JDialog::DISPOSE_ON_CLOSE
    self.set_resizable false
  end

  def initialize_dialog_interface
    basePanel  = JPanel.new BorderLayout.new 2,1
    mainPanel  = JPanel.new CardLayout.new
    tabbedPane = JTabbedPane.new
    tabsNames  = ["Group", "Surname and group","Exam mark","Subject mark"]

    search = SearchOption.new(@table_processor).get_all_search_option

    4.times { |index| tabbedPane.addTab tabsNames[index], search[index] }

    mainPanel.set_layout BorderLayout.new
    mainPanel.set_border BorderFactory.createTitledBorder "Choose the task"
    mainPanel.add tabbedPane

    basePanel.add mainPanel,     BorderLayout::CENTER
    self.add basePanel
  end
end
