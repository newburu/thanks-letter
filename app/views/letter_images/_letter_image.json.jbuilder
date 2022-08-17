json.extract! letter_image, :id, :name, :image, :height, :width, :font_size, :row_cnt, :row_gap, :start_top, :start_left, :created_at, :updated_at
json.url letter_image_url(letter_image, format: :json)
