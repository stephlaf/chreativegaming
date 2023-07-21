if @order
  json.response "Transaction has been cancelled, #{@order.id}"
else
  json.response "No transaction to cancel"
  json.reload "Reload"
end
