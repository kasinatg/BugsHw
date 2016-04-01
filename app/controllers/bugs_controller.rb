class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  before_action :all_bugs, only:[:index, :create, :destroy, :update]
  before_action :set_statuses, :set_issuetypes, :set_priorities
  
  respond_to :html, :js
  
  def all_bugs
     @bugs = Bug.all
  end

  # GET /bugs
  # GET /bugs.json
  def index
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
  end

  # GET /bugs/1/edit
  def edit
  end
  
  def create
    @bug = Bug.new(bug_params)
    user = User.find(bug_params[:user_id])
    @bug.build_user(:id => user.id)
    @bug.save!
    @current_bug = @bug
  end 

  # POST /bugs
  # POST /bugs.json
  # def create
  #   @bug = Bug.new(bug_params)

  #   respond_to do |format|
  #     if @bug.save
  #       format.html { redirect_to @bug, notice: 'Bug was successfully created.' }
  #       format.json { render :show, status: :created, location: @bug }
        
  #       user = User.find(bug_params[:user_id])
  #       @bug.build_user(:id => user.id)
  #     else
  #       format.html { render :new }
  #       format.json { render json: @bug.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /bugs/1
  # PATCH/PUT /bugs/1.json
  # def update
  #   respond_to do |format|
  #     if @bug.update(bug_params)
  #       format.html { redirect_to @bug, notice: 'Bug was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @bug }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @bug.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  # def destroy
  #   @bug.destroy
  #   respond_to do |format|
  #     format.html { redirect_to bugs_url, notice: 'Bug was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  
  def update
     @bug.update!(bug_params)
  end
  
  def destroy
    @bug.destroy!
  end
  
   def set_statuses
    @statuses = Bug.statuses
   end
  
  def set_priorities
    @priorities = Bug.priorities
  end
  
  def set_issuetypes
    @issuetypes = Bug.issuetypes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bug_params
      params.require(:bug).permit(:title, :description, :issuetype, :priority, :status, :user_id)
    end
end
