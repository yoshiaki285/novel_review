class CustomersController < ApplicationController
  def show
    @customer = current_customer
    @bookmarks = @customer.Bookmark.all
  end
  
  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to my_page_path
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_sesssion
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end
end
