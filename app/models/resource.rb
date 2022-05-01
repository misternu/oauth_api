class Resource < ApplicationRecord
  belongs_to :user
  before_create :generate_secret

  private

  def generate_secret
    self.secret = SecureRandom.base36(10)
  end
end
