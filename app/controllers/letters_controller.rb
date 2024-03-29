class LettersController < ApplicationController
  before_action :set_letter, only: %i[ show edit update destroy ]

  # GET /letters or /letters.json
  def index
    @q = Letter.ransack(user_id_eq: current_user.try(:id))
    @pagy, @letters = pagy(@q.result)
  end

  # GET /letters/1 or /letters/1.json
  def show
  end

  # GET /letters/new
  def new
    @letter = Letter.new
  end

  # GET /letters/1/edit
  def edit
    authorize @letter
  end

  # POST /letters or /letters.json
  def create
    @letter = Letter.new(letter_params)
    @letter.user = current_user

    respond_to do |format|
      if @letter.save
        format.html { redirect_to edit_letter_url(@letter), notice: "作成しました。" }
        format.json { render :show, status: :created, location: @letter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letters/1 or /letters/1.json
  def update
    authorize @letter

    respond_to do |format|
      if @letter.update(letter_params)
        format.html { redirect_to edit_letter_url(@letter), notice: "更新しました。" }
        format.json { render :show, status: :ok, location: @letter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1 or /letters/1.json
  def destroy
    authorize @letter

    @letter.destroy

    respond_to do |format|
      format.html { redirect_to letters_url, notice: "削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def letter_params
      params.require(:letter).permit(:subject, :letter_image_id, :content, :image)
    end
end
