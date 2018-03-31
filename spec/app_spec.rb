require './app'
require 'pry'

describe App do

  purchases_url = '/purchases_url'
  subject(:app) { described_class.new(purchases_url) }

  it 'should initialize with a most_sold hash' do
    expect(subject.m_s).to be_a(Hash)
  end

  it 'should initialize with a purchases_url' do
    expect(subject.purchases_url).to eq purchases_url
  end

end
