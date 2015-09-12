require 'spec_helper'

describe Rdb2spreadsheet do
  it 'has a version number' do
    expect(Rdb2spreadsheet::VERSION).not_to be nil
  end

  let(:empty_instance) { Rdb2spreadsheet.new(nil, nil) }
  it 'cannot create instance' do
    expect(empty_instance).to be_nil
  end
end
