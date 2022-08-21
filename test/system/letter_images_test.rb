require "application_system_test_case"

class LetterImagesTest < ApplicationSystemTestCase
  setup do
    @letter_image = letter_images(:one)
  end

  test "visiting the index" do
    visit letter_images_url
    assert_selector "h1", text: "Letter images"
  end

  test "should create letter image" do
    visit letter_images_url
    click_on "New letter image"

    fill_in "Font size", with: @letter_image.font_size
    fill_in "Height", with: @letter_image.height
    fill_in "Image", with: @letter_image.image
    fill_in "Name", with: @letter_image.name
    fill_in "Row cnt", with: @letter_image.row_cnt
    fill_in "Row gap", with: @letter_image.row_gap
    fill_in "Start left", with: @letter_image.start_left
    fill_in "Start top", with: @letter_image.start_top
    fill_in "Width", with: @letter_image.width
    click_on "Create Letter image"

    assert_text "Letter image was successfully created"
    click_on "Back"
  end

  test "should update Letter image" do
    visit letter_image_url(@letter_image)
    click_on "Edit this letter image", match: :first

    fill_in "Font size", with: @letter_image.font_size
    fill_in "Height", with: @letter_image.height
    fill_in "Image", with: @letter_image.image
    fill_in "Name", with: @letter_image.name
    fill_in "Row cnt", with: @letter_image.row_cnt
    fill_in "Row gap", with: @letter_image.row_gap
    fill_in "Start left", with: @letter_image.start_left
    fill_in "Start top", with: @letter_image.start_top
    fill_in "Width", with: @letter_image.width
    click_on "Update Letter image"

    assert_text "Letter image was successfully updated"
    click_on "Back"
  end

  test "should destroy Letter image" do
    visit letter_image_url(@letter_image)
    click_on "Destroy this letter image", match: :first

    assert_text "Letter image was successfully destroyed"
  end
end
