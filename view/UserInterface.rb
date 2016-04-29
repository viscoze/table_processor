include Java

import java.awt.BorderLayout
import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import javax.swing.JMenuBar
import javax.swing.JMenuItem
import javax.swing.JMenu
import javax.swing.JFileChooser
import javax.swing.filechooser::FileNameExtensionFilter

require './view/dialogs/AddDialog'
require './view/dialogs/SearchDialog'
require './view/dialogs/DeleteDialog'
require './view/HTMLPanel'
require './view/UIHelper'

class UserInterface
  include UIHelper
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

    @table_processor.panel = tablePanel
    @table_processor.render

    mainPanel.add menuPanel,  BorderLayout::NORTH
    mainPanel.add tablePanel, BorderLayout::CENTER
    mainPanel.add pagePanel,  BorderLayout::SOUTH

    @frame.getContentPane.add mainPanel
  end
end
