class FriendsTablesController < ApplicationController
  before_action :set_friends_table, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index,:show]
  before_action :correct_user, only: [:edit, :update,:destroy]
  # GET /friends_tables or /friends_tables.json
  def index
    @friends_tables = FriendsTable.all
  end

  # GET /friends_tables/1 or /friends_tables/1.json
  def show
  end

  # GET /friends_tables/new
  def new
    @friends_table = current_user.friends_table.build
  end

  # GET /friends_tables/1/edit
  def edit
  end

  def correct_user
    @friends_table = current_user.friends_table.find_by(id: params[:id])
    redirect_to friends_tables_path, notice:"Not Authorized to edit this friend" if @friends_table.nil?
  end

  # POST /friends_tables or /friends_tables.json
  def create
    #@friends_table = FriendsTable.new(friends_table_params)
    @friends_table = current_user.friends_table.build(friends_table_params)
    respond_to do |format|
      if @friends_table.save
        format.html { redirect_to @friends_table, notice: "Friends table was successfully created." }
        format.json { render :show, status: :created, location: @friends_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friends_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends_tables/1 or /friends_tables/1.json
  def update
    respond_to do |format|
      if @friends_table.update(friends_table_params)
        format.html { redirect_to @friends_table, notice: "Friends table was successfully updated." }
        format.json { render :show, status: :ok, location: @friends_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friends_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends_tables/1 or /friends_tables/1.json
  def destroy
    @friends_table.destroy
    respond_to do |format|
      format.html { redirect_to friends_tables_url, notice: "Friends table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friends_table
      @friends_table = FriendsTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friends_table_params
      params.require(:friends_table).permit(:first_name, :last_name, :email, :phone, :twitter)
    end
end
