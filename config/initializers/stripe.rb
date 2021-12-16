# Rails.configuration.stripe = {
#   publishable_key: ENV["PUBLISHABLE_KEY"],
#   secret_key:      ENV["SECRET_KEY"]
# }

Stripe.api_key = Rails.configuration.stripe["sk_test_51JtZKHKd52UTKY0TxeMn7tqlbC5uPrsfdyttsttraKeP74HlWoypgfXXskE0dW6O7c1dxD7EIyvrJUQdxzyGWzWb007vSyrHQ4"]
