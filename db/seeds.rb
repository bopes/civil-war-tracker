union = Side.create!(name: "The Union")
confederacy = Side.create!(name: "The Confederacy")

army_potomac = Army.create!(name: "Army of the Potomac", side: union)
army_northern_va = Army.create!(name: "Army of Northern Virginia", side: confederacy)