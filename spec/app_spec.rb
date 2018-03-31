
require './app'

describe App do
  purchases_url = '/purchases_url'
  subject(:app) { described_class.new(purchases_url) }

  it 'should initialize with a most_sold hash' do
    expect(subject.m_s).to be_a(Hash)
  end

  it 'should initialize with a purchases_url' do
    expect(subject.purchases_url).to eq purchases_url
  end

  describe '#purchases_response' do
    # this is both i) testing a private method and ii) not passing but I wanted to
    # incude this to indicate some thoughts around stubbing the API re:
    # if I had more time
    let(:response) { double :response, :parsed_response => "json_data"}
    it 'should provide a parsed json response' do
      HTTParty.stub(:get) { :response }
      expect(subject.purchases_response(purchases_url)).to eq "json data"
    end
  end
end
