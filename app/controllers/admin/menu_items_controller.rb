class Admin::MenuItemsController < AdminController
  before_action :find_menu_item, only: [:edit, :update, :destroy]

  def index
    @menu_items = MenuItem.all
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to admin_menu_items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @menu_item.update_attributes(menu_item_params)
      redirect_to admin_menu_items_path
    else
      render :edit
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to admin_menu_items_path
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :description, :vegetarian, :picture)
  end

  def find_menu_item
    @menu_item = MenuItem.find(params[:id])
  end
end
