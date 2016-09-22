class EditsController < ApplicationController
  before_action :set_edit, only: [:show, :edit, :update, :destroy, :accept]

  # GET /edits
  # GET /edits.json
  def index
    @edits = Edit.all
  end

  # GET /edits/1
  # GET /edits/1.json
  def show
  end

  # GET /edits/new
  def new
    @edit = Edit.new
  end

  # GET /edits/1/edit
  def edit
  end

  # POST /edits
  # POST /edits.json
  def create
    @edit = Edit.new(edit_params)
    @edit.user = current_user
    respond_to do |format|
      if @edit.save
        format.html { redirect_to @edit.answer.question, notice: 'Правка успешно создана.' }
        format.json { render :show, status: :created, location: @edit }
      else
        format.html { render :new }
        format.json { render json: @edit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edits/1
  # PATCH/PUT /edits/1.json
  def update
    respond_to do |format|
      if @edit.update(edit_params)
        format.html { redirect_to @edit, notice: 'Edit was successfully updated.' }
        format.json { render :show, status: :ok, location: @edit }
      else
        format.html { render :edit }
        format.json { render json: @edit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edits/1
  # DELETE /edits/1.json
  def destroy
    @edit.destroy
    respond_to do |format|
      format.html { redirect_to edits_url, notice: 'Edit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    #if not user that created answer redirect to question page
    if current_user != @edit.answer.user
      redirect_to @edit.answer.question, notice: 'Принять правку может только автор вопроса.'
    else
      answer = @edit.answer
      #accept edit
      @edit.accept
      #change answer body
      answer.updateBody(params[:new_body])

      redirect_to answer.question, notice: 'Правка успешно принята.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edit
      @edit = Edit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edit_params
      params.require(:edit).permit(:body, :answer_id)
    end
end
