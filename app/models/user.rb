class User < ActiveRecord::Base
    has_many :tickets
    has_many :events, through: :tickets

    def my_upcoming_events
        self.tickets.map {|t|t.event}
    end

    def buy_ticket(event)
        Ticket.create(user_id: self.id, event_id: event.id)
    end
end