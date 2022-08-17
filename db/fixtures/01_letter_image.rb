LetterImage.seed(
  {
    id: 1,
    name: '手紙',
    image: File.open("#{Rails.root}/db/fixtures/images/letter_images/001.png"),
    height: 620,
    width: 820,
    font_size: 30,
    row_cnt: 24,
    row_gap: 10,
    start_top: 80,
    start_left: 50,
  },
)