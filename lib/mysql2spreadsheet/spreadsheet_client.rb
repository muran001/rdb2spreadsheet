require 'google_drive'
require 'yaml'

module Mysql2spreadsheet
  class SpreadsheetClient
    OAUTH = {
      site:         'https://accounts.google.com',
      token_url:    '/o/oauth2/token',
      autorize_url: '/o/oauth2/auth'
    }

    def initialize(c)
      oauth2 = OAuth2::Client.new(c['client_id'], c['client_secret'], OAUTH)
      auth_token = OAuth2::AccessToken.from_hash(oauth2, refresh_token: c['refresh_token'], expires_at: 3600)
      auth_token = auth_token.refresh!
      @session = GoogleDrive.login_with_oauth(auth_token.token)
    end

    def open_book_by_key(key)
      @book = @session.spreadsheet_by_key(key)
    end

    def update_worksheet(worksheet_title, headers, records)
      return if @book.nil? || worksheet_title.nil? || records.nil?

      begin
        target = find_or_create_worksheet_by_title(worksheet_title)

        headers.each.with_index(1) do |header, index|
          target[1, index] = header
        end

        records.each.with_index(2) do |row, row_index|
          row.each.with_index(1) do |column, col_index|
            target[row_index, col_index] = column
          end
          target.save if row_index % 100 == 0
        end
        target.save
      rescue => e
        puts e.message
      end
    end

    private

    def find_or_create_worksheet_by_title(title)
      worksheet = @book.worksheet_by_title(title)
      worksheet = @book.add_worksheet(title, 1, 1) if worksheet.nil?
      worksheet
    end
  end
end
