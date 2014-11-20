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
end

scenario "User can see list of Cat's toys in the show page" do
 visit root_path
 click_on "Cats"
 expect(page).to have_content("Cats!")
 click_on "Kitty"
 expect(page).to have_content("This cat's toys are...")
 expect(page).to have_content("milk")

end

end
