class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        subscriptions.create(price: price, magazine: magazine)
        # Subscription.create(price: price, magazine:magazine, reader: self)
    end

    def total_subscription_price
        subscriptions.sum(:price)
    end

    def cancel_subscription(magazine)
        subscriptions.find_by(magazine: magazine).delete
        # subscriptions.find_by(magazine: magazine).destroy
    end

end