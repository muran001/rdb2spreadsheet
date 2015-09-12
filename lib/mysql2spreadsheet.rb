require 'mysql2spreadsheet/version'
require 'mysql2spreadsheet/spreadsheet_client'
require 'mysql2spreadsheet/data_adapter'

module Mysql2spreadsheet

  class << self
    def new(db_configs, spreadsheet_configs)
      Mysql2spreadsheet::DataAdapter.new(db_configs, spreadsheet_configs)
    end
  end
end
