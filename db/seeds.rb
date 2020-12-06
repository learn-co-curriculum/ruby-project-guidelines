Match.destroy_all
Arena.destroy_all
Team.destroy_all

t1 = Team.new(name: "Liverpool")
t2 = Team.new(name: "Manchester City")

a1 = Arena.new(name: "First Arena")
a2 = Arena.new(name: "Second Arena")

m1 = Match.new(date: "#{Time.now}", home_team_id: t1.id, away_team_id: t2.id, home_team_goals: 3, away_team_goals: 2, arena_id: a1.id)


puts "Bingo!"