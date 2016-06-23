# sides
union = Side.create!(name: "The Union")
confederacy = Side.create!(name: "The Confederacy")

# armies
army_potomac = Army.create!(name: "Army of the Potomac", side: union)
army_tennessee = Army.create!(name: "Army of the Tennessee", side: union)
army_northern_va = Army.create!(name: "Army of Northern Virginia", side: confederacy)

# players
grant = Player.create!(name: "Ulysses S. Grant", side: union, bio: "Supreme badass", birthdate: "1822-4-27")
lee = Player.create!(name: "Robert E. Lee", side: confederacy, bio: "Overrated Southerner", birthdate: "1807-1-17")

# campaigns
camp_vicksburg = Campaign.create!(name: "Vicksburg Campaign", army: army_tennessee, begin_date:"1863-3-29", end_date:"1863-7-4")
camp_maryland = Campaign.create!(name: "Maryland Campaign", army: army_northern_va, begin_date:"9-4-1862", end_date:"9-20-1862")

# ranks
grant_1 = Rank.create!(player: grant, title: "Brigadier General", begin_date: "1861-5-17", end_date: "1864-3-2", army: army_tennessee)
grant_2 = Rank.create!(player: grant, title: "Lieutenant General", begin_date: "1864-3-3", army: army_potomac)

# locations
loc_vicksburg = Location.create!(city: "Vicksburg", state: "Mississippi", county: "Warren", lat: 32.336111, long: -90.875278)
loc_antietam = Location.create!(city: "Sharpsburg", state: "Maryland", county: "Washington", lat: 39.457778, long: -77.749444)

