# 1.We need a Product to order
# 2.We need a User to order that product
# 3. We need to create an order and associate with User
# 4. We need to associate the order with a product using a joint table we call OrderItem

RSpec.describe 'POST /api/orders' do
  subject { response }
  before do
    post '/api/orders', params: { order: { product_id: 1, user_id: 1 } }
  end

  it { is_expected.to have_http_status :created }
end
