class ChatListItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_chat_list_item, only: %i[ show edit update destroy ]

  # GET /chat_list_items or /chat_list_items.json
  def index
    @chat_list_items = ChatListItem.all
  end

  # GET /chat_list_items/1 or /chat_list_items/1.json
  def show
  end

  # GET /chat_list_items/new
  def new
    @chat_list_item = ChatListItem.new
  end

  # GET /chat_list_items/1/edit
  def edit
  end

  # POST /chat_list_items or /chat_list_items.json
  def create
    @chat_list_item = ChatListItem.new(chat_list_item_params)

    respond_to do |format|
      if @chat_list_item.save
        format.html { redirect_to @chat_list_item, notice: "Chat list item was successfully created." }
        format.json { render :show, status: :created, location: @chat_list_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_list_items/1 or /chat_list_items/1.json
  def update
    respond_to do |format|
      if @chat_list_item.update(chat_list_item_params)
        format.html { redirect_to @chat_list_item, notice: "Chat list item was successfully updated." }
        format.json { render :show, status: :ok, location: @chat_list_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_list_items/1 or /chat_list_items/1.json
  def destroy
    @chat_list_item.destroy
    respond_to do |format|
      format.html { redirect_to chat_list_items_url, notice: "Chat list item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_list_item
      @chat_list_item = ChatListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_list_item_params
      params.fetch(:chat_list_item, {})
    end
end
