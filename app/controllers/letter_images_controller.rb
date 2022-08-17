class LetterImagesController < ApplicationController
  before_action :set_letter_image, only: %i[ show edit update destroy ]

  # GET /letter_images or /letter_images.json
  def index
    @letter_images = LetterImage.all
  end

  # GET /letter_images/1 or /letter_images/1.json
  def show
  end

  # GET /letter_images/new
  def new
    @letter_image = LetterImage.new
  end

  # GET /letter_images/1/edit
  def edit
  end

  # POST /letter_images or /letter_images.json
  def create
    @letter_image = LetterImage.new(letter_image_params)

    respond_to do |format|
      if @letter_image.save
        format.html { redirect_to letter_image_url(@letter_image), notice: "Letter image was successfully created." }
        format.json { render :show, status: :created, location: @letter_image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @letter_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letter_images/1 or /letter_images/1.json
  def update
    respond_to do |format|
      if @letter_image.update(letter_image_params)
        format.html { redirect_to letter_image_url(@letter_image), notice: "Letter image was successfully updated." }
        format.json { render :show, status: :ok, location: @letter_image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @letter_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letter_images/1 or /letter_images/1.json
  def destroy
    @letter_image.destroy

    respond_to do |format|
      format.html { redirect_to letter_images_url, notice: "Letter image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter_image
      @letter_image = LetterImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def letter_image_params
      params.require(:letter_image).permit(:name, :image, :height, :width, :font_size, :row_cnt, :row_gap, :start_top, :start_left)
    end
end
