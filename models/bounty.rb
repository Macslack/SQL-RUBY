require("pg")

class Bounty
  attr_reader :id
  attr_accessor :name, :species, :bounty_value, :last_known_location
  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @species = options["species"]
    @bounty_value = options["bounty_value"].to_i
    @last_known_location = options["last_known_location"]
  end

  def save()
    db = PG.connect({ dbname:"bounties", host:"localhost"})
    sql ="INSERT INTO bounties (name, species, bounty_value, last_known_location) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@name, @species, @bounty_value, @last_known_location]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close()
    @id = result[0]["id"].to_i
  end

  def update()
    db = PG.connect({ dbname:"bounties", host:"localhost"})
    sql ="UPDATE bounties SET (name, species, bounty_value, last_known_location) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @species, @bounty_value, @last_known_location, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    db = PG.connect({ dbname:"bounties", host:"localhost"})
    sql ="DELETE FROM bounties WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end
  def self.find_by_name(name)
    db = PG.connect({ dbname:"bounties", host:"localhost"})
    sql ="SELECT * FROM bounties WHERE name = $1"
    db.prepare("find_by_name", sql)
    values = [name]
    result = db.exec_prepared("find_by_name", values)
    db.close()
    return Bounty.new(result[0])
  end
  def self.find_by_id(id)
    db = PG.connect({ dbname:"bounties", host:"localhost"})
    sql ="SELECT * FROM bounties WHERE id = $1"
    db.prepare("find_by_id", sql)
    values = [id]
    result = db.exec_prepared("find_by_id", values)
    db.close()
    return Bounty.new(result[0])
  end

end
