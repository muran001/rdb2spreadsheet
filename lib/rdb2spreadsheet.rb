require 'rdb2spreadsheet/version'
require 'rdb2spreadsheet/spreadsheet_client'
require 'rdb2spreadsheet/data_adapter'

module Rdb2spreadsheet

  class << self
    def new(db_configs, spreadsheet_configs)
      return nil if db_configs.nil? || spreadsheet_configs.nil?
      Rdb2spreadsheet::DataAdapter.new(db_configs, spreadsheet_configs)
    end
  end
end
