require_relative 'recipient'
require 'pry'


class User < Recipient
  
  attr_reader :slack_id, :user_name, :real_name, :detail
  
  # URL = "https://slack.com/api/users.list"
  # KEY = ENV['SLACK_TOKEN']
  
  def initialize(slack_id:, user_name:, real_name:, detail:) 
    # super(slack_id:, name:)
    @user_name = user_name
    @real_name = real_name
    @slack_id = slack_id
    @detail = detail
  end
  
  
  
  
  def self.list
    
    response = self.get("https://slack.com/api/users.list")["members"]
    # response = HTTParty.get(URL, query: {token: KEY})
    # members = response["members"]
    # binding.pry
    
    users = []
    response.each do |member|
      user = self.new(slack_id: member["id"], real_name: member["real_name"], user_name: member["name"], detail: member["profile"]["status_text"])
      users << user
    end
    return users
  end
  
  # users.each do |user| 
  #   puts use
  # end
  
end


