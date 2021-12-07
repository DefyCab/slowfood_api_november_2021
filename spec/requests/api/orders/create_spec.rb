# 1.We need a Product to order
# 2.We need a User to order that product
# 3. We need to create an order and associate with User
# 4. We need to associate the order with a product using a joint table we call OrderItem

RSpec.describe 'POST /api/orders', type: :request do
  let(:user) { create(:user) }
  subject { response }
  before do
    post '/api/orders', params: { order: { product_id: 1, user_id: user.id } }
  @order = Order.last
  end

  it { is_expected.to have_http_status :created }

  it 'is expected to create an instance of order' do
  expect(@order).to_not eq nil
  end

  it 'is expected to associate order with user'do
  expect(@order.user).to eq user
    end
  
end
