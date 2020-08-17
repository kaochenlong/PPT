class PagesController < ApplicationController
  def index
  end

  def about
  end

  def pricing
  end

  def payment
    @token = gateway.client_token.generate

    @plan = params[:plan]
    @price = plan_price(@plan)
  end

  def checkout
    result = gateway.transaction.sale(
      amount: plan_price(params[:plan]),
      payment_method_nonce: params[:nonce],
      options: {
        submit_for_settlement: true
      }
    )

    if result.success?
      # 轉換角色
      # current_user.update(role: "plan_#{params[:plan]}")
      redirect_to root_path, notice: '感謝乾爹！'
    else
      redirect_to root_path, notice: '付款發生錯誤'
    end
  end

  private
  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV["braintree_merchant_id"],
      public_key: ENV["braintree_public_key"],
      private_key: ENV["braintree_private_key"],
    )
  end

  def plan_price(plan)
    case plan
    when "a"
      ENV["plan_a_price"]
    when "b"
      ENV["plan_b_price"]
    else
      "參數錯誤"
    end
  end
end
