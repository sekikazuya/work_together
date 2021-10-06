class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @companies = Company.order('created_at DESC')
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to user_profile_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to user_profile_path(current_user)
  end

  private

  def company_params
    params.require(:company).permit( :image, :name, :name_kana, :sector_id, :industry_id, :profile,
                                     :prefecture_id, :city, :building_name, :phone, :business_hours).merge(user_id: current_user.id)
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def move_to_index
    if user_signed_in? && current_user.id != @company.user.id
      redirect_to action: :index
    end
  end

end
