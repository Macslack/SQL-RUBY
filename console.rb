require("pry-byebug")
require_relative("./models/bounty.rb")

Bounty.delete_all()

bounty1 = Bounty.new({
  "name" => "mad Max",
  "species" => "human",
  "bounty_value" => 2000,
  "last_known_location" => "earth"
  })
bounty1.save()
bounty2 = Bounty.new({
  "name" => "crazy bob",
  "species" => "dog",
  "bounty_value" => 3000,
  "last_known_location" => "mars"
  })
  bounty2.save()
  binding.pry
  return nil
