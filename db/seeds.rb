Match.destroy_all
Arena.destroy_all
Team.destroy_all

t1 = Team.create(name: "Liverpool")
t2 = Team.create(name: "Manchester City")

a1 = Arena.create(name: "First Arena")
a2 = Arena.create(name: "Second Arena")

# m1 = Match.create(date: "#{Time.now}", home_team_id: t1.id, away_team_id: t2.id, home_team_goals: 3, away_team_goals: 2, arena_id: a1.id)


puts "Bingo!"