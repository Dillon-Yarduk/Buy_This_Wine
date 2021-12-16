Rails.configuration.stripe = {
  publishable_key: "pk_test_51JtZKHKd52UTKY0TOA5NnTWMoZwvCe1hosIFG4gli6cl71jRXgCBg1rGfeLZuQKTdb5M5fTgsYg2MlkFo0oxrj3p00GIk2C0HX",
  secret_key:      "sk_test_51JtZKHKd52UTKY0TxeMn7tqlbC5uPrsfdyttsttraKeP74HlWoypgfXXskE0dW6O7c1dxD7EIyvrJUQdxzyGWzWb007vSyrHQ4"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
