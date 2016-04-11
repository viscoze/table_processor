include Java

import java.awt.BorderLayout
import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import javax.swing.JMenuBar
import javax.swing.JMenuItem
import javax.swing.JMenu

require './view/HTMLPanel'
require './view/dialogs/AddDialog'
require './view/dialogs/SearchDialog'

class UserInterface
  def initialize(table_processor = nil)
    @frame = JFrame.new
    @table_processor = table_processor

    initialize_menubar
    initialize_user_interface
    initialize_frame_settings
  end

  def initialize_frame_settings
    @frame.set_title "Table by Vlad"
    @frame.set_size 1000,800
    @frame.set_location_relative_to nil
    @frame.set_default_close_operation JFrame::EXIT_ON_CLOSE
    @frame.set_resizable false
    @frame.set_visible true
  end

  def initialize_user_interface
    mainPanel  = JPanel.new BorderLayout.new 3,1

    menuPanel  = initialize_menu_panel
    pagePanel  = initialize_paginate_panel
    tablePanel = HTMLPanel.new

    @table_processor.set_table_panel tablePanel
    @table_processor.render

    mainPanel.add menuPanel,  BorderLayout::NORTH
    mainPanel.add tablePanel, BorderLayout::CENTER
    mainPanel.add pagePanel,  BorderLayout::SOUTH

    @frame.getContentPane.add mainPanel
  end

  def initialize_menu_panel
    menuPanel    = JPanel.new
    addDialog    = AddDialog.new    @frame, @table_processor
    searchDialog = SearchDialog.new @frame, @table_processor

    createButton = JButton.new "Add New Student"
    searchButton = JButton.new "Search and Delete"

    createButton.add_action_listener { |e| addDialog.get_add_dialog }
    searchButton.add_action_listener { |e| searchDialog.get_search_dialog }

    menuPanel.add createButton
    menuPanel.add searchButton

    menuPanel
  end

  def initialize_paginate_panel
    pagePanel  = JPanel.new

    firstButton = JButton.new "First Page"
    lastButton  = JButton.new "Last Page"
    nextButton  = JButton.new "Next Page >"
    prevButton  = JButton.new "< Prev Page"

    paginText   = JTextField.new 4
    enterButton = JButton.new ">"

    enterButton.add_action_listener do |e|
      paginText.getText
    end

    pagePanel.add firstButton
    pagePanel.add prevButton
    pagePanel.add paginText
    pagePanel.add enterButton
    pagePanel.add nextButton
    pagePanel.add lastButton

    pagePanel
  end

  def initialize_menubar
    menubar   = JMenuBar.new
    file_menu = JMenu.new "File"

    open_item = JMenuItem.new "Open"
    save_item = JMenuItem.new "Save"
    exit_item = JMenuItem.new "Exit"
    default_open_item = JMenuItem.new "Open Default File"

    save_item.add_action_listener { |e| @table_processor.save }
    default_open_item.add_action_listener { |e| @table_processor.read }
    exit_item.add_action_listener { |e| @frame.dispose }

    file_menu.add open_item
    file_menu.add default_open_item
    file_menu.add_separator
    file_menu.add save_item
    file_menu.add_separator
    file_menu.add exit_item

    menubar.add file_menu

    @frame.setJMenuBar menubar
  end
end
