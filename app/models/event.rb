class Event < ActiveRecord::Base
    has_many :tickets
    has_many :users, through: :tickets

    def date_display_format
        date = self.date.split("-")
        "#{Date::MONTHNAMES[date[1].to_i]} #{date[2].to_i}, #{date[0].to_i}"
    end

    def event_display_format
        "#{self.attraction_name}. Current status: #{self.event_status.capitalize}. Scheduled for #{self.date_display_format}, at #{self.venue}."
    end
end