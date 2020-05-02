package model

// DB mapping and throw to client as raw
type AquariumDB struct{
    Ip string `db:"ip" json:"ip"`
    Background int `db:"background" json:"background"`
    Plant00 int `db:"plant00" json:"plant00"`
    Plant01 int `db:"plant01" json:"plant01"`
    Plant02 int `db:"plant02" json:"plant02"`
    Plant03 int `db:"plant03" json:"plant03"`
    Plant04 int `db:"plant04" json:"plant04"`
    Plant05 int `db:"plant05" json:"plant05"`
    Plant06 int `db:"plant06" json:"plant06"`
    Plant07 int `db:"plant07" json:"plant07"`
    Plant08 int `db:"plant08" json:"plant08"`
    Plant09 int `db:"plant09" json:"plant09"`
    Creature00 int `db:"creature00" json:"creature00"`
    Creature01 int `db:"creature01" json:"creature01"`
    Creature02 int `db:"creature02" json:"creature02"`
    Creature03 int `db:"creature03" json:"creature03"`
    Creature04 int `db:"creature04" json:"creature04"`
    Creature05 int `db:"creature05" json:"creature05"`
    Creature06 int `db:"creature06" json:"creature06"`
    Creature07 int `db:"creature07" json:"creature07"`
    Creature08 int `db:"creature08" json:"creature08"`
    Creature09 int `db:"creature09" json:"creature09"`
    Creature10 int `db:"creature10" json:"creature10"`
    Creature11 int `db:"creature11" json:"creature11"`
    Creature12 int `db:"creature12" json:"creature12"`
    Creature13 int `db:"creature13" json:"creature13"`
    Creature14 int `db:"creature14" json:"creature14"`
    Creature15 int `db:"creature15" json:"creature15"`
    Creature16 int `db:"creature16" json:"creature16"`
    Creature17 int `db:"creature17" json:"creature17"`
    Creature18 int `db:"creature18" json:"creature18"`
    Creature19 int `db:"creature19" json:"creature19"`
}

// For receive client
type Aquarium struct{
    BackgroundID  int64   `json:"background_id"`
    PlantIDs      [10]int64 `json:"plant_ids"`
    CreatureIDs   [20]int64 `json:"creature_ids"`
}

type User struct {
    IP       string
    Aquarium Aquarium
}
