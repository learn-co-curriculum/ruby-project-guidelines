class Crypto < ActiveRecord::Base
    has_many :trades
    has_many :portfolios, through: :trades

    has_many :favorites 
    has_many :users, through: :favorites




    def self.top_20
        title = Artii::Base.new(:font => "slant")
        puts title.asciify("Top 20 Crypto's")
    end

end