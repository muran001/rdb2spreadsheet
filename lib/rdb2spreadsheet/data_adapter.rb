require 'rdb2spreadsheet/rdb_client'

module Rdb2spreadsheet
  class DataAdapter
    attr_reader :rdb_client, :spreadsheet_client

    def initialize(db_configs, spreadsheet_configs)
      @rdb_client = RdbClient.new(db_configs)
      @spreadsheet_client = SpreadsheetClient.new(spreadsheet_configs)
    end

    def import_all(book_key, sqls)
      @spreadsheet_client.open_book_by_key(book_key)
      sqls.each do |worksheet, sql|
        puts worksheet + ' updating'
        headers, records = @rdb_client.select(sql)
        next if headers.nil? || records.nil?
        @spreadsheet_client.update_worksheet(worksheet, headers, records)
        puts worksheet + ' updated'
      end
    end
  end
end
