require './app'

describe App do

  subject(:app) {described_class.new}

  it 'should initialize with a most_sold hash' do
    expect(app.m_s).to be_a(Hash)
  end

end
