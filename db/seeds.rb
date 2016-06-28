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
loc_appomattox = Location.create!(city: "Appomattox", state: "Virginia", county: "Appomattox", lat: 37.3775, long: -78.796)
loc_jackson = Location.create!(city: "Jackson", state: "Mississippi", county: "Hinds", lat: 32.298889, long: -90.184722)

# events
# event_vicksburg_camp = Event.create!(desc: "Vicksburg Campaign", begin_date: "1863-3-29", link: camp_vicksburg, location: loc_vicksburg)
# event_vicksburg_siege = Event.create!(desc: "Siege of Vicksburg", begin_date: "1863-5-18", end_date: "1863-7-4", location: loc_vicksburg)
# event_antietam = Event.create!(desc: "Battle of Antietam", begin_date: "1862-9-17", location: loc_antietam)
# event_appomattox = Event.create!(desc: "Lee's Surrender to Grant at Appomattox Court House", begin_date: "1865-4-9", location: loc_appomattox)

#battles
vicksburg = Battle.create!(name: "Siege of Vicksburg", campaign: camp_vicksburg, begin_date: "1863-5-18", end_date: "1863-7-4", victor: union, conclusion: "Surrender", description: "Grant besieges Vicksburg", location: loc_vicksburg)
antietam = Battle.create!(name: "Battle of Antietam", campaign: camp_maryland, begin_date: "1862-9-17", victor: union, conclusion: "Retreat", description: "Bloodiest day in American history", location: loc_antietam)
jackson_miss = Battle.create!(name: "Battle of Jackson, Mississippi", campaign: camp_vicksburg, begin_date: "1863-5-14", victor: union, conclusion: "Retreat", description: "Johnston was unable to defend the city against approaching Union forces and ordered an evacuation of the town.", location: loc_jackson)

#events
surrender_of_vicksburg = Event.create!(name: "Surrender of Vicksburg", campaign: camp_vicksburg, begin_date: "1863-7-4", description: "Vicksburg surrendered to Grant after 2 month siege", location: loc_vicksburg)