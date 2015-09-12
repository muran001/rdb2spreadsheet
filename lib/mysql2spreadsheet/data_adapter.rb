require 'mysql2spreadsheet/mysql_client'

module Mysql2spreadsheet
  class DataAdapter
    attr_reader :mysql_client, :spreadsheet_client

    def initialize(db_configs, spreadsheet_configs)
      @mysql_client = MysqlClient.new(db_configs)
      @spreadsheet_client = SpreadsheetClient.new(spreadsheet_configs)
    end

    def import_all(book_key, sqls)
      @spreadsheet_client.open_book_by_key(book_key)
      sqls.each do |worksheet, sql|
        headers, records = @mysql_client.select(sql)
        next if headers.nil? || records.nil?
        @spreadsheet_client.update_worksheet(worksheet, headers, records)
      end
    end
  end
end
