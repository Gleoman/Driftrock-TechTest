
require 'httparty'
require 'pry'

class App

  attr_reader :m_s, :purchases_url

  def initialize(purchases_url)
    @m_s = {}
    @purchases_url = purchases_url
  end

  def most_sold

  end

  private

  def purchases_response(purchases_url)
    purchases_json = HTTParty.get(purchases_url)
    purchases_json.parsed_response
  end

end
