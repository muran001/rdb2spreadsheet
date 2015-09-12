require 'active_record'
require 'yaml'

module Mysql2spreadsheet
  class MysqlClient
    def initialize(configs)
      ActiveRecord::Base.establish_connection(configs)
      @connection = ActiveRecord::Base.connection
    end

    def select(sql)
      return nil if sql.nil?
      result = @connection.select_all(sql)
      return nil if result.nil?
      return result.columns, result.rows
    end
  end
end
