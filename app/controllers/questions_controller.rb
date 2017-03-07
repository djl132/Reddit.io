class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

# DISPLAYS VIEW FOR Question AND TAKES IN Question DATA USING FORM_FOR, PASSING DATA TO CREATE
  def new
    @question = Question.new #USE Question OBJECT TO COLLECT DATA  AND PASS TO CREATE ACTION
  end

# CREATES AND SAVES NEW Question TO DB, REDIRECTING TO NEWLY CREATED Question AFTER
# TAKES IN: create new Question
  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]  # HERE PARAMS IS STORING Question INFORMATION

#update data, handle errors
    if @question.save
      # save a notice for DISPLAYING IN APPLCAITON LAYOUT.
      flash[:notice] = "Question was created."

      # THIS JUST CALLS THE GET REQUEST PASSING IN THE ID OF THE Question BY DEFAIULT IRHGT?
      redirect_to @question # HERE PARAMS IS STORING Question DATA
    else
      flash.now[:alert] = "There was an error saving the Question. Please try again."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id]) #STORING GET INFORMATION(URL QUERY PARAMS)
  end


   def destroy
     @question = Question.find(params[:id])

 # #8
     if @question.destroy
       flash[:notice] ="\"#{@question.title}\" was deleted successfully."
       redirect_to questions_path
     else
       flash.now[:alert] = "There was an error deleting the Question."
       render :show
     end
   end

   def update
      @question = Question.find(params[:id]) #is thsi query url paramertes from edit?
      @question.title = params[:question][:title]
      @question.body = params[:question][:body]

      if @question.save
        flash[:notice] = "Question updated."
        redirect_to @question
      else
        flash.now[:alert] = "Error updating. Try again."
        render :edit
      end
   end
end
