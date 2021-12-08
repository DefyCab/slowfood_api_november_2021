# 1.We need a Product to order
# 2.We need a User to order that product
# 3. We need to create an order and associate with User
# 4. We need to associate the order with a product using a joint table we call OrderItem
# 5. Ideally the response should includer the order and the order items, so that this info can be used on the client side
#    (the minimum is to include the order_id in the response)

RSpec.describe 'POST /api/orders', type: :request do
  let(:user) { create(:user) }
  let!(:product) { create(:product) }
  subject { response }
  before do
    post '/api/orders', params: {
      order: {
        product_id: product.id, user_id: user.id
      }
    }
    @order = Order.last
  end

  it { is_expected.to have_http_status :created }

  it 'is expected to create an instance of order' do
    expect(@order).to_not eq nil
  end
  it 'is expected to associate order with user' do
    expect(@order.user).to eq user
  end
  it 'is expected to create an order_item' do
    expect(@order.items).to_not eq nil
  end
  it 'is expected to assosicate the product with the order' do
    expect(@order.products.first).to eq product
  end
  it 'is expected to include the ID of the order in the response body' do
    response_body = JSON.parse(response.body)
    expect(response_body['order']['id']).to eq @order.id
  end
end
    
