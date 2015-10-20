require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  before do
    FactoryGirl.create(:project, name: "Atom text")

    visit "/"
    click_link "Atom text"
    click_link "Edit Project"
  end

  scenario "With valid attributes" do
    fill_in "Name", with: "Atom text"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Atom text"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
  end
end
