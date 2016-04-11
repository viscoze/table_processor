include Java

import javax.swing.JDialog
import javax.swing.JButton
import javax.swing.JTextField
import javax.swing.BorderFactory
import javax.swing.JTextArea
import javax.swing.JTable
import javax.swing.table.DefaultTableModel

class AddDialog < JDialog
  def initialize(frame, table_processor)
    super frame, "Search", false
    @table_processor = table_processor

    initialize_dialog
    initialize_dialog_interface
  end

  def get_add_dialog
    self.set_visible true
    self
  end

  def initialize_dialog
    self.set_size 500,400
    self.set_location_relative_to nil
    self.set_default_close_operation JDialog::DISPOSE_ON_CLOSE
    self.set_resizable false
  end

  def initialize_dialog_interface
    mainPanel    = JPanel.new BorderLayout.new
    enterPanel   = JPanel.new
    subjectPanel = JPanel.new

    surnameLabel = JLabel.new "Surname: "
    groupLabel   = JLabel.new "Group: "

    surnameText  = JTextField.new 10
    groupText    = JTextField.new 10

    table_model = DefaultTableModel.new(["Subject", "Mark"].to_java, 5)
    table       = JTable.new table_model

    addStudentButton = JButton.new "Add Student"
    addStudentButton.add_action_listener do |e|
      s  = surnameText.getText
      g  = groupText.getText
      sm = trans_table_to_hash table_model
      @table_processor.add_student s, g, sm
      @table_processor.render
    end

    subjectPanel.add table

    enterPanel.add surnameLabel
    enterPanel.add surnameText
    enterPanel.add groupLabel
    enterPanel.add groupText

    mainPanel.add enterPanel,       BorderLayout::NORTH
    mainPanel.add subjectPanel,     BorderLayout::CENTER
    mainPanel.add addStudentButton, BorderLayout::SOUTH

    self.add mainPanel
  end

  def trans_table_to_hash(table_model)
    subject_mark = {}
    table_model.getDataVector.each do |subject, mark|
      break if subject == "null" or subject == nil
      subject_mark.merge!({subject => mark})
    end
    subject_mark
  end
end
