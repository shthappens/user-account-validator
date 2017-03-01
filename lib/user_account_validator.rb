require 'pry'

class EmailMissingError < StandardError; end

class UserAccountValidator

  attr_reader :email, :username, :name

  def initialize(user)
    @email = user[:email]
    @username = user[:username]
    @name = user[:name]
  end

  def validate
    if email_missing?
      raise EmailMissingError
    elsif email_symbol_missing? || username_missing?
      raise raise "A valid email address or username is missing."
    end
  end

  def email_missing?
    if email.nil?
      raise EmailMissingError
    else
      return false
    end
  end

  def email_symbol_missing?
    !@email.include?('@')
  end

  def username_missing?
    @username.nil?
  end

end
