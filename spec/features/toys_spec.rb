require 'rails_helper'

feature "Cats" do
  before do
    cat = Cat.create!(
    name: "Kitty"
    )
  toy = Toy.create!(
  name: "milk",
  cat_id: cat.id
  )

  Cat.create!(
    name: "Killer"
    )
  Toy.create!(
    name: "knife",
    cat_id: cat.id
    )


end

  scenario "Toy index page should show the cats that own the toys" do
    visit root_path
    click_on "Toys"
    expect(page).to have_content ("Toys!")
    expect(page).to have_content ("Kitty")
  end

  scenario "Toy show page should list the cat that owns that toy (toys are not shared)" do
    visit toys_path
    expect(page).to have_content ("milk")
    click_on "milk"
    expect(page).to have_content ("Kitty")

  end

  scenario "Toys can be selected in the new page" do
    visit toys_path
    click_on "New Toy!"
    expect(page).to have_content ("New Toy!")
    fill_in "Name", with: "killer bunny"
    select "Killer", from: "toy_cat_id"
    click_on "Create Toy"
    expect(page).to have_content("killer bunny")
  end


end
