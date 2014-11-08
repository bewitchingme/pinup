# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  event_types = EventType.create([
    { name: "dance" },
    { name: "theatre" },
    { name: "spoken word / literature" },
    { name: "visual arts" },
    { name: "classical" },
    { name: "pop" },
    { name: "rock" },
    { name: "punk" },
    { name: "hip hop" },
    { name: "R&B" },
    { name: "reggae" },
    { name: "blues" },
    { name: "jazz" },
    { name: "electronic music" },
    { name: "alternative" },
    { name: "experimental" },
    { name: "world" },
    { name: "mixed media" }
  ])