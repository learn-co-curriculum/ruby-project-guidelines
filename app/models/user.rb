class User < ActiveRecord::Base
    has_many :tickets
    has_many :events, through: :tickets

    def my_tickets
        Ticket.all.select {|t|t.user_id == self}
    end

    def my_upcoming_events
        self.my_tickets.map {|t|t.event}
    end

    def buy_ticket(event)
        Ticket.create(user_id: self.id, event_id: event.id)
    end
end