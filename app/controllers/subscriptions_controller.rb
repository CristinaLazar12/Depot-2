class SubscriptionsController < ApplicationController

    before_action :set_subscription, only: [:show, :edit, :update, :destroy]

    
    def index
        @subscriptions = Subscription.all
    end

    def show
    end

    def new
        @subscription = Subscription.new
    end

    def edit
    end

    def create
        @subscription = Subscription.new(subscription_params)
     
        respond_to do |format|
            if @subscription.save
                format.html { redirect_to @subscription, notice: "Subscription was successfully created." }
                format.json { render :show, status: :created, location: @subscription }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @subscription.errors, status: :unprocessable_entity }
            end
        end  
    end


    def update
        respond_to do |format|
        if @subscription.update(subscription_params)
            format.html { redirect_to @subscription, notice: "Subscription was successfully updated." }
            format.json { render :show, status: :ok, location: @subscription }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @subscription.errors, status: :unprocessable_entity }
        end
        end
    end


    def destroy
        @subscription.destroy
        redirect_to subscriptions_path, notice: "Subscription deleted."
    end

    private

    def set_subscription
        @subscription = Subscription.find(params[:id])
    end

    def subscription_params
        params.require(:subscription).permit(:name, :price)
    end
end
