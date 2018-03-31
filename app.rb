
require 'httparty'

# At this stage, all of the code is included in one App class.
# I anticipate that if I had the time to progress further through the task,
# I would have tried to refactor some of the code out into different objects.

class App

  attr_reader :m_s, :purchases_url

  def initialize(purchases_url)
    @m_s = {}
    @purchases_url = purchases_url
    @purchases_data = nil
  end

  def most_sold
    # this method is incomplete as of the 3 hour deadline, please treat as intended direction
    purchases_response
    @purchases_data[:data].each do |datapoint|
      if !@m_s[datapoint[:item]]
        @m_s[datapoint[:item]] = Array.new(datapoint[:spend].to_i)
      else
        @m_s[datapoint[:item]] << datapoint[:spend].to_i
      end
    end
    @m_s.sort_by { |k, v| v }.reverse
    @m_s[0]
  end

  private

  def purchases_response
    # similarly, I have not had a chance to test or run this yet, please treat as intended direction
    purchases_json = HTTParty.get(@purchases_url)
    @purchases_data = purchases_json.parsed_response
  end

end
