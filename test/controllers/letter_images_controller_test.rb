require "test_helper"

class LetterImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @letter_image = letter_images(:one)
  end

  test "should get index" do
    get letter_images_url
    assert_response :success
  end

  test "should get new" do
    get new_letter_image_url
    assert_response :success
  end

  test "should create letter_image" do
    assert_difference("LetterImage.count") do
      post letter_images_url, params: { letter_image: { font_size: @letter_image.font_size, height: @letter_image.height, image: @letter_image.image, name: @letter_image.name, row_cnt: @letter_image.row_cnt, row_gap: @letter_image.row_gap, start_left: @letter_image.start_left, start_top: @letter_image.start_top, width: @letter_image.width } }
    end

    assert_redirected_to letter_image_url(LetterImage.last)
  end

  test "should show letter_image" do
    get letter_image_url(@letter_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_letter_image_url(@letter_image)
    assert_response :success
  end

  test "should update letter_image" do
    patch letter_image_url(@letter_image), params: { letter_image: { font_size: @letter_image.font_size, height: @letter_image.height, image: @letter_image.image, name: @letter_image.name, row_cnt: @letter_image.row_cnt, row_gap: @letter_image.row_gap, start_left: @letter_image.start_left, start_top: @letter_image.start_top, width: @letter_image.width } }
    assert_redirected_to letter_image_url(@letter_image)
  end

  test "should destroy letter_image" do
    assert_difference("LetterImage.count", -1) do
      delete letter_image_url(@letter_image)
    end

    assert_redirected_to letter_images_url
  end
end
