class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    readers.pluck(:email).join ";"
  end

  def self.most_popular
    self.all.max_by {|m| m.subscriptions.length}
  end

end