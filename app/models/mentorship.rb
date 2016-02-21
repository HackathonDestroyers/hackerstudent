class Mentorship < ActiveRecord::Base
  belongs_to :hacker
  belongs_to :student
  belongs_to :language

  before_create :generate_connection_code

  def full?
    !hacker_id.nil?
  end

  private

  def generate_connection_code
    begin
      self.connection_code = SecureRandom.hex
    end while self.class.exists?(connection_code: connection_code)
  end
end
