require 'active_record'
require 'yaml'

module Rdb2spreadsheet
  class RdbClient
    def initialize(configs)
      ActiveRecord::Base.default_timezone = :local # config.active_record.default_timezone
      ActiveRecord::Base.establish_connection(configs)
      @connection = ActiveRecord::Base.connection
    end

    def exec(sql)
      @connection.execute(sql)
    end

    def select(sql)
      return nil if sql.nil?
      result = @connection.select_all(sql)
      return nil if result.nil?
      return result.columns, result.rows
    end
  end
end
