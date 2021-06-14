class CompaniesController < ApplicationController
    before_action :authenticate_member!
    before_action :check_auth, except: [:index, :show]
    before_action :set_company, only: [:update, :show, :destroy, :edit]
    before_action :set_users, only: [:new, :edit, :create, :update]

    def index
        @companies = Company.order(:name)
    end

    def show
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            redirect_to @company
        else
            flash.now[:errors] = @company.errors.full_messages
            render action: 'new'
        end
    end

    def edit
    end

    def update
        if @company.update(company_params)
            redirect_to @company
        else
            flash.now[:errors] = @company.errors.full_messages
            render action: 'edit'
        end
    end

    def destroy
        @company.destroy
        redirect_to companies_path
    end

    private

    def pundit_user
        current_member
    end

    def set_company
        @company = Company.find(params[:id])
    end

    def check_auth
        authorize Company
    end

    def set_users
        @users = User.order(:last_name)
    end

    def company_params
        params.require(:company).permit(:name, :user_id, :businessplan, :cost)
    end
end
