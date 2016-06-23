union = Side.create!(name: "The Union")
confederacy = Side.create!(name: "The Confederacy")

army_potomac = Army.create!(name: "Army of the Potomac", side: union)
army_tennessee = Army.create!(name: "Army of the Tennessee", side: union)
army_northern_va = Army.create!(name: "Army of Northern Virginia", side: confederacy)

grant = Player.create!(name: "Ulysses S. Grant", side: union, bio: "Supreme badass", birthdate: "1822-4-27")
lee = Player.create!(name: "Robert E. Lee", side: confederacy, bio: "Overrated Southerner", birthdate: "1807-1-17")

vicksburg = Campaign.create!(name: "Vicksburg Campaign", army: army_tennessee, begin_date:"1863-3-29", end_date:"1863-7-4")
maryland = Campaign.create!(name: "Maryland Campaign", army: army_northern_va, begin_date:"9-4-1862", end_date:"9-20-1862")