Owner.destroy_all
Tank.destroy_all
TankOwnerIds.destroy_all
Fish.destroy_all

bart = Owner.create(name: "bart")
dom = Owner.create(name: "dom")
max = Owner.create(name: "max")
derick = Owner.create(name: "derick")

tank1 = Tank.create(name: "tank1", fish_limit: 5)
tank2 = Tank.create(name: "tank2", fish_limit: 5)
tank3 =Tank.create(name: "tank3", fish_limit: 5)
tank4 =Tank.create(name: "tank4", fish_limit: 5)

tank_owner_id_1 = TankOwnerIds.create(owner_id: bart.id, tank_id: tank1.id)
tank_owner_id_2 = TankOwnerIds.create(owner_id: dom.id, tank_id: tank2.id)
tank_owner_id_3 = TankOwnerIds.create(owner_id: max.id, tank_id: tank3.id)
tank_owner_id_4 = TankOwnerIds.create(owner_id: derick.id, tank_id: tank4.id)
tank_owner_id_5 = TankOwnerIds.create(owner_id: dom.id, tank_id: tank1.id)

nemo = Fish.create(name: "nemo", color: "orange", tank_id: tank1.id)
dory = Fish.create(name: "dory", color: "blue", tank_id: tank2.id)
guppy = Fish.create(name: "guppy", color: "gold", tank_id: tank3.id)
sharky = Fish.create(name: "sharky", color: "blue", tank_id: tank4.id)

