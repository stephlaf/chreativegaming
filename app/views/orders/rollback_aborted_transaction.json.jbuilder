if @order.nil?
  json.response "No transaction to cancel, #{@order}"
else
  json.response "Transaction has been cancelled, #{@order.id}"
  json.reload "Reload"
end
