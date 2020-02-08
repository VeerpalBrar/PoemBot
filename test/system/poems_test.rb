require "application_system_test_case"

class PoemsTest < ApplicationSystemTestCase
  setup do
    @poem = poems(:one)
  end

  test "visiting the index" do
    visit poems_url
    assert_selector "h1", text: "Poems"
  end

  test "creating a Poem" do
    visit poems_url
    click_on "New Poem"

    click_on "Create Poem"

    assert_text "Poem was successfully created"
    click_on "Back"
  end

  test "updating a Poem" do
    visit poems_url
    click_on "Edit", match: :first

    click_on "Update Poem"

    assert_text "Poem was successfully updated"
    click_on "Back"
  end

  test "destroying a Poem" do
    visit poems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Poem was successfully destroyed"
  end
end
